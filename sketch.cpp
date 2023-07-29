#include <Arduino.h>
#include "FastMCP3008.h"

extern "C"
{
  void init_serial();
  void print_msg();
  void print_msg_2();  
  void print_msg_3();
  void print_msg_4();
  void print_msg_5();
}

    FastMCP3008 adc;
    unsigned int  i, a, b;
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