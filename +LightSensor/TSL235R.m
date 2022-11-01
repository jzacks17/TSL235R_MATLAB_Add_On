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
         function obj = TSL235R(parentObj, arduinoPin)
            obj.Parent = parentObj;
            obj.Pin = arduinoPin;
            configurePin(obj.Parent, obj.Pin, 'DigitalInput');
            
        end 
        
        function out = read(obj)
            cmdID = obj.READ_COMMAND;
            input = str2double(obj.Pin(2));
            output = sendCommand(obj, obj.LibraryName, cmdID, input);
            irr = output;
            out = (irr(1)/100)+(irr(2))+(irr(3)*100);
        end
        
    end  

end