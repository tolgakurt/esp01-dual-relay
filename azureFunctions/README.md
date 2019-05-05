# Azure Functions

Azure Functions (also known as serverless functions) is a great way to develop web interfaces structured as a swarm of microservices. Basically, you create a function app in Azure, and then add functions to it. These functions are executed when they are triggered. Each function can be given a publicly accessible URL, so that you can deploy your interfaces online one by one without the hassle of configuring a server. Each function can be triggered by the event specified for it. Every function consists of at least two files: `function.json` which is used to configure the trigger, input and output bindings of the function, and `index.js` which contains the business logic. There are other language alternatives available as well, but my choice was to use node.js for the functions in this project.  

The functions used in this project requires some npm packages installed which are specified in the `package.json` file in the root of this folder. You need to open a terminal in the Azure Portal and install the packages prior to the deployment of the functions.  

There are 4 functions defined: 3 of them are triggered by HTTP requests, and 1 of them is triggered when Azure IoT Hub receives a `device to cloud message` from any connected device. These functions need to connect to the Azure IoT Hub and/or Azure Storage, so they need connection strings, which should be available in `connectionStrings.js` file that should be placed in the root of this folder. This file is ignored in `.gitignore` file since we want our credentials to be secret. The file should have the following format:  

```
module.exports = {
  service: 'CONNECTION STRING FOR AZURE IOT HUB SERVICE ACCESS POLICY',
  registryRead: 'CONNECTION STRING FOR AZURE IOT HUB REGISTRY ACCESS POLICY',
  storage: 'CONNECTION STRING FOR AZURE STORAGE ACCOUNT'
};
```

These connection strings in this file can be retrieved from Azure Portal.  

For additional security, some CORS rules are set for these functions in Azure Portal. I made them accessible only from the domain that contains the frontend of the controller application. The frontend code and implementation details are at the `frontend` folder.  

## getSchedule

This interface is triggered by HTTP requests, which need to contain a query variable for the device id which we will get the schedule for. The function first asks IoT Hub registry if that device exists and is enabled. If so, it looks at the storage if there is a schedule set for this device and responds with the latest set schedule. Returns an empty schedule if there are none.  

## setSchedule

This interface requires HTTP requests to contain two body variables: one for the device id to be scheduled, and one for the schedule. Then it connects to the IoT Hub and instructs it to send the schedule to the target device using `cloud to device messages`. If the operation succeeds, the schedule is also saved in a table in Azure Storage, so that it can be used again later. The schedule in the body variable should be a JavaScript array of arrays, where each contained array contains 4 numbers which represents the 4 fields described in the `Command` class defined in `structs.h` which is at `esp` folder.  

## invokeDeviceMethod

HTTP requests to this interface needs to contain two body variables: one for the target device's id, and one that specifies the action to be performed. Then it connects to the IoT Hub and instructs it to send the action to the target device using `invoke device method` feature. The action in the body variable should be a string which is either `openCurtain` or `closeCurtain`. The actions received by this function are also saved in a table in Azure Storage.  

## saveD2CMessage

This function is not triggered by an HTTP request, but by the IoT Hub everytime the Hub receives a `device to cloud message`. When it is triggered, it basically writes the received message to a table in Azure Storage.  

# Azure Storage and Table Services

We need to create an Azure Storage account to store our functions. It also provides a table service, which we can use as a very basic database. For a more enhanced database service, another service offered by Azure, CosmosDB should be preferred, however, table service satisfy the expectations of this project.  