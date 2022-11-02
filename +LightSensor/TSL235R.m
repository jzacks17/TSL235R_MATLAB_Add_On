classdef TSL235R < matlabshared.addon.LibraryBase
    properties(Access = private, Constant = true)
        READ_COMMAND = hex2dec('01')
    end    
    
     properties(Access = protected, Constant = true)
        LibraryName = 'LightSensor/TSL235R'
        DependentLibraries = {}
        LibraryHeaderFiles = {}
        CppHeaderFile = fullfile(arduinoio.FilePath(mfilename('fullpath')), 'src', 'TSL235R.h')
        CppClassName = 'TSL235R'
     end

     properties(SetAccess = private)
        Pin
     end

     methods
         %create the sensor object and configure the digital pin
         function obj = TSL235R(parentObj, arduinoPin)
            obj.Parent = parentObj;
            obj.Pin = arduinoPin;
            configurePin(obj.Parent, obj.Pin, 'DigitalInput');
            
        end 
        
        %Read irradiance from the TSL235R
        function out = read(obj)
            cmdID = obj.READ_COMMAND;

            %send digital pin number as the input for the header file
            input = str2double(obj.Pin(2)); 

            %receives output as three bytes (decimals, ones and hundreds)
            %reconfigure the bytes as the output
            output = sendCommand(obj, obj.LibraryName, cmdID, input);
            irr = output;
            out = (irr(1)/100)+(irr(2))+(irr(3)*100);
        end
        
    end  

end