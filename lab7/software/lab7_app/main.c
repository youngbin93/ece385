// Main.c - makes LEDG0 on DE2-115 board blink if NIOS II is set up correctly
// for ECE 385 - University of Illinois - Electrical and Computer Engineering
// Author: Zuofu Cheng

int main()
{
        int i = 0;
        unsigned int acc = 0xF;
        volatile unsigned int *LED_PIO = (unsigned int*)0x30; //make a pointer to access the PIO block
        volatile unsigned int *switches = (unsigned int*)0x50;
        volatile unsigned int *buttons = (unsigned int*)0x60;


        *LED_PIO = 0; //clear all LEDs
        while ( (1+1) != 3) //infinite loop
        {
				/* Reset takes precedence */
				if(*buttons == 0x8 || *buttons == 0x1)
				{
					acc = 0;
				}
				/* accumulator */
				else if(*buttons == 0x4 || *buttons == 0x2)
				{
					acc += *switches;
				}
				/* overflow code */
				if(acc > 255)
				{
					acc -= 255;
				}

                for (i = 0; i < 100000; i++); //software delay
                *LED_PIO = acc; //set LSB
        }
        return 1; //never gets here
}
