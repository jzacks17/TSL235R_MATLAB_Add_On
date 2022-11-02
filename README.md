# TSL235R_MATLAB_Add_On
MATLAB add-on package to read the TSL235R sensor through Arduino

Prior to using this add-on package ensure that you have installed the Matlab 
support package for Arduino hardware. 

Create a directory labelled "+arduinoioaddons" on your computer. Download this 
package as a .zip file. Move the "+LightSensor" directory into the 
"+arduinoioaddons" directory. To include the add-on package in MATLAB use the 
addpath() MATLAB function. You can check to see if the add-on package has been 
added by typing "listArduinoLibraries" in the MATLAB command window. Look for 
the library titled 'LightSensor/TSL235R'. 

To use the library an Arduino object must first be created. When creating the 
Arduino object ensure that you include this add-on package'LightSensor/TSL235R'. 
An example is: 
a = arduino('COM#', 'Uno', 'Libraries', 'LightSensor/TSL235R');

Then to read the TSL235R sensor, a sensor object needs to be created using the 
addon() function. Make sure to include the digital pin that you are reading the
 TSL235R sensor from.
An example is: 
sensor = addon(a,'LightSensor/TSL235R', 'D#');

To read the TSL235R sensor, we can then use the function read(), which will 
output the irradiance reading. Such as: 
irradiance = read(sensor);