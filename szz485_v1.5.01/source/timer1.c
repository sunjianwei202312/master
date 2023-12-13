#include "include.h"

#define TIMER1_MAX 3		//定时器1定时1秒进入中断的最大次数

extern TIME old_time;

extern uint8_t up_time_flag;	//更新时间标志
extern uint8_t timer1_cnt;		//定时器1的定时值
#if defined(USE_YEAR_MONTH_DATA)
extern uint8_t months[13];
#endif


/**************************************************************************************
函数名：timer1_init
入口参数：无
出口参数：无
功能:定时器1初始化
//************************************************************************************/
void timer1_init(void)
{
	TMR1H = 0;
	TMR1L = 0;		//定时器1初始值清零
	TMR1IF = 0;
	T1OSCEN = 0; 	//LP振荡器关闭
	TMR1GE = 0;	//始终计数
	T1CKPS1 = 1;
	T1CKPS0 = 1;	//选择分频比为1:8
	TMR1CS = 0;	//内部时钟源 ：fosc/4
	TMR1ON = 1;	//使能定时器
	TMR1IE = 1;	//允许定时器1中断
	WDTPS_1011();	//看门狗分频器1:65536
	
	TIMER0_PSA();	//预分频器分配给timer0
	//WDT_EN();
	RB0 = 1;
}
/**************************************************************************************
函数名：timer1_isr
入口参数：无
出口参数：无
功能:定时器1中断服务程序
//************************************************************************************/
void timer1_isr(void)
{
	TMR1IF = 0;			//清除中断标志
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
函数名：time_add
入口函数：无
出口函数：无
功能：时间加1秒函数
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
			months[2] = 28;//添加此指令为了复原2月份默认的28天！  added by sjw
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


