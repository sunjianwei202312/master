#include "include.h"




#define TIMER2_MAX 10		//定时器2定时

static uint8_t timer2_cnt;		//定时器2的定时值

extern uint8_t flag_display_lighting1;
extern NTP_INFO ntp_info;
extern uint8_t usart_timer_cnt;
extern uint8_t usart_count;
extern uint8_t flag_usart_start;

/**************************************************************************************
函数名：timer2_init
入口参数：无
出口参数：无
功能:定时器1初始化
//************************************************************************************/
void timer2_init(void)
{
	TMR2 = 0;		//定时器2初始值清零
	TMR2IF = 0;
	T2CKPS1 = 0;
	T2CKPS0 = 0;	//选择分频比为1:8
	TOUTPS3 = 0;
	TOUTPS2 = 1;
	TOUTPS1 = 1;
	TOUTPS0 = 1;
	
	TMR2ON = 1;	//使能定时器
	TMR2IE = 1;	//允许定时器1中断
	timer2_cnt=0;
}
/**************************************************************************************
函数名：timer2_isr
入口参数：无
出口参数：无
功能:定时器1中断服务程序
//************************************************************************************/
void timer2_isr(void)
{
	TMR2IF = 0;			//清除中断标志
	if(flag_usart_start)
	{
		usart_timer_cnt++;
	}
	else
	{
		usart_timer_cnt=0;
		usart_count=0;
	}
	
	
	if(timer2_cnt >= TIMER2_MAX)
	{
		timer2_cnt = 0;	
		//PPS = 0;
	}
	else
	{
		//PPS = 1;
		timer2_cnt++;
	}


	
}





