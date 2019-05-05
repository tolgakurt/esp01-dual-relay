const Client = require('azure-iothub').Client;
const Storage = require('azure-storage');
const uuid = require('uuid/v1');
const connectionStrings = require('../connectionStrings');

// Connection string for service access policy.
const client = Client.fromConnectionString(connectionStrings.service);
const tableService = Storage.createTableService(connectionStrings.storage);

module.exports = (context, req) => {
  context.log('Hello. Processing.');

  // Check if the query contains a device id and body contains an action.
  if (!req.body || !req.body.deviceId || !req.body.action) {
    context.log('Need action and device id.');
    context.res = {
      status: 400,
      contentType: 'application/json',
      body: { message: 'Cihaz ID bilgisi ya da aksiyon bulunamadı.' }
    };
    context.done(); return;
  }

  const deviceId = req.body.deviceId;
  const action = req.body.action;

  context.log(`Received action (${action}) for device (${deviceId}).`);

  // Check if the action is a defined one.
  if (action !== 'openCurtain' && action !== 'closeCurtain') {
    context.log('Invalid action.');
    context.res = {
      status: 400,
      contentType: 'application/json',
      body: { message: 'Tanımsız komut.' }
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

    // Invoke device method.
    const params = {
      connectTimeoutInSeconds: 30,
      responseTimeoutInSeconds: 30,
      methodName: action,
      payload: null
    };
    client.invokeDeviceMethod(deviceId, params, (err, res) => {
      if (err) {
        context.log(`Cannot send message to the device: ${err.toString()}`);
        context.res = {
          status: 500,
          contentType: 'application/json',
          body: { message: 'Mesaj cihaza iletilemiyor. Cihazın açık ve internete bağlı olduğundan emin olup tekrar deneyiniz.' }
        };
        context.done(); return;
      }

      context.log('Invoke device method status: ' + res.constructor.name);

      // Add action to the table storage.
      const tableItem = {
        PartitionKey: "Partition",
        RowKey: uuid(),
        Timestamp: Date.now(),
        Epoch: parseInt((new Date).getTime() / 1000, 10),
        DeviceId: deviceId,
        Action: action
      };
      // Used { echoContent: true } to return the created item including the Timestamp & etag.
      tableService.insertEntity('action', tableItem, { echoContent: true }, (err, result, response) => {
        // Log whether storage operation failed or succeeded, but don't return.
        if (err) {
          context.log('Action could not be saved in database.', err);
        }
        else {
          context.log('Action is saved in database.');
        }

        // Respond success to user and close the IoT Hub Connection.
        context.res = {
          status: 200,
          contentType: 'application/json',
          body: { message: 'Cihaz komutu iletildi.' }
        };
        context.done();
        client.close();
        return;
      });
    });
  });
};