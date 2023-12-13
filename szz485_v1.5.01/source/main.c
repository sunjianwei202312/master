#include "include.h"


static uint8_t tx_udata[TXD_BUFFER_LEN];			//发送时存放的数组
static uint8_t up_led_display;
static uint8_t copy_rx_udata[RXD_BUFFER_LEN];
static BOOL flag_data_process;	//处理串口数据标志
static uint8_t disp_rxd_length;

static DATE copy_old_date;
static TIME copy_old_time;
#if defined(USE_INFRARED_MODE)
static BOOL flag_disp_true;
#endif

extern unsigned char WeekDay20(unsigned char y, unsigned char m, unsigned char d);
extern TIME old_time;
extern DATE old_date;
extern uint8_t up_time_flag;				//更新时间标志

extern uint8_t rx_udata[RXD_BUFFER_LEN];

extern uint8_t timer1_cnt;
extern BOOL flag_jiaoshi;
extern BOOL flag_dian1;
#if defined(USE_TWO_FACE)
extern BOOL flag_dian2;
#endif
extern uint8_t my_id_code;
extern NTP_INFO ntp_info;


extern uint8_t jiaoshi_cnt;
extern uint8_t flag_display_lighting1;
extern uint8_t usart_timer_cnt;
extern uint8_t usart_count;
extern uint8_t flag_usart_start;

#if defined(USE_YEAR_MONTH_DATA)
extern uint8_t up_date_flag;
#endif
#if defined(USE_INFRARED_MODE)	
enum
{
	DISP_STATE_NORMAL=0,
	DISP_STATE_TIME
}disp_state=DISP_STATE_NORMAL;	
#endif	
extern uint8_t disp_data_time[4];	
#if defined(USE_INFRARED_MODE)
extern uint8_t flicker_num,flicker_data_copy;
extern uint8_t flicker_count;
#endif

#if defined(USE_LIGHTING_MODE) && !defined(USE_LIGHTING_MODE2)
extern enum
{
	LINGHTING_START=0,
	LINGHTING_ON,
	LINGHTING_ON_COV
}linght_state1;
#elif !defined(USE_LIGHTING_MODE) && defined(USE_LIGHTING_MODE2)
extern enum
{
	LINGHTING_START=0,
	LINGHTING_ON,
	LINGHTING_ON_COV
}linght_state2;
#elif defined(USE_LIGHTING_MODE) && defined(USE_LIGHTING_MODE2)
extern enum
{
	LINGHTING_START=0,
	LINGHTING_ON,
	LINGHTING_ON_COV
}linght_state1,linght_state2;

#endif


#if defined(USE_TEMP_HUMI_MODE)
uint8_t flag_temp_shi;
extern u8 DHT11_Store[5];//DHT11数据
#endif
__CONFIG(HS & WDTEN & PWRTDIS & MCLREN & CP \
	 & CPD& BOREN& IESODIS& FCMDIS & LVPDIS &DEBUGEN); //配置字
void main(void)
{
	uint16_t chk_value,calc_chk_value;
	uint16_t func,copy_func;
	uint8_t	i,j,flag_send_data,flag_save_data;
	static uint8_t save_time_cnt=0;
	uint8_t	len_cnt,flag_temp;
	
		
	interupt_init();
	system_value_init();
	timer1_init();
	ds3231_init();
	usart_init();
	get_time();
	
	#if defined(USE_TEMP_HUMI_MODE)
	temp_value=25;//温度
	humi_value=30;//湿度
	DHT11_HUMR_PIN=0;
	DHT11_HUMR_VALUE=1;
	DH11_ReadTempAndHumi();
	DHT11_HUMR_PIN=0;
	DHT11_HUMR_VALUE=1;
	#endif
	lcd_init();
	
	
	timer2_init();
	#if defined(USE_INFRARED_MODE)		 	
	ir_init();
	#endif
	#if defined(USE_LIGHTING_MODE)
	lighting_init();
	#endif
	#if defined(USE_LIGHTING_MODE2)
	lighting_init2();
	#endif
	
	
	while(1)
	{
			
		//*
		if(usart_timer_cnt>5)
		{
			flag_usart_start=0;
			usart_count=0;
			usart_timer_cnt=0;
			if((rx_udata[0]==DATA_HEAD1)&&(rx_udata[1]<RXD_BUFFER_LEN-4))
			{
				if(rx_udata[rx_udata[1]+4]==DATA_TAIL1)
				{
					RX_INTERRUPT=0;
					func = rx_udata[REPLY_FUNC_POSITION]<<8;
					func += rx_udata[REPLY_FUNC_POSITION+1];
					i=rx_udata[REPLY_ID_POSITION];
					if((func == FUN_CLOCK_JIAOSHI) ||(i == my_id_code) || (i == 0xff))
					{
						disp_rxd_length=rx_udata[1]+5;
						for(i=0;i<disp_rxd_length;i++)
						{
							copy_rx_udata[i]=rx_udata[i];
							rx_udata[i]=0;
						} 
						flag_data_process=1;	
					}
					RX_INTERRUPT=1;
							
				}	
			}		
		}	

		flag_send_data=0;
		flag_save_data=0;
		flag_temp=0;
		if(flag_data_process == TRUE)
 		{
			
			chk_value =  copy_rx_udata[disp_rxd_length-2] + copy_rx_udata[disp_rxd_length-3]*256;
			calc_chk_value = MakeCRC16(&copy_rx_udata[0],disp_rxd_length-3);
			if(chk_value == calc_chk_value)
			{
				func = copy_rx_udata[2]<<8;
				func += copy_rx_udata[3];
				
	
				
				switch(func)
				{
					case FUN_CLOCK_JIAOSHI:
					{
						if(disp_rxd_length < LENGTH_CLOCK_JIAOSHI)
						{
							break;
						}
						#if defined(USE_TEST_MODE)
						{
							old_date.year = (copy_rx_udata[4]*256+copy_rx_udata[5]) % 100;
							old_date.month = copy_rx_udata[6];
							old_date.date = copy_rx_udata[7];
							//old_date.day  = copy_rx_udata[18];
							old_time.hour = copy_rx_udata[8];
							old_time.min  = copy_rx_udata[9];
							old_time.sec  = copy_rx_udata[10];
							
							MAIN_CLOCK_L = 0;
							MAIN_CLOCK_H = 0;
							timer1_cnt = 0;
							
							flag_jiaoshi = TRUE;
							flag_save_data=USART_SAVE_TIME;
							jiaoshi_cnt=0;
						}
						#else
						{
							
							
							i = REPLY_JIAOSHI_POSITION;
							chk_value = copy_rx_udata[i++]*256;
							chk_value += copy_rx_udata[i++];
							chk_value %= 100;
							if((chk_value>=13) && \
							   (copy_rx_udata[i]<=12) && \
							   (copy_rx_udata[i+1]<=31) && \
							   (copy_rx_udata[i+2]<=23) && \
							   (copy_rx_udata[i+3]<=59) && \
							   (copy_rx_udata[i+4]<=59))
							{
				 				copy_old_date.year = chk_value;
				 				copy_old_date.month = copy_rx_udata[i++];
				 				copy_old_date.date = copy_rx_udata[i++];
				 				copy_old_time.hour = copy_rx_udata[i++];
				 				copy_old_time.min  = copy_rx_udata[i++];
				 				copy_old_time.sec  = copy_rx_udata[i];
					 				
				 				
					 			if(copy_old_time.sec == 0)
					 			{
						 			old_date.year =copy_old_date.year;
									old_date.month =copy_old_date.month;
									old_date.date =copy_old_date.date;
									old_time.hour = copy_old_time.hour;
									old_time.min  = copy_old_time.min;
									old_time.sec  = copy_old_time.sec;
									
									MAIN_CLOCK_L = 0;
									MAIN_CLOCK_H = 0;
									timer1_cnt = 0;
								
									flag_jiaoshi = TRUE;
									up_led_display=1;
									//if((old_time.min!=0)||(old_time.min!=59)){	
										flag_save_data=USART_SAVE_TIME;
									//}	
									
						 		}			
							
				 				jiaoshi_cnt=0;
				 			}	
									
								
									
						}
						#endif
						
					
						break;
					}
					case FUN_CLOCK_QUERY:
					{
						if(disp_rxd_length < LENGTH_QUERY)
						{
							break;
						}
						if(copy_rx_udata[REPLY_ID_POSITION]==my_id_code)
						{
							flag_send_data=1;
						}
						break;
					}
					case FUN_CLOCK_VERSION:
					{
						flag_send_data=1;
						break;	
					}
					case FUN_CLOCK_RESET:
					{
						if(disp_rxd_length < LENGTH_RESET)
						{
							break;
						}
						if(copy_rx_udata[REPLY_ID_POSITION]==my_id_code)
						{
							flag_send_data=1;
						}
						Reset();
						break;
					}			
					
					#if defined(USE_ZONE_SAVE)
					case FUN_CLOCK_ZZSQ:
					{
						if(disp_rxd_length<LENGTH_ZZSQ)
						{
							return;	
						}
						
						if((copy_rx_udata[REPLY_ZZSQ_POSITION]&(~ZZSQ_E))<=12)
						{
							ntp_info.time_zone=copy_rx_udata[REPLY_ZZSQ_POSITION];		
							flag_save_data=USART_SAVE_ZONE;
						}	
						else
						{
							flag_temp++;	
						}
						
						if(copy_rx_udata[REPLY_ID_POSITION]==my_id_code)
						{
							flag_send_data=1;
						}
						break;
					}
					#endif
					#if defined(USE_ZONE_SAVE) || defined(USE_LIGHTING_MODE) || defined(USE_LIGHTING_MODE2) 
					case FUN_CLOCK_DEFAULT:
					{
						if(disp_rxd_length<LENGTH_DEFAULT)
						{
							return;	
						}												   
						
						flag_save_data=USART_SAVE_DEFAULT;
						
						
						if(copy_rx_udata[REPLY_ID_POSITION]==my_id_code)
						{
							flag_send_data=1;
						}
						
						break;	
					}
					#endif
					#if defined(USE_LIGHTING_MODE)|| defined(USE_LIGHTING_MODE2)
					case FUN_CLOCK_DISPLAY:
					{
						if(disp_rxd_length<LENGTH_DISPLAY)
						{
							return;	
						}
						i=REPLY_FACE_POSITION;
		
						#if defined(USE_LIGHTING_MODE) && !defined(USE_LIGHTING_MODE2)
						i++;
						ntp_info.display_on_off1 = copy_rx_udata[i++]&0x01;
						if(copy_rx_udata[i]<=10)
						{
							ntp_info.display_grade1 = copy_rx_udata[i];	
						}
						else
						{
							flag_temp++;	
						}	
						i++;
						if((copy_rx_udata[i] <= 23) && \
						   (copy_rx_udata[i+1] <= 59) && \
						   (copy_rx_udata[i+2] <= 59))
						{
							ntp_info.start_time1.hour = copy_rx_udata[i];
							ntp_info.start_time1.min = copy_rx_udata[i+1];
							ntp_info.start_time1.sec = copy_rx_udata[i+2];	
						}
						else
						{
							flag_temp++;	
						}	
						i++;
						i++;
						i++;
						if((copy_rx_udata[i] <= 23) && \
						   (copy_rx_udata[i+1] <= 59) && \
						   (copy_rx_udata[i+2] <= 59))
						{
							ntp_info.end_time1.hour = copy_rx_udata[i];
							ntp_info.end_time1.min = copy_rx_udata[i+1];
							ntp_info.end_time1.sec = copy_rx_udata[i+2];	
						}
						else
						{
							flag_temp++;	
						}		
					 	linght_state1=LINGHTING_START;
					 
						flag_save_data=USART_SAVE_LIGHTING;
						if(copy_rx_udata[REPLY_ID_POSITION]==my_id_code)
						{
							flag_send_data=1;
						}
						#elif !defined(USE_LIGHTING_MODE) && defined(USE_LIGHTING_MODE2)
						i++;
						ntp_info.display_on_off2 = copy_rx_udata[i++]&0x01;
						if(copy_rx_udata[i]<=10)
						{
							ntp_info.display_grade2 = copy_rx_udata[i];	
						}
						else
						{
							flag_temp++;	
						}	
						i++;
						if((copy_rx_udata[i] <= 23) && \
						   (copy_rx_udata[i+1] <= 59) && \
						   (copy_rx_udata[i+2] <= 59))
						{
							ntp_info.start_time2.hour = copy_rx_udata[i];
							ntp_info.start_time2.min = copy_rx_udata[i+1];
							ntp_info.start_time2.sec = copy_rx_udata[i+2];	
						}
						else
						{
							flag_temp++;	
						}	
						i++;
						i++;
						i++;
						if((copy_rx_udata[i] <= 23) && \
						   (copy_rx_udata[i+1] <= 59) && \
						   (copy_rx_udata[i+2] <= 59))
						{
							ntp_info.end_time2.hour = copy_rx_udata[i];
							ntp_info.end_time2.min = copy_rx_udata[i+1];
							ntp_info.end_time2.sec = copy_rx_udata[i+2];	
						}
						else
						{
							flag_temp++;	
						}		
					 	linght_state2=LINGHTING_START;
					 
						flag_save_data=USART_SAVE_LIGHTING;
						if(copy_rx_udata[REPLY_ID_POSITION]==my_id_code)
						{
							flag_send_data=1;
						}
						#else
						if(copy_rx_udata[i]==0x01)
						{
							i++;
							ntp_info.display_on_off1 = copy_rx_udata[i++]&0x01;
							if(copy_rx_udata[i]<=10)
							{
								ntp_info.display_grade1 = copy_rx_udata[i];	
							}
							else
							{
								flag_temp++;	
							}	
							i++;
							if((copy_rx_udata[i] <= 23) && \
							   (copy_rx_udata[i+1] <= 59) && \
							   (copy_rx_udata[i+2] <= 59))
							{
								ntp_info.start_time1.hour = copy_rx_udata[i];
								ntp_info.start_time1.min = copy_rx_udata[i+1];
								ntp_info.start_time1.sec = copy_rx_udata[i+2];	
							}
							else
							{
								flag_temp++;	
							}	
							i++;
							i++;
							i++;
							if((copy_rx_udata[i] <= 23) && \
							   (copy_rx_udata[i+1] <= 59) && \
							   (copy_rx_udata[i+2] <= 59))
							{
								ntp_info.end_time1.hour = copy_rx_udata[i];
								ntp_info.end_time1.min = copy_rx_udata[i+1];
								ntp_info.end_time1.sec = copy_rx_udata[i+2];	
							}
							else
							{
								flag_temp++;	
							}		
						 	linght_state1=LINGHTING_START;
						 
							flag_save_data=USART_SAVE_LIGHTING;
							if(copy_rx_udata[REPLY_ID_POSITION]==my_id_code)
							{
								flag_send_data=1;
							}		
						}
						else if(copy_rx_udata[i]==0x02)
						{
							i++;
							ntp_info.display_on_off2 = copy_rx_udata[i++]&0x01;
							if(copy_rx_udata[i]<=10)
							{
								ntp_info.display_grade2 = copy_rx_udata[i];	
							}
							else
							{
								flag_temp++;	
							}	
							i++;
							if((copy_rx_udata[i] <= 23) && \
							   (copy_rx_udata[i+1] <= 59) && \
							   (copy_rx_udata[i+2] <= 59))
							{
								ntp_info.start_time2.hour = copy_rx_udata[i];
								ntp_info.start_time2.min = copy_rx_udata[i+1];
								ntp_info.start_time2.sec = copy_rx_udata[i+2];	
							}
							else
							{
								flag_temp++;	
							}	
							i++;
							i++;
							i++;
							if((copy_rx_udata[i] <= 23) && \
							   (copy_rx_udata[i+1] <= 59) && \
							   (copy_rx_udata[i+2] <= 59))
							{
								ntp_info.end_time2.hour = copy_rx_udata[i];
								ntp_info.end_time2.min = copy_rx_udata[i+1];
								ntp_info.end_time2.sec = copy_rx_udata[i+2];	
							}
							else
							{
								flag_temp++;	
							}		
						 	linght_state2=LINGHTING_START;
						 
							flag_save_data=USART_SAVE_LIGHTING;
							if(copy_rx_udata[REPLY_ID_POSITION]==my_id_code)
							{
								flag_send_data=1;
							}	
						}
						else if(copy_rx_udata[i]==0xff)
						{
							i++;
							ntp_info.display_on_off1 = copy_rx_udata[i++]&0x01;
							ntp_info.display_on_off2 = ntp_info.display_on_off1;
							if(copy_rx_udata[i]<=10)
							{
								ntp_info.display_grade1 = copy_rx_udata[i];
								ntp_info.display_grade2 = ntp_info.display_grade1;	
							}
							else
							{
								flag_temp++;	
							}	
							i++;
							if((copy_rx_udata[i] <= 23) && \
							   (copy_rx_udata[i+1] <= 59) && \
							   (copy_rx_udata[i+2] <= 59))
							{
								ntp_info.start_time1.hour = copy_rx_udata[i];
								ntp_info.start_time1.min = copy_rx_udata[i+1];
								ntp_info.start_time1.sec = copy_rx_udata[i+2];
								ntp_info.start_time2.hour = ntp_info.start_time1.hour;
								ntp_info.start_time2.min = ntp_info.start_time1.min;
								ntp_info.start_time2.sec = ntp_info.start_time1.sec;	
							}
							else
							{
								flag_temp++;	
							}	
							i++;
							i++;
							i++;
							if((copy_rx_udata[i] <= 23) && \
							   (copy_rx_udata[i+1] <= 59) && \
							   (copy_rx_udata[i+2] <= 59))
							{
								ntp_info.end_time1.hour = copy_rx_udata[i];
								ntp_info.end_time1.min = copy_rx_udata[i+1];
								ntp_info.end_time1.sec = copy_rx_udata[i+2];
								ntp_info.end_time2.hour = ntp_info.end_time1.hour;
								ntp_info.end_time2.min = ntp_info.end_time1.min;
								ntp_info.end_time2.sec = ntp_info.end_time1.sec;	
							}
							else
							{
								flag_temp++;	
							}		
						 	linght_state1=LINGHTING_START;
						 	linght_state2=linght_state1;
							flag_save_data=USART_SAVE_LIGHTING;
							if(copy_rx_udata[REPLY_ID_POSITION]==my_id_code)
							{
								flag_send_data=1;
							}	
						}		
						
						#endif	
						break;	
					}
					#endif
					#if defined(USE_TEST_LED)
					case FUN_CLOCK_TEST:
					{
						if(disp_rxd_length<LENGTH_TEST)
						{
							return;	
						}
						i=REPLY_FACE_POSITION;
						if(copy_rx_udata[i]==1)
					 	{
							i++;
							if(copy_rx_udata[i]<=8)
							{
								ntp_info.test_mode1 = copy_rx_udata[i];	
							}
							else
							{
								flag_temp++;	
							}
					 	}
					 	else if(copy_rx_udata[i]==2)
					 	{
							i++;
							if(copy_rx_udata[i]<=8)
							{
								ntp_info.test_mode2 = copy_rx_udata[i];	
							}
							else
							{
								flag_temp++;	
							}
					 	}
						else if(copy_rx_udata[i]==0XFF)
					 	{
							i++;
							if(copy_rx_udata[i]<=8)
							{
								ntp_info.test_mode1 = copy_rx_udata[i];
								ntp_info.test_mode2 = copy_rx_udata[i];	
							}
							else
							{
								flag_temp++;	
							}
					 	}
						
						
						if(copy_rx_udata[REPLY_ID_POSITION]==my_id_code)
						{
							flag_send_data=1;
						}
							
						break;	
					}
					#endif
					#if defined(USE_DJS_MODE1) || defined(USE_DJS_MODE2)
					case FUN_CLOCK_DJS:
					{
						if(disp_rxd_length<LENGTH_DJS)
						{
							return;	
						}
						
						i=REPLY_FACE_POSITION;
						#if (defined(USE_DJS_MODE1) && !defined(USE_DJS_MODE2))
						{
							i++;
							ntp_info.djs_on_off1 = copy_rx_udata[i++]&0x01;
							
							if((copy_rx_udata[i] <= 23) && \
							   (copy_rx_udata[i+1] <= 59) && \
							   (copy_rx_udata[i+2] <= 59))
							{
								ntp_info.djs_start_time1.hour = copy_rx_udata[i];
								ntp_info.djs_start_time1.min = copy_rx_udata[i+1];
								ntp_info.djs_start_time1.sec = copy_rx_udata[i+2];	
							}
							else
							{
								flag_temp++;	
							}	
							i++;
							i++;
							i++;
							if((copy_rx_udata[i] <= 23) && \
							   (copy_rx_udata[i+1] <= 59) && \
							   (copy_rx_udata[i+2] <= 59))
							{
								ntp_info.djs_con_time1.hour = copy_rx_udata[i];
								ntp_info.djs_con_time1.min = copy_rx_udata[i+1];
								ntp_info.djs_con_time1.sec = copy_rx_udata[i+2];	
							}
							else
							{
								flag_temp++;	
							}	
						} 
						#elif (!defined(USE_DJS_MODE1) && defined(USE_DJS_MODE2))
					 	{
							i++;
							ntp_info.djs_on_off2 = copy_rx_udata[i++]&0x01;
							
							if((copy_rx_udata[i] <= 23) && \
							   (copy_rx_udata[i+1] <= 59) && \
							   (copy_rx_udata[i+2] <= 59))
							{
								ntp_info.djs_start_time2.hour = copy_rx_udata[i];
								ntp_info.djs_start_time2.min = copy_rx_udata[i+1];
								ntp_info.djs_start_time2.sec = copy_rx_udata[i+2];	
							}
							else
							{
								flag_temp++;	
							}	
							i++;
							i++;
							i++;
							if((copy_rx_udata[i] <= 23) && \
							   (copy_rx_udata[i+1] <= 59) && \
							   (copy_rx_udata[i+2] <= 59))
							{
								ntp_info.djs_con_time2.hour = copy_rx_udata[i];
								ntp_info.djs_con_time2.min = copy_rx_udata[i+1];
								ntp_info.djs_con_time2.sec = copy_rx_udata[i+2];	
							}
							else
							{
								flag_temp++;	
							}	
					 	}
					 	#elif (defined(USE_DJS_MODE1) && defined(USE_DJS_MODE2))
						if(copy_rx_udata[i]==1)
					 	{
							i++;
							ntp_info.djs_on_off1 = copy_rx_udata[i++]&0x01;
							
							if((copy_rx_udata[i] <= 23) && \
							   (copy_rx_udata[i+1] <= 59) && \
							   (copy_rx_udata[i+2] <= 59))
							{
								ntp_info.djs_start_time1.hour = copy_rx_udata[i];
								ntp_info.djs_start_time1.min = copy_rx_udata[i+1];
								ntp_info.djs_start_time1.sec = copy_rx_udata[i+2];	
							}
							else
							{
								flag_temp++;	
							}	
							i++;
							i++;
							i++;
							if((copy_rx_udata[i] <= 23) && \
							   (copy_rx_udata[i+1] <= 59) && \
							   (copy_rx_udata[i+2] <= 59))
							{
								ntp_info.djs_con_time1.hour = copy_rx_udata[i];
								ntp_info.djs_con_time1.min = copy_rx_udata[i+1];
								ntp_info.djs_con_time1.sec = copy_rx_udata[i+2];	
							}
							else
							{
								flag_temp++;	
							}		
					 	}
					 	else if(copy_rx_udata[i]==2)
					 	{
							i++;
							ntp_info.djs_on_off2 = copy_rx_udata[i++]&0x01;
							
							if((copy_rx_udata[i] <= 23) && \
							   (copy_rx_udata[i+1] <= 59) && \
							   (copy_rx_udata[i+2] <= 59))
							{
								ntp_info.djs_start_time2.hour = copy_rx_udata[i];
								ntp_info.djs_start_time2.min = copy_rx_udata[i+1];
								ntp_info.djs_start_time2.sec = copy_rx_udata[i+2];	
							}
							else
							{
								flag_temp++;	
							}	
							i++;
							i++;
							i++;
							if((copy_rx_udata[i] <= 23) && \
							   (copy_rx_udata[i+1] <= 59) && \
							   (copy_rx_udata[i+2] <= 59))
							{
								ntp_info.djs_con_time2.hour = copy_rx_udata[i];
								ntp_info.djs_con_time2.min = copy_rx_udata[i+1];
								ntp_info.djs_con_time2.sec = copy_rx_udata[i+2];	
							}
							else
							{
								flag_temp++;	
							}	
					 	}
					 	#endif	
					 	if(copy_rx_udata[REPLY_ID_POSITION]==my_id_code)
						{
							flag_send_data=1;
						}
						break;	
					}
					#endif	
				}
				
				
			}
 			flag_data_process=FALSE;
 		}

 		
 		
 		
 		if(flag_send_data)
 		{
 			i = 0;
			tx_udata[i++] = DATA_HEAD1;
			len_cnt = i;
			i++;
			copy_func = func+1;
			tx_udata[i++] = copy_func>>8;
			tx_udata[i++] = copy_func&0x00ff;
			tx_udata[i++] = my_id_code;
	 		switch(func)
	 		{
	 			case FUN_CLOCK_QUERY:
	 			{
					if(flag_jiaoshi)
					{
						tx_udata[i++] = 0;
					}
					else
					{
						tx_udata[i++] = WARRING_NOT_JIAOSHI;
					}
					
					tx_udata[i]=DIGITAL_CLOCK | ZZH_24HOUR;
					#if defined(USE_DJS_MODE1) || defined(USE_DJS_MODE2)
					tx_udata[i]|=ZZH_SUPPORT_DJS;
					#endif
					#if !defined(USE_TWO_FACE)
					{
						tx_udata[i++] |= MOTOR_ONE_FACE;
					}
					#else
					{
						tx_udata[i++] |= MOTOR_TWO_FACE;
					}
					#endif
					
					
					
					
					
					
						
		 			break;	
		 		}
		 		case FUN_CLOCK_VERSION:
		 		{
			 		
			 		tx_udata[i++] = PROGRAM_VERSION>>8;
			 		tx_udata[i++] = PROGRAM_VERSION&0x00ff;
			 		break;	
			 	}
		 		case FUN_CLOCK_RESET:
	 			{
		 			tx_udata[i++] = 1;
					Reset();	
		 			break;	
		 		}
		 		#if defined(USE_ZONE_SAVE)
			 	case FUN_CLOCK_ZZSQ:
			 	#endif
		 		case FUN_CLOCK_DEFAULT:
	 			#if defined(USE_LIGHTING_MODE) || defined(USE_LIGHTING_MODE2)
			 	case FUN_CLOCK_DISPLAY:
			 	#endif
			 	#if defined(USE_TEST_LED)
				case FUN_CLOCK_TEST:
				#endif
				#if defined(USE_DJS_MODE1) || defined(USE_DJS_MODE2)
				case FUN_CLOCK_DJS:
				#endif
		 		{
			 		if(flag_temp)
			 		{
				 		tx_udata[i++]=0;
				 	}
				 	else
				 	{	
		 				tx_udata[i++]=1;
		 			}	
		 			break;	
		 		}
			 	
		 			
	 		}
	 		tx_udata[len_cnt] = i-len_cnt -1;
			chk_value = MakeCRC16(&tx_udata[0],i);
			tx_udata[i++] = chk_value / 256;
			tx_udata[i++] = chk_value % 256;
			tx_udata[i++] = DATA_TAIL1;
			SEL_RS485_TX();
			delay_1us;
			for(j = 0;j<i;j++)
			{
				putch(tx_udata[j]);
			}
			delay_1us;
			SEL_RS485_RX();	
	 	}	
 		
 		switch(flag_save_data)
 		{
	 		case USART_SAVE_TIME:
	 		{		 	
		 			settime();//通讯有效时候，每分钟将时间压入DS3231后，需要执行下条指令，
					calc_zone();//计算北京时间+8！added by sjw
				
		 		break;	
		 	}
		 	#if defined(USE_ZONE_SAVE)
		 	case USART_SAVE_ZONE:
	 		{
	 			i=0;
	 			tx_udata[i++] = ntp_info.time_zone;
		 		con_write_eeprom(AA02E48_TIME_ZONE,tx_udata,i);		 		
		 		get_time();
		 		
		 		break;	
		 	}
		 	#endif
		 	#if defined(USE_ZONE_SAVE) || defined(USE_LIGHTING_MODE) || defined(USE_LIGHTING_MODE2)
		 	case USART_SAVE_DEFAULT:
	 		{
		 		#if defined(USE_ZONE_SAVE)	
	 			i=0;
	 			tx_udata[i++] = DEFAULT_TIME_ZONE;
	 			tx_udata[i++] = DEFAULT_DISPLAY_ON_OFF;
	 			tx_udata[i++] = DEFAULT_DISPLAY_GRADE;
	 			tx_udata[i++] = DEFAULT_DISPLAY_START_H;
	 			tx_udata[i++] = DEFAULT_DISPLAY_START_M;
	 			tx_udata[i++] = DEFAULT_DISPLAY_START_S;
	 			tx_udata[i++] = DEFAULT_DISPLAY_END_H;
	 			tx_udata[i++] = DEFAULT_DISPLAY_END_M;
	 			tx_udata[i++] = DEFAULT_DISPLAY_END_S;
	 			tx_udata[i++] = DEFAULT_DISPLAY_ON_OFF;
	 			tx_udata[i++] = DEFAULT_DISPLAY_GRADE;
	 			tx_udata[i++] = DEFAULT_DISPLAY_START_H;
	 			tx_udata[i++] = DEFAULT_DISPLAY_START_M;
	 			tx_udata[i++] = DEFAULT_DISPLAY_START_S;
	 			tx_udata[i++] = DEFAULT_DISPLAY_END_H;
	 			tx_udata[i++] = DEFAULT_DISPLAY_END_M;
	 			tx_udata[i++] = DEFAULT_DISPLAY_END_S;
		 		con_write_eeprom(AA02E48_TIME_ZONE,tx_udata,i);
		 		
		 		Reset();
		 		#endif
		 		break;	
		 	}
		 	#endif	
 			#if defined(USE_LIGHTING_MODE) || defined(USE_LIGHTING_MODE2)
		 	case USART_SAVE_LIGHTING:
	 		{
		 		#if defined(USE_LIGHTING_MODE) && !defined(USE_LIGHTING_MODE2)
		 		i=0;
				tx_udata[i++] = ntp_info.display_on_off1;
				tx_udata[i++] = ntp_info.display_grade1;
				tx_udata[i++] = ntp_info.start_time1.hour;
				tx_udata[i++] = ntp_info.start_time1.min;
				tx_udata[i++] = ntp_info.start_time1.sec;
				tx_udata[i++] = ntp_info.end_time1.hour;
				tx_udata[i++] = ntp_info.end_time1.min;
				tx_udata[i++] = ntp_info.end_time1.sec;
				con_write_eeprom(AA02E48_DISPLAY_ON_OFF1,tx_udata,i);
				delay_ms(20);	
				#elif !defined(USE_LIGHTING_MODE) && defined(USE_LIGHTING_MODE2)											   
				i=0;
				tx_udata[i++] = ntp_info.display_on_off2;
				tx_udata[i++] = ntp_info.display_grade2;
				tx_udata[i++] = ntp_info.start_time2.hour;
				tx_udata[i++] = ntp_info.start_time2.min;
				tx_udata[i++] = ntp_info.start_time2.sec;
				tx_udata[i++] = ntp_info.end_time2.hour;
				tx_udata[i++] = ntp_info.end_time2.min;
				tx_udata[i++] = ntp_info.end_time2.sec;
				con_write_eeprom(AA02E48_DISPLAY_ON_OFF2,tx_udata,i);
				delay_ms(20);
				#else
				i=0;
				tx_udata[i++] = ntp_info.display_on_off1;
				tx_udata[i++] = ntp_info.display_grade1;
				tx_udata[i++] = ntp_info.start_time1.hour;
				tx_udata[i++] = ntp_info.start_time1.min;
				tx_udata[i++] = ntp_info.start_time1.sec;
				tx_udata[i++] = ntp_info.end_time1.hour;
				tx_udata[i++] = ntp_info.end_time1.min;
				tx_udata[i++] = ntp_info.end_time1.sec;
				con_write_eeprom(AA02E48_DISPLAY_ON_OFF1,tx_udata,i);
				delay_ms(20);
				
				i=0;
				tx_udata[i++] = ntp_info.display_on_off2;
				tx_udata[i++] = ntp_info.display_grade2;
				tx_udata[i++] = ntp_info.start_time2.hour;
				tx_udata[i++] = ntp_info.start_time2.min;
				tx_udata[i++] = ntp_info.start_time2.sec;
				tx_udata[i++] = ntp_info.end_time2.hour;
				tx_udata[i++] = ntp_info.end_time2.min;
				tx_udata[i++] = ntp_info.end_time2.sec;
				con_write_eeprom(AA02E48_DISPLAY_ON_OFF2,tx_udata,i);
				delay_ms(20);
				
				#endif
		 		break;	
		 	}
		 	#endif	
 			
				
 		}
 		
 		
 		
 		
 		//*/
		if(up_time_flag)
		{
			if(old_time.sec!=0)//求星期的时候，也是秒不为0的时候求，否则有闪烁现象added by sjw
				//在2023年8月16日周三添加这句	
				old_date.day= WeekDay20(old_date.year,old_date.month,old_date.date);
			
			up_time_flag--;
			up_led_display=1;
			if(jiaoshi_cnt >= 120)
			{
				flag_jiaoshi = FALSE;
			}
			else
			{
				jiaoshi_cnt++;
			}
			
			#if defined(USE_YEAR_MONTH_DATA)
				
				
				if(up_date_flag==FLAG_DATE_DEC)
				{
					
					date_dec(&old_date);
				}
				else if(up_date_flag==FLAG_DATE_ADD)
				{
					date_add(&old_date);	
				}
				up_date_flag=time_add(&old_time);
			#else
				time_add(&old_time);
			#endif
			
			
			
			
			if((old_time.hour == 3) && (old_time.min == 26) && (old_time.sec == 13))
			{
				Reset();
			    //为了处理软件重启后子钟时间不正确的问题，宋总考虑是3231复位不同步造成的，
				//添加了以下两条指令，经过2003年8月7日现场和8月9日回公司测试，都无问题
				//修改时间是2023年8月5日于上海华东航空大酒店 313房间！！added by sjw
				delay_ms(100);
				while(1);
			}
			if((old_time.sec == 10) && (old_time.min == 10))
			{
				get_time();//1个小时读取一次RTC的时间
			}
			
			CLRWDT();
			
			
				//GIE=0;
				//DHT11_HUMR_PIN=0;
				//DHT11_HUMR_VALUE	= 1;
			#if defined(USE_TEMP_HUMI_MODE)
				flag_temp_shi=DH11_ReadTempAndHumi();	
				DHT11_HUMR_PIN=0;
				DHT11_HUMR_VALUE	= 1;
				
				SEL_RS485_TX();
				delay_1us;
				//for(j = 0;j<i;j++)
				{
					putch(DHT11_Store[0]);
					putch(DHT11_Store[1]);
					putch(DHT11_Store[2]);
					putch(DHT11_Store[3]);
					putch(DHT11_Store[4]);
					putch(flag_temp_shi);
					
				}
				delay_1us;
				SEL_RS485_RX();	
			#endif
			
			
		}
		
		if(up_led_display==1)
		{
			up_led_display=0;
			#if defined(ONE_USE_HMS)
			{
				if(flag_jiaoshi == FALSE)
				{
					if((old_time.sec % 2 ) == 0)
					{
						flag_dian1 = FALSE;
					}	
					else
					{
						flag_dian1 = TRUE;
					}	
				}
				else
				{
					flag_dian1 = TRUE;
				}
			}
			#elif defined(ONE_USE_HM)
			{
				if(flag_jiaoshi == TRUE)
				{
					if((old_time.sec % 2 ) == 0)
					{
						flag_dian1 = FALSE;
					}	
					else
					{
						flag_dian1 = TRUE;
					}	
				}
				else
				{
					flag_dian1 = TRUE;
				}
			}
			#endif
			
			#if defined(USE_TWO_FACE)
			#if defined(TWO_USE_HMS)
			{
				if(flag_jiaoshi == FALSE)
				{
					if((old_time.sec % 2 ) == 0)
					{
						flag_dian2 = FALSE;
					}	
					else
					{
						flag_dian2 = TRUE;
					}	
				}
				else
				{
					flag_dian2 = TRUE;
				}
			}
			#elif defined(TWO_USE_HM)
			{
				if(flag_jiaoshi == TRUE)
				{
					if((old_time.sec % 2 ) == 0)
					{
						flag_dian2 = FALSE;
					}	
					else
					{
						flag_dian2 = TRUE;
					}	
				}
				else
				{
					flag_dian2 = TRUE;
				}
			}
			#endif
			#endif
			#if defined(USE_INFRARED_MODE)
			switch(disp_state)
			{
				case DISP_STATE_NORMAL:
				{
					disp_data_time[0]=(old_time.min%100)%10;
					disp_data_time[1]=(old_time.min%100)/10;
					disp_data_time[2]=(old_time.hour%100)%10;
					disp_data_time[3]=(old_time.hour%100)/10;
					
					
					 
					break;
				}
				case DISP_STATE_TIME:
				{
					
					
					
					for(i=0;i<4;i++)
					{
						if(i == flicker_num)
						{
							if(((old_time.sec % 2) == 0) || (flag_disp_true==1))
							{
								flag_disp_true=0;
								disp_data_time[i]=flicker_data_copy;		
							}
							else
							{
								disp_data_time[i]=10;
							}	
						}
							
						
					}
					break;
				}
				
			}
			
			
			

			#else
				disp_data_time[0]=(old_time.min%100)%10;
				disp_data_time[1]=(old_time.min%100)/10;
				disp_data_time[2]=(old_time.hour%100)%10;
				disp_data_time[3]=(old_time.hour%100)/10;
			#endif
			#if defined(USE_INFRARED_MODE)
			if(flicker_count <= 60)
			{
				flicker_count++;
			}
			else
			{
				disp_state = DISP_STATE_NORMAL;
			}
			#endif
			
			up_time1(disp_data_time);
			
			#if defined(USE_TWO_FACE)
			up_time2(disp_data_time);
			#endif	
		}
		#if defined(USE_LIGHTING_MODE)
			lighting_cotrol();
		#endif
		
		#if defined(USE_LIGHTING_MODE2)
			lighting_cotrol2();
		#endif
		
		#if defined(USE_INFRARED_MODE)
		if(Ir_Code!=0xff) 
		{   flicker_count=0;
			ir_operation();// 红外处理      
			Ir_Code=0xff;
			up_led_display=1;
			flag_disp_true=1;
		}
		#endif
	}
}
