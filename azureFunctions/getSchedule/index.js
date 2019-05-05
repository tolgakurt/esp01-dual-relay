const Registry = require('azure-iothub').Registry;
const Storage = require('azure-storage');
const connectionStrings = require('../connectionStrings');

// Connection string for registryRead access policy
const registry = Registry.fromConnectionString(connectionStrings.registryRead);
const tableService = Storage.createTableService(connectionStrings.storage);

module.exports = (context, req) => {
  context.log('Hello. Processing.');

  // Check if the query contains a device id.
  if (!req.query || !req.query.deviceId) {
    context.log('Need device id.');
    context.res = {
      status: 400,
      contentType: 'application/json',
      body: { message: 'Please pass a device id in the request query.' }
    };
    context.done(); return;
  }

  const deviceId = req.query.deviceId;
  context.log(`Received a valid user request for device (${deviceId}).`);

  // Ask IoT Hub registry if that device exists ...
  registry.get(deviceId, (err, deviceInfo, res) => {
    if (err) {
      // ... and return the error if not.
      context.log(`Error getting device (${deviceId}).`, err);
      let message = err.name;
      if (err.name === 'DeviceNotFoundError') message = 'Cihaz ID bilgisini doğru girdiğinizden emin olup tekrar deneyiniz.';
      context.res = {
        status: 404,
        contentType: 'application/json',
        body: { message: message }
      };
      context.done(); return;
    }

    // ... and make sure if the device is enabled.
    if (deviceInfo.status != 'enabled') {
      context.log(`The device (${deviceId}) is not enabled.`);
      context.res = {
        status: 405,
        contentType: 'application/json',
        body: { message: `Cihaz etkin değil: ${deviceInfo.statusReason}` }
      };
      context.done(); return;
    }

    // Look at the storage if there is a schedule set for this device.
    context.log(`Querying the schedule table for device (${deviceId}).`);
    const tableQuery = new Storage.TableQuery().where('DeviceId eq ?', deviceId);
    const options = { payloadFormat: "application/json;odata=nometadata" };
    tableService.queryEntities('schedule', tableQuery, null, options, (err, result, response) => {
      // Return if there is an error while querying the table.
      if (err) {
        context.log('Error querying schedule table.', err);
        context.res = {
          status: 500,
          contentType: 'application/json',
          body: { message: 'Sistemde bir hata oluştu. Tekrar deneyiniz.' }
        };
        context.done(); return;
      }

      // Return an empty schedule if there is no previously set schedule.
      if (result.entries.length === 0) {
        context.log(`No previously set schedule for device (${deviceId}).`);
        context.res = {
          status: 200,
          contentType: 'application/json',
          body: { schedule: [] }
        };
        context.done(); return;
      }

      // Sort the retrieved entities by their Epoch to get the most recent schedule set.
      const entries = response.body.value;
      entries.sort((a, b) => b.Epoch - a.Epoch);
      context.log(`Sending latest set schedule (${entries[0].Schedule}) to device(${deviceId}).`);
      context.res = {
        status: 200,
        contentType: 'application/json',
        body: { schedule: JSON.parse(entries[0].Schedule) }
      };
      context.done();
    });
  });
};