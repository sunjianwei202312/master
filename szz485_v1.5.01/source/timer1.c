#include "include.h"

#define TIMER1_MAX 3		//��ʱ��1��ʱ1������жϵ�������

extern TIME old_time;

extern uint8_t up_time_flag;	//����ʱ���־
extern uint8_t timer1_cnt;		//��ʱ��1�Ķ�ʱֵ
#if defined(USE_YEAR_MONTH_DATA)
extern uint8_t months[13];
#endif


/**************************************************************************************
��������timer1_init
��ڲ�������
���ڲ�������
����:��ʱ��1��ʼ��
//************************************************************************************/
void timer1_init(void)
{
	TMR1H = 0;
	TMR1L = 0;		//��ʱ��1��ʼֵ����
	TMR1IF = 0;
	T1OSCEN = 0; 	//LP�����ر�
	TMR1GE = 0;	//ʼ�ռ���
	T1CKPS1 = 1;
	T1CKPS0 = 1;	//ѡ���Ƶ��Ϊ1:8
	TMR1CS = 0;	//�ڲ�ʱ��Դ ��fosc/4
	TMR1ON = 1;	//ʹ�ܶ�ʱ��
	TMR1IE = 1;	//����ʱ��1�ж�
	WDTPS_1011();	//���Ź���Ƶ��1:65536
	
	TIMER0_PSA();	//Ԥ��Ƶ�������timer0
	//WDT_EN();
	RB0 = 1;
}
/**************************************************************************************
��������timer1_isr
��ڲ�������
���ڲ�������
����:��ʱ��1�жϷ������
//************************************************************************************/
void timer1_isr(void)
{
	TMR1IF = 0;			//����жϱ�־
	if(timer1_cnt >= TIMER1_MAX)
	{
		timer1_cnt = 0;
		NOP();NOP();NOP();NOP();NOP();NOP();NOP();
		
		TMR1L = 0x76;
		TMR1H = 0x2F;
		up_time_flag++;
			
			
			
		
		//PPS = 0;
	}
	else
	{
		//PPS = 1;
		timer1_cnt++;
	}
	
	
}


/*************************************************************************************
��������time_add
��ں�������
���ں�������
���ܣ�ʱ���1�뺯��
//**************************************************************************************/
uint8_t time_add(TIME *t)
{
	if(t->sec >= 59)
	{
		t->sec = 0;
		if(t->min >= 59)
		{
			t->min = 0;
			if(t->hour >= 23)
			{
				t->hour = 0;
				return FLAG_DATE_ADD;
			}
			else
			{
				t->hour++;
			}
		}
		else
		{
			t->min++;
			
		}	
	}	
	else
	{
		t->sec++;
	}
	return FLAG_DATE_NONE;
}

uint8_t time_dec(TIME *t)
{
	if(t->sec <= 0)
	{
		t->sec = 59;
		if(t->min <= 0)
		{
			t->min = 59;
			if(t->hour <= 0)
			{
				t->hour = 23;
				return 1;
			}
			else
			{
				t->hour--;
			}
		}
		else
		{
			t->min--;	
		}	
	}	
	else
	{
		t->sec--;
	}
	return 0;
}
#if defined(USE_YEAR_MONTH_DATA)
void date_add(DATE *t)
{
	uint8_t month_day;
	if(t->month == 2)
	{
		if(isleap(t->year+2000))
		{
			months[2] = 29;
		}else{
			months[2] = 28;//��Ӵ�ָ��Ϊ�˸�ԭ2�·�Ĭ�ϵ�28�죡  added by sjw
		}
	}
	month_day = months[t->month];
	//if(t->day >= month_day)
	if(t->date >= month_day)
	{
		//t->day = 1;
		t->date = 1;
		if(t->month >=12)
		{
			t->month = 1;
			t->year++;	
		}
		else
		{
			t->month++;	
		}
	}
	else
	{
		//t->day++;	
		t->date++;//  processed  by sjw
	}
	
		
}

#endif
#if defined(USE_YEAR_MONTH_DATA)
void date_dec(DATE *t)
{

	if(t->month == 2)
	{
		if(isleap(t->year+2000))
		{
			months[2] = 29;
		}
	}
	if(t->date == 1)
	{
		if(t->month == 1)
	   	{
			t->month = 12;
			t->year--;
				
	   	}
		else
		{
			t->month--;
		} 
		t->date = months[t->month];
	}
	else
	{
		t->date--;
	}

	
	
		
}


#endif
#if defined(USE_YEAR_MONTH_DATA)
uint8_t isleap(uint16_t year)
{
	if ((year%400==0) || ((year%100!=0) && (year%4==0))) 
	{
		return TRUE;
	}	
	else
	{
		return FALSE;
	}	
}
#endif


