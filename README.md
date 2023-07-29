# Arduino_Nano_MPC3008_logger
uses Nano and MCP3008 to send data to the PC as fast as possible


## General Introduction

This code is the first step to the next generation 
of my project of Arduino optical vibrometer:

https://github.com/TomasGaj/Arduino_vibrometer/  

Arduino Nano is reading data over SPI from MCP300 (10-bit ADC),
Nano adds to the data the time step from Timer1 and it all is SENT to PC with
maximum possible speed.

The structure of the data:

  The first two nibbles are time-step from the lower byte of Timer1.
  (code can be simply enhanced to read and send the complete Timer1 register)

  The next three nibbles are ADC data.

  And on the end of the message are placed carriage return and new line characters.

  ![blocks](pics/Nano_reading.PNG)

## This code is following two main sources:

   I. Youtube tutorials of Anas Kuzechie: 
   [Arduino ](https://www.youtube.com/@AnasKuzechie)

   II. fast-MCP3008 library written by Dmitriy L.
   [Fast MCP3008 library for Arduino Uno](https://github.com/arithmechanics/fast-MCP3008)

## About the bug, why the code runs only on Arduino Nano

It's due to its FTDI chip, the figures below are self-explanatory.
After uploading the code into UNO, you see missing data as in the figure below,
after uploading into Nano, you'll see continuous data.

I think it's due to the buffer overflow in the Atmega chip replacing FTDI,
maybe they already fix it in new versions, I did not investigate it.
