#include <Arduino.h>
#include "FastMCP3008.h"

extern "C"
{
  void init_serial();
  void print_msg();
}

    FastMCP3008 adc;
    unsigned int  a;
    byte channelMask0;


int main()
{
    init_serial();   
  
    adc.init();
    channelMask0 = adc.getChannelMask(0);

    TCCR1A = 0b00000000;
    TCCR1B = 0b00000011; // prescaler  64 ->  4us per timer  
    TIMSK1 = 0b00000000; 

    for ( ;; )
    {
      
        a = adc.read(channelMask0); 

        print_msg();

    }       
}
