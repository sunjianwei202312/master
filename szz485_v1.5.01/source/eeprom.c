#include "include.h"




/***********************************
        向EEPROM写一个字节  
***********************************/

void write_eeprom(uint8_t addre,uint8_t databyte)
{
	uint8_t copy_intcon; 
	EEADR=addre;   //数据要写的地址
	EEDAT=databyte;//所要写的数据  
	EEPGD=0; 
	WREN=1; 
	copy_intcon=INTCON;
	INTCON&=0x3f;
	EECON2=0x55;
	EECON2=0xAA;
	WR=1;
	INTCON=copy_intcon;
	while(WR);
	WREN=0;  
}

/***********************************
        向EEPROM读取一个字节  
***********************************/

uint8_t read_eeprom(uint8_t addre)
{
	uint8_t readdata;
	EEADR=addre; //所要读取的地址
	EEPGD=0;
	RD=1;
	readdata=EEDAT;
	return (readdata);
}

