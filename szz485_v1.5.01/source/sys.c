#include "include.h"



TIME old_time;
DATE old_date;

uint8_t up_time_flag;
BOOL flag_jiaoshi;
uint8_t timer1_cnt;
uint8_t jiaoshi_cnt;
BOOL flag_dian1;
#if defined(USE_TWO_FACE)
BOOL flag_dian2;
#endif
#if defined(USE_YEAR_MONTH_DATA)
uint8_t months[13]={0,31,28,31,30,31,30,31,31,30,31,30,31};

uint8_t up_date_flag;

#endif
NTP_INFO ntp_info;


uint8_t rx_udata[RXD_BUFFER_LEN];
uint8_t my_id_code;
#if defined(USE_LIGHTING_MODE)
uint8_t flag_display_lighting1;
#endif

#if defined(USE_LIGHTING_MODE2)
uint8_t flag_display_lighting2;
#endif

uint8_t usart_timer_cnt;
uint8_t usart_count;
uint8_t flag_usart_start;

uint8_t disp_data_time[4];
#if defined(USE_INFRARED_MODE)
uint8_t flicker_num,flicker_data_copy;
uint8_t flicker_count;
#endif


#if defined(USE_LIGHTING_MODE) && !defined(USE_LIGHTING_MODE2)
enum
{
	LINGHTING_START=0,
	LINGHTING_ON,
	LINGHTING_ON_COV
}linght_state1=LINGHTING_START;
#elif !defined(USE_LIGHTING_MODE) && defined(USE_LIGHTING_MODE2)
enum
{
	LINGHTING_START=0,
	LINGHTING_ON,
	LINGHTING_ON_COV
}linght_state2=LINGHTING_START;
#elif defined(USE_LIGHTING_MODE) && defined(USE_LIGHTING_MODE2)
enum
{
	LINGHTING_START=0,
	LINGHTING_ON,
	LINGHTING_ON_COV
}linght_state1=LINGHTING_START,linght_state2=LINGHTING_START;

#endif



/**************************************************************************************
函数名：interrupt_init
入口参数：无
出口参数：无
功能:中断初始化
//************************************************************************************/
void interupt_init(void)
{
	GIE = 1;		//允许所有未被屏蔽的中断
	PEIE = 1;	//允许所有未被屏蔽的外设中断
	ANSEL = 0x00;
	ANSELH = 0x00;
}




void interrupt isr(void)
{
	#if defined(USE_INFRARED_MODE)
	if(T0IF)
	{
		T0IF=0;
		if(Ir_wait<200)
		{
			Ir_wait++;
		}		
			
	}
	#endif	
	if(TMR1IF == 1)
	{
		timer1_isr();	//定时器1中断
	}

	if(RCIF && RX_INTERRUPT)
	{
		usart_isr();	//串口中断
	}
	if(TMR2IF)
	{
		timer2_isr();	
	}
	#if defined(USE_INFRARED_MODE)
	if(RBIF)//红外接收
	{
		RBIF=0;
		IR_IOCB=0;    
	
		if(IR_PIN==0)
		{
			infrare();	
			
		}
			
		
		           
		IR_IOCB=1;    
	}
	#endif
}







void system_value_init(void)
{
	old_time.hour=0;
	old_time.min=0;
	old_time.sec=0;
	old_date.day=1;
	old_date.date=1;
	old_date.month=1;
	old_date.year=1;
	
	up_time_flag=0;
	flag_jiaoshi=0;
	timer1_cnt=0;
	jiaoshi_cnt=0;
	flag_dian1=0;
	#if defined(USE_TWO_FACE)
	flag_dian2=0;
	#endif

	
	my_id_code=0;
	#if defined(USE_LIGHTING_MODE)
	flag_display_lighting1=0;
	#endif
	
	#if defined(USE_LIGHTING_MODE2)
	flag_display_lighting2=0;
	#endif
	
	usart_timer_cnt=0;
	usart_count=0;
	flag_usart_start=0;
	#if defined(USE_YEAR_MONTH_DATA)
	up_date_flag=0;
	#endif

}









#if defined(USE_LIGHTING_MODE)	
void lighting_init(void)
{
	uint8_t i,eeprom_data[8];
	for(i=0;i<8;i++)
	{
		eeprom_data[i]=read_eeprom(AA02E48_DISPLAY_ON_OFF1+i);
	}
	i=0;
	if((eeprom_data[i] == 0xff) || \
	   (eeprom_data[i+1] == 0xff) || \
	   (eeprom_data[i+2] == 0xff) || \
	   (eeprom_data[i+3] == 0xff) || \
	   (eeprom_data[i+4] == 0xff) || \
	   (eeprom_data[i+5] == 0xff) || \
	   (eeprom_data[i+6] == 0xff) || \
	   (eeprom_data[i+7] == 0xff))  
	{
		ntp_info.display_on_off1 = DEFAULT_DISPLAY_ON_OFF;
		ntp_info.display_grade1 = DEFAULT_DISPLAY_GRADE;
		ntp_info.start_time1.hour = DEFAULT_DISPLAY_START_H;
		ntp_info.start_time1.min = DEFAULT_DISPLAY_START_M;
		ntp_info.start_time1.sec = DEFAULT_DISPLAY_START_S;
		ntp_info.end_time1.hour = DEFAULT_DISPLAY_START_H;
		ntp_info.end_time1.min = DEFAULT_DISPLAY_START_M;
		ntp_info.end_time1.sec = DEFAULT_DISPLAY_START_S;
		i=0;
		eeprom_data[i++] = DEFAULT_DISPLAY_ON_OFF;
		eeprom_data[i++] = DEFAULT_DISPLAY_GRADE;
		eeprom_data[i++] = DEFAULT_DISPLAY_START_H;
		eeprom_data[i++] = DEFAULT_DISPLAY_START_M;
		eeprom_data[i++] = DEFAULT_DISPLAY_START_S;
		eeprom_data[i++] = DEFAULT_DISPLAY_START_H;
		eeprom_data[i++] = DEFAULT_DISPLAY_START_M;
		eeprom_data[i++] = DEFAULT_DISPLAY_START_S;
		con_write_eeprom(AA02E48_DISPLAY_ON_OFF1,eeprom_data,i);
		delay_ms(20);	
	}
	else
	{
		ntp_info.display_on_off1 = eeprom_data[i++]&0x01;
		if(eeprom_data[i]<=10)
		{
			ntp_info.display_grade1 = eeprom_data[i];	
		}
		else
		{
			ntp_info.display_grade1=DEFAULT_DISPLAY_GRADE;
		}
		i++;
		if((eeprom_data[i] <= 23) && \
		   (eeprom_data[i+1] <= 59) && \
		   (eeprom_data[i+2] <= 59))
		{
			ntp_info.start_time1.hour = eeprom_data[i];
			ntp_info.start_time1.min = eeprom_data[i+1];
			ntp_info.start_time1.sec = eeprom_data[i+2];	
		}
		else
		{
			ntp_info.start_time1.hour = DEFAULT_DISPLAY_START_H;
			ntp_info.start_time1.min = DEFAULT_DISPLAY_START_M;
			ntp_info.start_time1.sec = DEFAULT_DISPLAY_START_S;
		}
		i++;
		i++;
		i++;
		if((eeprom_data[i] <= 23) && \
		   (eeprom_data[i+1] <= 59) && \
		   (eeprom_data[i+2] <= 59))
		{
			ntp_info.end_time1.hour = eeprom_data[i];
			ntp_info.end_time1.min = eeprom_data[i+1];
			ntp_info.end_time1.sec = eeprom_data[i+2];	
		}
		else
		{
			ntp_info.end_time1.hour = DEFAULT_DISPLAY_START_H;
			ntp_info.end_time1.min = DEFAULT_DISPLAY_START_M;
			ntp_info.end_time1.sec = DEFAULT_DISPLAY_START_S;
		}
	}	
		
	lighting_cotrol();
	lighting_cotrol();
	CCP1CON |= 0b00001100;

}	
#endif

#if defined(USE_LIGHTING_MODE2)	
void lighting_init2(void)
{
	uint8_t i,eeprom_data[8];
	for(i=0;i<8;i++)
	{
		eeprom_data[i]=read_eeprom(AA02E48_DISPLAY_ON_OFF2+i);
	}
	i=0;
	if((eeprom_data[i] == 0xff) || \
	   (eeprom_data[i+1] == 0xff) || \
	   (eeprom_data[i+2] == 0xff) || \
	   (eeprom_data[i+3] == 0xff) || \
	   (eeprom_data[i+4] == 0xff) || \
	   (eeprom_data[i+5] == 0xff) || \
	   (eeprom_data[i+6] == 0xff) || \
	   (eeprom_data[i+7] == 0xff))  
	{
		ntp_info.display_on_off2 = DEFAULT_DISPLAY_ON_OFF;
		ntp_info.display_grade2 = DEFAULT_DISPLAY_GRADE;
		ntp_info.start_time2.hour = DEFAULT_DISPLAY_START_H;
		ntp_info.start_time2.min = DEFAULT_DISPLAY_START_M;
		ntp_info.start_time2.sec = DEFAULT_DISPLAY_START_S;
		ntp_info.end_time2.hour = DEFAULT_DISPLAY_START_H;
		ntp_info.end_time2.min = DEFAULT_DISPLAY_START_M;
		ntp_info.end_time2.sec = DEFAULT_DISPLAY_START_S;
		i=0;
		eeprom_data[i++] = DEFAULT_DISPLAY_ON_OFF;
		eeprom_data[i++] = DEFAULT_DISPLAY_GRADE;
		eeprom_data[i++] = DEFAULT_DISPLAY_START_H;
		eeprom_data[i++] = DEFAULT_DISPLAY_START_M;
		eeprom_data[i++] = DEFAULT_DISPLAY_START_S;
		eeprom_data[i++] = DEFAULT_DISPLAY_START_H;
		eeprom_data[i++] = DEFAULT_DISPLAY_START_M;
		eeprom_data[i++] = DEFAULT_DISPLAY_START_S;
		con_write_eeprom(AA02E48_DISPLAY_ON_OFF2,eeprom_data,i);
		delay_ms(20);	
	}
	else
	{
		ntp_info.display_on_off2 = eeprom_data[i++]&0x01;
		if(eeprom_data[i]<=10)
		{
			ntp_info.display_grade2 = eeprom_data[i];	
		}
		else
		{
			ntp_info.display_grade2=DEFAULT_DISPLAY_GRADE;
		}
		i++;
		if((eeprom_data[i] <= 23) && \
		   (eeprom_data[i+1] <= 59) && \
		   (eeprom_data[i+2] <= 59))
		{
			ntp_info.start_time2.hour = eeprom_data[i];
			ntp_info.start_time2.min = eeprom_data[i+1];
			ntp_info.start_time2.sec = eeprom_data[i+2];	
		}
		else
		{
			ntp_info.start_time2.hour = DEFAULT_DISPLAY_START_H;
			ntp_info.start_time2.min = DEFAULT_DISPLAY_START_M;
			ntp_info.start_time2.sec = DEFAULT_DISPLAY_START_S;
		}
		i++;
		i++;
		i++;
		if((eeprom_data[i] <= 23) && \
		   (eeprom_data[i+1] <= 59) && \
		   (eeprom_data[i+2] <= 59))
		{
			ntp_info.end_time2.hour = eeprom_data[i];
			ntp_info.end_time2.min = eeprom_data[i+1];
			ntp_info.end_time2.sec = eeprom_data[i+2];	
		}
		else
		{
			ntp_info.end_time2.hour = DEFAULT_DISPLAY_START_H;
			ntp_info.end_time2.min = DEFAULT_DISPLAY_START_M;
			ntp_info.end_time2.sec = DEFAULT_DISPLAY_START_S;
		}
	}	
		
	lighting_cotrol2();
	lighting_cotrol2();
	CCP2CON |= 0b00001100;

}	
#endif


#if defined(USE_LIGHTING_MODE)
void lighting_cotrol(void)
{
	
	if(ntp_info.display_on_off1)
	{
		switch(linght_state1)
		{
			case LINGHTING_START:
			{
				if(Compare(ntp_info.end_time1,ntp_info.start_time1)==LESS)
				{
					linght_state1=LINGHTING_ON_COV;
				}
				else
				{
					linght_state1=LINGHTING_ON;
				}
				
				break;	
			}
			case LINGHTING_ON:
			{
				
				if((Compare(old_time,ntp_info.start_time1)==GREATER) && \
				   (Compare(old_time,ntp_info.end_time1)==LESS))
				{
					flag_display_lighting1=1;
				}
				else
				{
					flag_display_lighting1=0;	
				}  
				break;	
			}
			case LINGHTING_ON_COV:
			{
				if((Compare(old_time,ntp_info.start_time1)==GREATER) || \
				   (Compare(old_time,ntp_info.end_time1)==LESS))
				{
					flag_display_lighting1=1;	
				}
				else
				{
					flag_display_lighting1=0;	
				}
				break;	
			}
			
			default:linght_state1=LINGHTING_START;	
		}
					
	}
	else
	{
		flag_display_lighting1=0;
		linght_state1=LINGHTING_START;
	}
		

	if(flag_display_lighting1)
	{
		switch(ntp_info.display_grade1)
		{
			case 1:
			{
				CCPR1L=(LIGHTING_DEFAULT_DUTY-ntp_info.display_grade1*5)>>2;
				CCP1CON &=~0x30;
				CCP1CON |= (((LIGHTING_DEFAULT_DUTY-ntp_info.display_grade1*5)&0x03)<<4)&0x30;
				break;	
			}
			case 2:
			{
				CCPR1L=(LIGHTING_DEFAULT_DUTY-ntp_info.display_grade1*15)>>2;
				CCP1CON &=~0x30;
				CCP1CON |= (((LIGHTING_DEFAULT_DUTY-ntp_info.display_grade1*9)&0x03)<<4)&0x30;
				break;	
			}
			case 3:
			{
				CCPR1L=(LIGHTING_DEFAULT_DUTY-ntp_info.display_grade1*25)>>2;
				CCP1CON &=~0x30;
				CCP1CON |= (((LIGHTING_DEFAULT_DUTY-ntp_info.display_grade1*14)&0x03)<<4)&0x30;
				break;	
			}
			case 4:
			{
				CCPR1L=(LIGHTING_DEFAULT_DUTY-ntp_info.display_grade1*40)>>2;
				CCP1CON &=~0x30;
				CCP1CON |= (((LIGHTING_DEFAULT_DUTY-ntp_info.display_grade1*20)&0x03)<<4)&0x30;
				break;	
			}
			case 5:
			{
				CCPR1L=(LIGHTING_DEFAULT_DUTY-ntp_info.display_grade1*50)>>2;
				CCP1CON &=~0x30;
				CCP1CON |= (((LIGHTING_DEFAULT_DUTY-ntp_info.display_grade1*27)&0x03)<<4)&0x30;
				break;	
			}
			case 6:
			{
				CCPR1L=(LIGHTING_DEFAULT_DUTY-ntp_info.display_grade1*60)>>2;
				CCP1CON &=~0x30;
				CCP1CON |= (((LIGHTING_DEFAULT_DUTY-ntp_info.display_grade1*35)&0x03)<<4)&0x30;
				break;	
			}
			case 7:
			{
				CCPR1L=(LIGHTING_DEFAULT_DUTY-ntp_info.display_grade1*70)>>2;
				CCP1CON &=~0x30;
				CCP1CON |= (((LIGHTING_DEFAULT_DUTY-ntp_info.display_grade1*44)&0x03)<<4)&0x30;
				break;	
			}
			case 8:
			{
				CCPR1L=(LIGHTING_DEFAULT_DUTY-ntp_info.display_grade1*80)>>2;
				CCP1CON &=~0x30;
				CCP1CON |= (((LIGHTING_DEFAULT_DUTY-ntp_info.display_grade1*54)&0x03)<<4)&0x30;
				break;	
			}
			case 9:
			{
				CCPR1L=(LIGHTING_DEFAULT_DUTY-ntp_info.display_grade1*90)>>2;
				CCP1CON &=~0x30;
				CCP1CON |= (((LIGHTING_DEFAULT_DUTY-ntp_info.display_grade1*90)&0x03)<<4)&0x30;
				break;	
			}
			case 10:
			{
				CCPR1L=0;
				CCP1CON &=~0x30;
				break;	
			}
			default:
			{
				CCPR1L=0;
				CCP1CON &=~0x30;
				break;	
			}		
		}		
	}
	else
	{
		CCPR1L=0;
		CCP1CON &=~0x30;
	}
	
	
}
#endif


#if defined(USE_LIGHTING_MODE2)
void lighting_cotrol2(void)
{
	
	if(ntp_info.display_on_off2)
	{
		switch(linght_state2)
		{
			case LINGHTING_START:
			{
				if(Compare(ntp_info.end_time2,ntp_info.start_time2)==LESS)
				{
					linght_state2=LINGHTING_ON_COV;
				}
				else
				{
					linght_state2=LINGHTING_ON;
				}
				
				break;	
			}
			case LINGHTING_ON:
			{
				
				if((Compare(old_time,ntp_info.start_time2)==GREATER) && \
				   (Compare(old_time,ntp_info.end_time2)==LESS))
				{
					flag_display_lighting2=1;
				}
				else
				{
					flag_display_lighting2=0;	
				}  
				break;	
			}
			case LINGHTING_ON_COV:
			{
				if((Compare(old_time,ntp_info.start_time2)==GREATER) || \
				   (Compare(old_time,ntp_info.end_time2)==LESS))
				{
					flag_display_lighting2=1;	
				}
				else
				{
					flag_display_lighting2=0;	
				}
				break;	
			}
			
			default:linght_state2=LINGHTING_START;	
		}
					
	}
	else
	{
		flag_display_lighting2=0;
		linght_state2=LINGHTING_START;
	}
		

	if(flag_display_lighting2)
	{
		switch(ntp_info.display_grade2)
		{
			case 1:
			{
				CCPR2L=(LIGHTING_DEFAULT_DUTY-ntp_info.display_grade2*5)>>2;
				CCP2CON &=~0x30;
				CCP2CON |= (((LIGHTING_DEFAULT_DUTY-ntp_info.display_grade2*5)&0x03)<<4)&0x30;
				break;	
			}
			case 2:
			{
				CCPR2L=(LIGHTING_DEFAULT_DUTY-ntp_info.display_grade2*15)>>2;
				CCP2CON &=~0x30;
				CCP2CON |= (((LIGHTING_DEFAULT_DUTY-ntp_info.display_grade2*9)&0x03)<<4)&0x30;
				break;	
			}
			case 3:
			{
				CCPR2L=(LIGHTING_DEFAULT_DUTY-ntp_info.display_grade2*25)>>2;
				CCP2CON &=~0x30;
				CCP2CON |= (((LIGHTING_DEFAULT_DUTY-ntp_info.display_grade2*14)&0x03)<<4)&0x30;
				break;	
			}
			case 4:
			{
				CCPR2L=(LIGHTING_DEFAULT_DUTY-ntp_info.display_grade2*40)>>2;
				CCP2CON &=~0x30;
				CCP2CON |= (((LIGHTING_DEFAULT_DUTY-ntp_info.display_grade2*20)&0x03)<<4)&0x30;
				break;	
			}
			case 5:
			{
				CCPR2L=(LIGHTING_DEFAULT_DUTY-ntp_info.display_grade2*50)>>2;
				CCP2CON &=~0x30;
				CCP2CON |= (((LIGHTING_DEFAULT_DUTY-ntp_info.display_grade2*27)&0x03)<<4)&0x30;
				break;	
			}
			case 6:
			{
				CCPR2L=(LIGHTING_DEFAULT_DUTY-ntp_info.display_grade2*60)>>2;
				CCP2CON &=~0x30;
				CCP2CON |= (((LIGHTING_DEFAULT_DUTY-ntp_info.display_grade2*35)&0x03)<<4)&0x30;
				break;	
			}
			case 7:
			{
				CCPR2L=(LIGHTING_DEFAULT_DUTY-ntp_info.display_grade2*70)>>2;
				CCP2CON &=~0x30;
				CCP2CON |= (((LIGHTING_DEFAULT_DUTY-ntp_info.display_grade2*44)&0x03)<<4)&0x30;
				break;	
			}
			case 8:
			{
				CCPR2L=(LIGHTING_DEFAULT_DUTY-ntp_info.display_grade2*80)>>2;
				CCP2CON &=~0x30;
				CCP2CON |= (((LIGHTING_DEFAULT_DUTY-ntp_info.display_grade2*54)&0x03)<<4)&0x30;
				break;	
			}
			case 9:
			{
				CCPR2L=(LIGHTING_DEFAULT_DUTY-ntp_info.display_grade2*90)>>2;
				CCP2CON &=~0x30;
				CCP2CON |= (((LIGHTING_DEFAULT_DUTY-ntp_info.display_grade2*90)&0x03)<<4)&0x30;
				break;	
			}
			case 10:
			{
				CCPR2L=0;
				CCP2CON &=~0x30;
				break;	
			}
			default:
			{
				CCPR2L=0;
				CCP2CON &=~0x30;
				break;	
			}		
		}		
	}
	else
	{
		CCPR2L=0;
		CCP2CON &=~0x30;
	}
	
	
}
#endif
