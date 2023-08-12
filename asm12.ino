//#include <Wire.h>
#include <SPI.h>
//
//
//--------------------------------------------------------
// Arduino Nano Logger Written by tomas.gajdarus@seznam.cz
//--------------------------------------------------------
//
// update 12.8.2023: speed is about 14350 Samples/sec (timestamp included)
//
// --------------------------------------------------------
// ***!!!***!!!***!!!***!!!***!!!***!!!***!!!***!!!***!!!
//
// This code works only on Arduino NANO and not on UNO,
// it's due to bug in firmware of Atmega, 
// which replaces previous FTDI chip  
//
// ***!!!***!!!***!!!***!!!***!!!***!!!***!!!***!!!***!!!
// --------------------------------------------------------
//
//
// This code is following two main sources:
//
//   I. Youtube tutorials of Anas Kuzechie: https://www.youtube.com/@AnasKuzechie
//
//   II. fast-MCP3008 library written by Dmitriy L.
//   available here: https://github.com/arithmechanics/fast-MCP3008
//
// 
// This code is the fist step to the next generation 
// of my project of arduino optical vibrometer:
//
// https://github.com/TomasGaj/Arduino_vibrometer/ 
//
//
// P.S. About the bug in firmware of Atmega, maybe threre's some new firmware release solving this...
//
