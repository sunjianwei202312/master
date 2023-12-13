#include "include.h"




#define TIMER2_MAX 10		//��ʱ��2��ʱ

static uint8_t timer2_cnt;		//��ʱ��2�Ķ�ʱֵ

extern uint8_t flag_display_lighting1;
extern NTP_INFO ntp_info;
extern uint8_t usart_timer_cnt;
extern uint8_t usart_count;
extern uint8_t flag_usart_start;

/**************************************************************************************
��������timer2_init
��ڲ�������
���ڲ�������
����:��ʱ��1��ʼ��
//************************************************************************************/
void timer2_init(void)
{
	TMR2 = 0;		//��ʱ��2��ʼֵ����
	TMR2IF = 0;
	T2CKPS1 = 0;
	T2CKPS0 = 0;	//ѡ���Ƶ��Ϊ1:8
	TOUTPS3 = 0;
	TOUTPS2 = 1;
	TOUTPS1 = 1;
	TOUTPS0 = 1;
	
	TMR2ON = 1;	//ʹ�ܶ�ʱ��
	TMR2IE = 1;	//����ʱ��1�ж�
	timer2_cnt=0;
}
/**************************************************************************************
��������timer2_isr
��ڲ�������
���ڲ�������
����:��ʱ��1�жϷ������
//************************************************************************************/
void timer2_isr(void)
{
	TMR2IF = 0;			//����жϱ�־
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





