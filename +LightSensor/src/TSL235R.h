#include "LibraryBase.h"

class TSL235R : public LibraryBase
{
    public:
        TSL235R(MWArduinoClass& a)
        {
            libName = "LightSensor/TSL235R";
            a.registerLibrary(this);
        }

    public:
    void commandHandler(byte cmdID, byte* inputs, unsigned int payload_size)
    {
        switch (cmdID){
            case 0x01:{  
            
            byte PIN = inputs[0];

            pinMode(PIN, INPUT);

            float pulseHigh = pulseIn(PIN, HIGH);
            float pulseLow = pulseIn(PIN, LOW);   
            float period = pulseHigh + pulseLow;
            float freq = 1000/period; //find frequency in kHz
            float irradiance = freq/0.58; //convert frequency to irradiance in uW/cm2

            int irr = int(irradiance*100); //convert irradiance from a float to an integer (times 100 to keep two decimal values)

            //store irradiance in a byte array
            byte arr [3]; //declare empty array

            arr[0] = irr%100; //holds the decimal places 
            arr[1] = ((irr-arr[0])%10000)/100; //holds the ones 
            arr[2] = (irr-(arr[1]*100))/10000; //holds the hundreds 

            sendResponseMsg(cmdID, arr, 3);
            break;
        }
        default:{
            // Do nothing
        }
    }
}
};