%Clear Arduino object
clear a;

%Create Arduino object, including the Lightsensor/TSL235R library
a = arduino('COM#','Uno', 'Libraries', 'LightSensor/TSL235R');

%Create the sensor object
sensor = addon(a,'LightSensor/TSL235R', 'D#');

%Read irradiance
irradiance = read(sensor);

%Print irradiance
fprintf('The irradiance is: %6.2f uW/cm2\n',irradiance);