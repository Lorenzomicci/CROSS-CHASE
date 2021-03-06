#include "standard_libs.h"
#include "display_macros.h"

void PRINT(uint8_t x, uint8_t y, char * str)
{
	uint8_t i = 0;
	
	gotoxy(x,y);
	while(str[i]!='\0')
	{
		PUTCH(str[i]);
		++i;
	}
	SWITCH_COLOR_BANK_OFF();
}


void PRINTD(uint8_t x, uint8_t y, uint8_t length, uint16_t val)
{
	uint8_t i;
	uint8_t digits[5];
	
	for(i=0;i<5;++i)
	{
		digits[i] = (uint8_t) ((val)%10);
		val-= digits[i];
		val/=10;
	}
	
	gotoxy(x+length-1-i,y);
	for(i=0;i<length;++i)
	{
		PUTCH((uint8_t) (digits[i])+48);
	}
}	


