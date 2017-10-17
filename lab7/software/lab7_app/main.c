// Main.c - makes LEDG0 on DE2-115 board blink if NIOS II is set up correctly
// for ECE 385 - University of Illinois - Electrical and Computer Engineering
// Author: Zuofu Cheng

int main()
{
	int i = 0;
	unsigned int acc = 0;
	volatile unsigned int *LED_PIO = (unsigned int*)0x50; //make a pointer to access the PIO block
	volatile unsigned int *switches = (unsigned int*)0x40; //make a pointer to access the PIO block
	volatile unsigned int *accumulate = (unsigned int*)0x30; //make a pointer to access the PIO block
	volatile unsigned int *reset = (unsigned int*)0x20; //make a pointer to access the PIO block

	*LED_PIO = 0; //clear all LEDs
	while ( (1+1) != 3) //infinite loop
	{
		if(!(*reset))
		{
			acc = 0;
		}
		else if(!(*accumulate))
		{
			acc += *switches;
		}
		if(acc > 255)
		{
			acc -= 256;
		}

		for (i = 0; i < 100000; i++); //software delay
		*LED_PIO = acc;
	}
	return 1; //never gets here
}
