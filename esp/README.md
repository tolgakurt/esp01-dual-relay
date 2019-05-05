# Embedded ESP-01 Software

This software is developed ESP-01 module in mind. Several modifications may need to be made in order to make this work on another module like nodeMCU. Each main feature is described in the sections below. Entry point is the `esp.ino` file which defines `setup()` and `loop()` functions.  

These operations take place during `setup()` phase:  
- Serial is initialized for both input and output.
- EEPROM is initialized.
- GPIO pin roles are specified and their modes are initialized.
- WiFi connection is established and connected to time server.
- IoT Hub connection string and curtain schedule is read from EEPROM.
- Serial is reinitialized for output only.
- `RX` pin mode is set as `INPUT_PULLUP`.
- Connected to Azure IoT Hub and callbacks are assigned for communication events.
- Reset cause and some other device and startup information are sent to IoT Hub.

These operations take place during each `loop()` call:  
- Uptime duration is updated in EEPROM for this session (which begins from last reset).
- `RX` pin read and WiFi configuration is reset if it is `LOW`.
- If curtain is acting but the action needs to time out, curtain is stopped.
- The schedule is checked if any action needs to be taken at the moment.
- IoT Hub operations in the queue are done.

## Configuration

There are no hardcoded values distributed amongst individual source files; they are all written in `config.h` file. These can be tweaked to make adjustments.

## Pin Roles

`IO0` and `IO2` pin roles are set as `OUTPUT` and initialized as `HIGH`, since they need to be pulled `HIGH` externally for the device boot in flash mode and we are driving the relays with PNP transistors. Whenever a channel needs to be triggered, related pin is set as `LOW`.  

`RX` pin is initially not set as `INPUT_PULLUP` since the IoT Hub connection string and EEPROM erase input is received from serial during a short period of time when the device is booted. Then it is used as an input that triggers the WiFi configuration reset operation.  

## WiFi

`WiFiManager` package is used to handle WiFi communication. When it is initialized, it will check if the device is previously connected to a WiFi network and reconnects to the same network if so. Otherwise, it will make the device behave as an access point, which you can connect to with your phone or computer. After you connect to the device, you'll be redirected to a page in your browser which lists the network SSIDs in the proximity. You can then select the SSID you want the device to connect to. Then it will ask for the password of this network and if it can successfully connect to that network, the credentials of this network is saved. The device will automatically connect to the same network afterwards. However, if you change this network's configuration or you want the device connect to a different network; you need a way to trigger the device to reset the WiFi settings. As mentioned before, `RX` pin is used for that.  

## Time

We need to correctly set the time of the device, so that we can check the action schedule and take necessary action when the time comes. We connect to an NTP pool for that purpose.  

## Iot Hub Client

Each device should be created in Azure IoT Hub first, so that a connection string specific for that device is generated. There are many tutorials that explain the procedures to create an IoT Hub account, to configure it, to define devices within it, etc; such as [here](https://hub.packtpub.com/build-an-iot-application-with-azure-iot-tutorial/). The connection string mentioned is used to authenticate with the IoT Hub.  

The connection string is stored in EEPROM, however, it is not hardcoded. During `setup()` function, we try to read this string from a specific region in EEPROM, and if it could not be found, we ask the user to enter it from serial and wait until it is entered. Whatever is read from the serial is written into EEPROM and the device tries to connect to IoT Hub with that.  

After the connection string is read from EEPROM, even if it exists, we may want to change it, so we wait for 10 seconds while reading the serial. If a `y` character is read during this time, we delete the connection string from EEPROM. So that, a new connection string needs to be entered again.  

The device connects to the IoT Hub using MQTT protocol, so that a bidirectional connection is established between them. That means the device can be triggered from IoT Hub anytime as well as we can send messages to the cloud.  

For instantaneous open and close actions, `Invoke Device Method` feature of IoT Hub is used and to update the action schedule, `Cloud to Device` messages are listened.  

## EEPROM

ESP-01 doesn't have an EEPROM device actually. What EEPROM library does is to emulate the flash memory as an EEPROM. But the wrapper (`eeprom.ino`) is written as if the device is an actual EEPROM, considering the fact that it can be written for a limited amount of times. For example, whenever a string needs to be written into it, each byte is checked if they already are equal to what will be written; or whenever a string needs to be deleted, the region that contains the string is just terminated with whatever the termination character of that region is, instead of writing whole region with the termination characters. The data types for what will be written to EEPROM (defined in `structs.h`) is chosen to be small as possible, to minimize the bytes to be written.  

Whenever the device boots, whole EEPROM content is written into serial stream for debugging purposes. Besides that, the first region of EEPROM is checked if it contains a specific signature indicated in `config.h`. If it doesn't, the whole EEPROM is defaulted with termination chars and the expected signature is written into the beginning of EEPROM. This is to make sure that each byte is initialized with default values, and to easily clear and reinitialize the whole content if a new version requires different default values.  

The EEPROM is divided into 5 blocks. Each block's addresses, lengths, and termination characters are defined in `config.h`. The content of these blocks is as such:  

1. Signature region. Should contain the `EXPECTED_SIGNATURE` defined in `config.h`, otherwise the whole EEPROM is reset.  

2. Connection string region. It will contain the connection string of the device. The value will be entered from serial.  

3. Scheduled commands region. This region is allocated for schedule information received from IoT Hub. The data structure for one action in the schedule is 4 bytes, so this region needs to have (number of commands * 4) bytes, plus one for termination char. Action are represented by `Command` instances, whose declaration is given in `structs.h`.  

4. Uptime region. This region is for debugging purposes. Each block in this region will show approximately how long the device was alive in a specific session and the number of resets up to that session. Each item in this block is an `Uptime` instance which is defined in `structs.h`. This region is used as a rotary log region, so whenever the region is full, the first block is overwritten. So, we can see uptime information only for a limited number of sessions. We have an `id` byte in each uptime instance, so we know which comes before and which comes after.  

5. Startup and soft reset reasons region. This is also a rotary log region which can be used for debugging purposes. Each block is an instance of `Startup` which is defined in `structs.h`.  

## Configuration of a New Device

The device is connected to the computer by a programmer and is started in programming mode. Then the code is compiled and uploaded to the device. After upload is finished, the device is booted in flash mode still connected to the computer. After that, the serial monitor is opened and after some time, it will ask for Azure IoT Hub connection string. We create a virtual device in Azure IoT Hub that represents this device if not yet. The connection string generated for this device is sent from the serial port. Then we can unplug the device and embed it into the PCB we made.  

Then we can install the PCB in whereever it will be used. Afterwards, we can connect to the SSID created by the device and configure it to connect to a network. Now the device should be operational.  

If we need to hard reset the device we can power it off and on; or if the device doesn't have a switch for power, we can push the reset pin on the PCB.  

If we need to reset the WiFi configuration, we can push the button that is connected to `RX` pin for a little while, and the WiFi is reset and device is rebooted. Then it will create an SSID which we can connect to and configure the WiFi for a different network.  

To debug the device, the `TX` male pin on the PCB can be connected to the `RX` pin of the programmer device with a jumper while one of the `GND` male pins is connected to the `GND` pin of the programmer. Now we can display the logs from the serial monitor. The EEPROM serialization in the beginning can provide valuable information.  