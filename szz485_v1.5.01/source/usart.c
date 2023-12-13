#include "include.h"

extern uint8_t rx_udata[RXD_BUFFER_LEN];		//接收数据存放的数组






extern uint8_t my_id_code;
extern uint8_t usart_timer_cnt;
extern uint8_t usart_count;
extern uint8_t flag_usart_start;


void usart_init(void)
{
	SEL_RS485_DIR = 0;	//设置485方向控制为输出
	BUTTON1_DIR = 1;
	BUTTON2_DIR = 1;
	BUTTON3_DIR = 1;
	BUTTON4_DIR = 1;
	BUTTON5_DIR = 1;
	BUTTON6_DIR = 1;
	BUTTON7_DIR = 1;
	BUTTON8_DIR = 1;
	
	init_comms();			//配置好波特率
	SEL_RS485_RX();
	my_id_code=id_code();
}
uint8_t id_code(void)
{
	uint8_t id= 0;
	id = 0x00;
	if(BUTTON8 == 0)
	{
		id |= 1<<7;
	}
	if(BUTTON7 == 0)
	{
		id |= 1<<6;
	}
	if(BUTTON6 == 0)
	{
		id |= 1<<5;
	}
	if(BUTTON5 == 0)
	{
		id |= 1<<4;
	}
	if(BUTTON4 == 0)
	{
		id |= 1<<3;
	}
	if(BUTTON3 == 0)
	{
		id |= 1<<2;
	}
	if(BUTTON2 == 0)
	{
		id |= 1<<1;
	}
	if(BUTTON1 == 0)
	{
		id |= 1;
	}
	return(id);
}
void usart_isr(void)
{
	uint8_t cbuffer;
	cbuffer = RCREG;
	if(REC_ERROR == 1)
	{
		REC_ENABLE = 0;	//若发生错误，则调整
		REC_ENABLE = 1;
		return;
	}
	if(usart_count<RXD_BUFFER_LEN)
	{
		rx_udata[usart_count++] = cbuffer;
	}
	else
	{
		usart_count=0;
	}
	flag_usart_start=1;
	usart_timer_cnt=0;	
	
}
 
void putch(uint8_t byte) 
{
	/* output one byte */
	while(!TXIF)	/* set when register is empty */
		continue;
	TXREG = byte;
}




