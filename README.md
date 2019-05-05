# Introduction

This project is about a dual relay circuit driven by a ESP8266-01 IC which is connected to Azure IoT Hub, which is then controlled by a progressive web app and serverless Azure functions in the backend. We developed and built the circuit, and implemented the code nearly from scratch.  

This is a pet project, and we aimed to build a nice gadget, but we also aimed to learn new things; so we implemented features and took precautions which are hardly necessary. So expect more detail then required. You may also find some already sold products for that purpose, but they lack this feature or that we think that we must have, and moreover, where is the fun using such a product directly?  

This project began when we first encountered a specific type of curtain which are opened and closed by an AC motor. If you haven't encountered them yet, there are curtains which are like projector curtains in shape, which also include a cylindirical motor in the shaft that collects the curtain which can turn both ways depending on which input line of the motor is connected to AC. The motor has 4 inputs: 1 for ground, 1 for neutral, 2 for phase. 1 phase turns the motor clock-wise and the other turns it anti clock-wise. So, why not develop a circuit that controls this curtain?  

Then we developed the circuit with [Kutalmış İnce](http://kutalmisince.com/) and mobilized the curtains in our bedrooms so that they can be dynamically programmed by a mobile app to open up at (say) 7AM (best way to wake up gracefully) and close down at (say) 6PM, or can be opened or closed at the moment. We also wanted them to be manually controllable via simple switches. This became a long journey in which we first developed a master/slave configuration where a Raspberry Pi acted as the main hub directing some Atmel based controllers. We would put Raspberry Pi in close proximity of the router so that it can be accessed online, and it will connect with the controllers using nRF24L01+ ICs. However it became a bit expensive, and we thought that we could construct the same system using ESP8266 so that we get rid of slave/master configuration. This was cheaper and working, but we were using nodeMCU devboards (which use ESP8266-12 IC with lots of GPIO pins) and this could still get cheaper by using ESP8266-01 modules. This wasn't easy as said, since ESP8266-01 is a very limited and unstable module. Rest of this document explains the whole procedure to get such a system up and running steady.  

We tried to be sure about all the components we used and each line of code we wrote, but please comment if you notice something wrong or inappropriate. Needless to say, what we developed is a relay circuit controlled online, which means you can control any common AC (or DC, for that matter) utility with it.  

## The Circuit

We modeled the circuit using EAGLE. The details about the design and implementation of the circuit can be found in `pcb` folder. This folder also contains gcode files so that you can etch the pcb using a CNC machine. You can export the trace masks from EAGLE as well. More information can be found [here](pcb/README.md).  

## Embedded Code

TODO

## Azure IoT Hub and Serverless Functions

TODO

## Mobile Application

TODO