#include "include.h"




/***********************************
        ��EEPROMдһ���ֽ�  
***********************************/

void write_eeprom(uint8_t addre,uint8_t databyte)
{
	uint8_t copy_intcon; 
	EEADR=addre;   //����Ҫд�ĵ�ַ
	EEDAT=databyte;//��Ҫд������  
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
        ��EEPROM��ȡһ���ֽ�  
***********************************/

uint8_t read_eeprom(uint8_t addre)
{
	uint8_t readdata;
	EEADR=addre; //��Ҫ��ȡ�ĵ�ַ
	EEPGD=0;
	RD=1;
	readdata=EEDAT;
	return (readdata);
}

