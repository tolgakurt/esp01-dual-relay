const Storage = require('azure-storage');
const uuid = require('uuid/v1');
const connectionStrings = require('../connectionStrings');

const tableService = Storage.createTableService(connectionStrings.storage);

module.exports = (context, IoTHubMessages) => {
  context.log('JavaScript eventhub trigger function called for message array: ' + IoTHubMessages + ' from: ' + context.bindingData.systemPropertiesArray[0]["iothub-connection-device-id"]);

  IoTHubMessages.forEach(message => {
      context.log(`Processed message: ${message}`);
      const tableItem = {
        PartitionKey: "Partition",
        RowKey: uuid(),
        Timestamp: Date.now(),
        Epoch: parseInt((new Date).getTime() / 1000, 10),
        DeviceId: context.bindingData.systemPropertiesArray[0]["iothub-connection-device-id"],
        Message: message
      };
      // Used { echoContent: true } to return the created item including the Timestamp & etag.
      tableService.insertEntity('d2cmessage', tableItem, { echoContent: true }, (err, result, response) => {
        if (err) {
          context.log('D2C message could not be saved in database.', err);
        }
        else {
          context.log('D2C message is saved in database.');
        }
      });
  });

  context.done();
};