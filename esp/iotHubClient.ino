void connectionStatusCallback(
  IOTHUB_CLIENT_CONNECTION_STATUS result,
  IOTHUB_CLIENT_CONNECTION_STATUS_REASON reason,
  void* userContextCallback
)
{
  Serial.printf(
    "Client connection status result is %s and reason is %s\r\n",
    ENUM_TO_STRING(IOTHUB_CLIENT_CONNECTION_STATUS, result),
    ENUM_TO_STRING(IOTHUB_CLIENT_CONNECTION_STATUS_REASON, reason)
  );
}

IOTHUBMESSAGE_DISPOSITION_RESULT receiveMessageCallback(
  IOTHUB_MESSAGE_HANDLE message,
  void* userContextCallback
)
{
  const unsigned char* buffer;
  size_t size;
  if (IoTHubMessage_GetByteArray(message, &buffer, &size) != IOTHUB_MESSAGE_OK)
  {
    Serial.println("Unable to IoTHubMessage_GetByteArray.");
    return IOTHUBMESSAGE_REJECTED;
  }
  else
  {
    char* temp = (char*)malloc(size + 1);
    if (temp == NULL)
    {
      Serial.println("Abandoning message.");
      return IOTHUBMESSAGE_ABANDONED;
    }

    strncpy(temp, (const char*)buffer, size);
    temp[size] = '\0';
    Serial.printf("Received message from IOT Hub: %s\r\n", temp);
    free(temp);

    if (updateSchedule(buffer, size))
    {
      serializeSchedule();
    }
  }
  return IOTHUBMESSAGE_ACCEPTED;
}

const char* onSuccess = "\"Successfully invoked device method.\"";
const char* notFound = "\"No such device method found.\"";

int deviceMethodCallback(
  const char* methodName,
  const unsigned char* payload,
  size_t size,
  unsigned char** response,
  size_t* response_size,
  void* userContextCallback
)
{
  Serial.printf("Try to invoke method %s.\r\n", methodName);

  const char* responseMessage = onSuccess;
  int result = 200;

  if (strcmp(methodName, "openCurtain") == 0)
  {
    openCurtain();
  }
  else if (strcmp(methodName, "closeCurtain") == 0)
  {
    closeCurtain();
  }
  else
  {
    Serial.printf("No method %s found.\r\n", methodName);
    responseMessage = notFound;
    result = 404;
  }

  *response_size = strlen(responseMessage);
  *response = (unsigned char*)malloc(*response_size);
  strncpy((char*)(*response), responseMessage, *response_size);

  return result;
}

static void sendCallback(IOTHUB_CLIENT_CONFIRMATION_RESULT result, void* userContextCallback)
{
  unsigned int messageTrackingId = (unsigned int)(uintptr_t)userContextCallback;
  Serial.printf(
    "Callback with id %u received. Result: %s\r\n",
    messageTrackingId,
    ENUM_TO_STRING(IOTHUB_CLIENT_CONFIRMATION_RESULT, result)
  );
}

static void sendMessage(
  IOTHUB_CLIENT_LL_HANDLE iotHubClientHandle,
  const char* buffer
)
{
  static unsigned int messageTrackingId;
  IOTHUB_MESSAGE_HANDLE handle = IoTHubMessage_CreateFromByteArray((const unsigned char*)buffer, strlen(buffer));
  if (handle == NULL)
  {
    Serial.println("Unable to create a new IoTHubMessage.");
  }
  else
  {
    Serial.printf("Will try to send the message: %s.\r\n", buffer);
    if (IoTHubClient_LL_SendEventAsync(
      iotHubClientHandle,
      handle,
      sendCallback,
      (void*)(uintptr_t)messageTrackingId) != IOTHUB_CLIENT_OK
    )
    {
      Serial.println("Failed to hand over the message to IoTHubClient.");
    }
    else
    {
      Serial.printf("IoTHubClient accepted the delivery of the message: %s\r\n", buffer);
    }

    IoTHubMessage_Destroy(handle);
    messageTrackingId++;
  }
}