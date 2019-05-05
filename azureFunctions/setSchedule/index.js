const Client = require('azure-iothub').Client;
const Message = require('azure-iot-common').Message;
const Storage = require('azure-storage');
const uuid = require('uuid/v1');
const connectionStrings = require('../connectionStrings');

// Connection string for service access policy.
const client = Client.fromConnectionString(connectionStrings.service);
const tableService = Storage.createTableService(connectionStrings.storage);

module.exports = (context, req) => {
  context.log('Hello. Processing.');

  // Check if the query contains a device id and body contains a schedule.
  if (!req.body || !req.body.deviceId || !req.body.schedule) {
    context.log('Need device id and schedule.');
    context.res = {
      status: 400,
      contentType: 'application/json',
      body: { message: 'Cihaz ID bilgisi ya da ayarları bulunamadı.' }
    };
    context.done(); return;
  }

  const deviceId = req.body.deviceId;
  const schedule = req.body.schedule;

  context.log(`Received schedule (${schedule}) for device (${deviceId}).`);

  // Each schedule item needs to have 4 numbers in it: day, hour, minute, action code.
  if (schedule.some(item => item.length !== 4)) {
    context.log('Schedule does not fit the format.');
    context.res = {
      status: 400,
      contentType: 'application/json',
      body: { message: 'Schedule does not fit the format.' }
    };
    context.done(); return;
  }

  // Create a connection to IoT Hub.
  client.open(err => {
    if (err) {
      context.log(`Client could not connect to IOT Hub: ${err.message}`);
      context.res = {
        status: 500,
        contentType: 'application/json',
        body: { message: 'Iot Hub bağlantı hatası. Tekrar deneyiniz.' }
      };
      context.done(); return;
    }

    context.log('Client connected to IOT Hub.');

    // Create a binary message to be sent to the device out of schedule and send it.
    let flatSchedule = [];
    if (schedule.length > 0 ) flatSchedule = schedule.reduce((a, b) => a.concat(b)); // Flatten the schedule.
    const message = new Message(Buffer.from(flatSchedule));
    client.send(deviceId, message.getBytes(), (err, res) => {
      if (err) {
        context.log(`Cannot send message to the device: ${err.toString()}`);
        context.res = {
          status: 500,
          contentType: 'application/json',
          body: { message: 'Mesaj cihaza iletilemiyor. Tekrar deneyiniz.' }
        };
        context.done(); return;
      }

      context.log(`Cloud to device message status: ${res.constructor.name}`);

      // Add schedule to the table storage.
      const tableItem = {
        PartitionKey: 'Partition',
        RowKey: uuid(),
        Timestamp: Date.now(),
        Epoch: parseInt((new Date).getTime() / 1000, 10),
        DeviceId: deviceId,
        Schedule: JSON.stringify(schedule)
      };
      // Used { echoContent: true } to return the created item including the Timestamp & etag.
      tableService.insertEntity('schedule', tableItem, { echoContent: true }, (err, result, response) => {
        // Log whether storage operation failed or succeeded, but don't return.
        if (err) {
          context.log('Valid request. But could not be saved in database.', err);
        }
        else {
          context.log('Device schedule saved in database.');
        }

        // Respond success to user and close the IoT Hub Connection.
        context.res = {
          status: 200,
          contentType: 'application/json',
          body: { message: 'Cihaz ayarlandı.' }
        };
        context.done();
        client.close();
        return;
      });
    });
  });
};