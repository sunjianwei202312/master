
#include "include.h"



extern BOOL flag_dian1;
#if defined(USE_TWO_FACE)
extern BOOL flag_dian2;
#endif
extern DATE old_date;
extern TIME old_time;
extern NTP_INFO ntp_info;







#if defined(ONE_USE_SMALL)
const uint8_t SEG_CODE1[12] = {0xf5,0xC0,0xB9,0xE9,0xCC,0x6D,0x7D,0xC1,0xFD,0xED,0x00,0x08};
							/******0******1****2*****3*****4*****5*****6*****7*****8*****9*******************/
#elif defined(ONE_USE_BIG)
const uint8_t SEG_CODE1[11] = {0xfc,0x60,0xda,0xf2,0x66,0xb6,0xbe,0xe0,0xfe,0xf6,0x00};

#elif defined(ONE_USE_YT_BIG)
const uint8_t SEG_CODE1[11] = {0x7e,0x18,0x6D,0x3D,0x1B,0x37,0x77,0x1C,0x7F,0x3F,0x00};
							/******0******1****2*****3*****4*****5*****6*****7*****8*****9*******************/
#else
const uint8_t SEG_CODE1[11] = {0xfc,0x60,0xda,0xf2,0x66,0xb6,0xbe,0xe0,0xfe,0xf6,0x00};
							/******0******1****2*****3*****4*****5*****6*****7*****8*****9*******************/

#endif

#if defined(TWO_USE_SMALL)							
const uint8_t SEG_CODE2[12] = {0xf5,0xC0,0xB9,0xE9,0xCC,0x6D,0x7D,0xC1,0xFD,0xED,0x00,0x08};
							/******0******1****2*****3*****4*****5*****6*****7*****8*****9*******************/
#elif defined(TWO_USE_BIG)
const uint8_t SEG_CODE2[11] = {0xfc,0x60,0xda,0xf2,0x66,0xb6,0xbe,0xe0,0xfe,0xf6,0x00};
							/******0******1****2*****3*****4*****5*****6*****7*****8*****9*******************/
#else
const uint8_t SEG_CODE2[11] = {0xfc,0x60,0xda,0xf2,0x66,0xb6,0xbe,0xe0,0xfe,0xf6,0x00};
							/******0******1****2*****3*****4*****5*****6*****7*****8*****9*******************/

#endif


#if defined(ONE_USE_SMALL)							
const uint8_t ONE_DP = 0x02;
#elif defined(ONE_USE_BIG)
const uint8_t ONE_DP = 0x01;
#elif defined(ONE_USE_YT_BIG)
const uint8_t ONE_DP = 0x80;
#else
const uint8_t ONE_DP = 0x01;
#endif

#if defined(TWO_USE_SMALL)							
const uint8_t TWO_DP = 0x02;
#elif defined(TWO_USE_BIG)
const uint8_t TWO_DP = 0x01;
#else
const uint8_t TWO_DP = 0x01;
#endif


extern uint8_t disp_data_time[4];


void shift_srclk(uint8_t flag) 
{
	if(flag==1)
	{
		LCD_SRCLK1 = 0;	
	}	
    else
    {
	    LCD_SRCLK2 = 0;	
	}
    delay_1us;

    if(flag==1)
	{
		LCD_SRCLK1 = 1;	
	}	
    else
    {
	    LCD_SRCLK2 = 1;	
	}
    delay_1us;
    if(flag==1)
	{
		LCD_SRCLK1 = 0;	
	}	
    else
    {
	    LCD_SRCLK2 = 0;	
	}
}


void latch_rclk(uint8_t flag) 
{
	if(flag==1)
	{
		LCD_RCLK1 = 0;	
	}
	else
	{
		LCD_RCLK2 = 0;
	}		
    
    delay_1us;

    if(flag==1)
	{
		LCD_RCLK1 = 1;	
	}
	else
	{
		LCD_RCLK2 = 1;
	}
    delay_1us;
    if(flag==1)
	{
		LCD_RCLK1 = 0;	
	}
	else
	{
		LCD_RCLK2 = 0;
	}
}

void seg_disp(uint8_t num, uint8_t dp,uint8_t flag) 
{
    uint8_t i;
    uint8_t date;
	if(flag==1)
	{
		date = SEG_CODE1[num];	
	}
	else
	{	
		date = SEG_CODE2[num];  
	}
	if(dp)
	{
		if(flag==1)
		{
			date |= ONE_DP;  
		}
		else
		{
			date |= TWO_DP; 
		}	
	}
    for(i=0; i<8; i++) 
	 {	
        if( date&(1<<i) ) 
        {   
	        if(flag==1)
	        {
            	LCD_SER1 = 1;
		    }
		    else
		    {
				LCD_SER2 = 1;    
			}     
        }         
        else     
        {  
            if(flag==1)
	        {
            	LCD_SER1 = 0;
		    }
		    else
		    {
				LCD_SER2 = 0;    
			}
        }       
		delay_1us;
		if(flag==1)
		{
 			shift_srclk(1);	
 		}
 		else
 		{
	 		shift_srclk(2);		
	 	}				
    }
	
}

void lcd_init(void) 
{	
	LCD_SER_DIR1 = 0;
	LCD_SRCLK_DIR1 = 0;
	LCD_RCLK_DIR1 = 0;
	LCD_EN_DIR1 = 0;
	LCD_EN1 = 1;
	LCD_SER_DIR2 = 0;
	LCD_SRCLK_DIR2 = 0;
	LCD_RCLK_DIR2 = 0;
	LCD_EN_DIR2 = 0;
	LCD_EN2 = 1;
	ntp_info.test_mode1 = 0;
	ntp_info.test_mode2 = 0;
	disp_data_time[0]=(old_time.min%100)%10;
	disp_data_time[1]=(old_time.min%100)/10;
	disp_data_time[2]=(old_time.hour%100)%10;
	disp_data_time[3]=(old_time.hour%100)/10;
	up_time1(disp_data_time);
			
	#if defined(USE_TWO_FACE)		
	up_time2(disp_data_time);
	#endif
	LCD_EN1 = 0;
	LCD_EN2 = 0;


}

void up_time1(uint8_t udata_time[])
{
	uint8_t date[DISPLAY_DIGITAL_LENGTH1],i;
	static uint8_t copy_flag_dian=0,count=0;
	static uint8_t fork;
	
	
	static enum
	{
		display_normal=0,
		#if defined(USE_DJS_MODE1)
		DJS_MODE,
		#endif
		START_TEST00
		#if defined(USE_DIGITAL_MODE1)
		,
		display_stop,
		display_close,
		
		display_open,
		display_reset
		#endif
		
	}display_mode_state=display_normal;	
	#if defined(USE_DIGITAL_MODE1)
		static uint8_t copy_display_mode_state;
	#endif
	copy_flag_dian ^=1;
	
	copy_display_mode_state=display_mode_state;
	switch(ntp_info.test_mode1)
	{
		case DIGITAL_TEST:
		{
			display_mode_state=START_TEST00;
			break;	
		}
		#if defined(USE_DIGITAL_MODE1)
		case DIGITAL_NORMAL:
		case DIGITAL_JIAOSHI:
		case DIGITAL_CHASE_TIME:
		case DIGITAL_DUISHI:
		{
			display_mode_state=display_normal;
			break;	
		}
		case DIGITAL_STOP:
		{
			display_mode_state=display_stop;
			break;	
		}
		case DIGITAL_CLOSE:
		{
			display_mode_state=display_close;
			break;	
		}
		case DIGITAL_OPEN:
		{
			display_mode_state=display_open;
			break;	
		}
		case DIGITAL_RESET:
		{
			display_mode_state=display_reset;
			break;	
		}
			
		#endif
			
		
	}

	#if defined(USE_DJS_MODE1)
	if(ntp_info.djs_on_off1)
	{
		if(Compare(old_time,ntp_info.djs_start_time1)==EQUAL)
		{
			ntp_info.djs_on_off1=0;
			display_mode_state=DJS_MODE;	
		}					
	}
	else
	{
		ntp_info.test_mode1=0xff;	
	}		
	#endif
	
	if(old_time.sec<=59 && old_time.min<=59 && old_time.hour<=23)
	{
		#if defined(ONE_USE_1S_2S_3S_4S_5S_6S_7S_8S_HMS)
		switch(display_mode_state)
		{
			case display_normal:
			{
				i=0;
				date[i++]=udata_time[0];
				date[i++]=udata_time[1];
				if(flag_dian1 == TRUE)
				{
					date[i++]=11;
				}
				else
				{
					date[i++]=10;
				}
				date[i++] = udata_time[2];
				date[i++] = udata_time[3];
				if(flag_dian1 == TRUE)
				{
					date[i++]=11;
				}
				else
				{
					date[i++]=10;
				}
				
				date[i++] = udata_time[4];
				if(udata_time[5] == 0)
				{
					date[i++]=10;	
				}
				else
				{
					date[i++]=udata_time[5];
				}
				up_date(date,i,0,1);
				break;
			}
			#if defined(USE_DJS_MODE1)
			case DJS_MODE:
			{
				
				i=0;
				date[i++]=ntp_info.djs_con_time1.sec%10;
				date[i++]=ntp_info.djs_con_time1.sec/10;
				
				date[i++]=11;
				
				date[i++] = ntp_info.djs_con_time1.min%10;
				date[i++] = ntp_info.djs_con_time1.min/10;
				
				date[i++]=11;
				
				
				date[i++] = ntp_info.djs_con_time1.hour %10;
				if((ntp_info.djs_con_time1.hour/10) == 0)
				{
					date[i++]=10;	
				}
				else
				{
					date[i++]=ntp_info.djs_con_time1.hour/10;
				}
				up_date(date,i,0,1);
				if(time_dec(&ntp_info.djs_con_time1))
				{
					display_mode_state=display_normal;
					break;	
				}	
				break;
			}
			#endif
			#if defined(USE_TEST_LED)	
			case START_TEST00:
			{
				for(i=0;i<DISPLAY_DIGITAL_LENGTH1;i++)
				{
					date[i]=count;	
				}
				if(count>=9)
				{
					count=0;
					display_mode_state=display_normal;	
				}
				else
				{
					count++;	
				}
				up_date(date,i,copy_flag_dian,1);
				
				break;
			}
			#endif
			default:display_mode_state=display_normal;
			
		}
		#elif defined(ONE_USE_1G_2G_3G_4G_HM)
		switch(display_mode_state)
		{
			case display_normal:
			{
				//*/
				i=0;
				date[i++] = udata_time[0];
					
				date[i++] = udata_time[1];
				date[i++] = udata_time[2];
				if(udata_time[3]==0)
				{
					date[i++] = 10;	
				}
				else
				{	
					date[i++] = udata_time[3];
				}
				
				
				
				
				//*/
				/*/
				i=0;
				date[i++] = temp_value%10;
				date[i++] = temp_value/10;
				date[i++] = humi_value%10;
				date[i++] = humi_value/10;
				//*/
				up_date(date,i,flag_dian1,1);
				break;
			}
			#if defined(USE_DJS_MODE1)
			case DJS_MODE:
			{
				
				i=0;
				date[i++] = ntp_info.djs_con_time1.min%10;
				date[i++] = ntp_info.djs_con_time1.min/10;
				
				date[i++] = ntp_info.djs_con_time1.hour %10;
				date[i++]=ntp_info.djs_con_time1.hour/10;
				
				up_date(date,i,copy_flag_dian,1);
				if(time_dec(&ntp_info.djs_con_time1))
				{
					display_mode_state=display_normal;
					break;	
				}	
				break;
			}
			#endif
			case START_TEST00:
			{
				for(i=0;i<DISPLAY_DIGITAL_LENGTH1;i++)
				{
					date[i]=count;	
				}
				if(count>=9)
				{
					count=0;
					display_mode_state=display_normal;
						
				}
				else
				{
					count++;	
				}
				up_date(date,i,copy_flag_dian,1);
				
				break;
			}
			#if defined(USE_DIGITAL_MODE1)
			case display_stop:
			{
				break;	
			}
			case display_close:
			{
				CCP1CON =0;
				LCD_EN1=1;
				break;	
			}
			case display_open:
			{
				CCP1CON |= 0b00001100;
				LCD_EN1=0;
				if(copy_display_mode_state==display_close)
				{
					
					
					display_mode_state=display_normal;
				}
				else
				{
					display_mode_state=copy_display_mode_state;	
				}	
				break;	
			}
			case display_reset:
			{
				Reset();
				break;	
			}	
			#endif
			default:display_mode_state=display_normal;
			
		}
		#elif defined(ONE_USE_1G_2G_3G_4G_5G_6G_HMS)
		switch(display_mode_state)
		{
			case display_normal:
			{
				i=0;
				/*fork++;
				switch(fork)
				{
					case 1:
						date[i++] =8;
						date[i++] =8;
						date[i++] =8;
						date[i++] =8;
						date[i++] =8;
						date[i++] =8;
										
					break;
					case 2:
					    date[i++] =0x0a;
						date[i++] =0x0a;
						date[i++] =0x0a;
						date[i++] =0x0a;
						date[i++] =0x0a;
						date[i++] =0x0a;
						fork=0;
					
					break;
					
				}
				*/	
				
				
				
				date[i++] = old_time.sec%10;
				date[i++] = old_time.sec/10;
				
				
				date[i++] = old_time.min%10;
				date[i++] = old_time.min/10;
				date[i++] = old_time.hour %10;
				date[i++]=old_time.hour/10;
              	/*if(old_time.hour/10==0)
				{
					date[i++] = 10;	
				}
				else
				{	
					date[i++] = old_time.hour/10;
				}
				*/
				up_date(date,i,flag_dian1,1);
				break;
			}
			#if defined(USE_DJS_MODE1)
			case DJS_MODE:
			{
				
				i=0;
				date[i++] = ntp_info.djs_con_time1.sec%10;
				date[i++] = ntp_info.djs_con_time1.sec/10;
				date[i++] = ntp_info.djs_con_time1.min%10;
				date[i++] = ntp_info.djs_con_time1.min/10;
				
				date[i++] = ntp_info.djs_con_time1.hour %10;
				date[i++]=ntp_info.djs_con_time1.hour/10;
				
				up_date(date,i,1,1);
				if(time_dec(&ntp_info.djs_con_time1))
				{
					display_mode_state=display_normal;
					break;	
				}	
				break;
			}
			#endif
			case START_TEST00:
			{
				for(i=0;i<DISPLAY_DIGITAL_LENGTH1;i++)
				{
					date[i]=count;	
				}
				if(count>=9)
				{
					count=0;
					display_mode_state=display_normal;	
				}
				else
				{
					count++;	
				}
				up_date(date,i,copy_flag_dian,1);
				
				break;
			}
			default:display_mode_state=display_normal;
		}
		#elif defined(ONE_USE_YT_1G_2G_3G_4G_HM)
		switch(display_mode_state)
		{
			case display_normal:
			{
				i=0;
				date[i++] = old_time.min%10;
				date[i++] = old_time.min/10;
				date[i++] = old_time.hour %10;
				date[i++]=old_time.hour/10;
				up_date(date,i,flag_dian1,1);
				break;
			}
			#if defined(USE_DJS_MODE1)
			case DJS_MODE:
			{
				
				i=0;
				date[i++] = ntp_info.djs_con_time1.min%10;
				date[i++] = ntp_info.djs_con_time1.min/10;
				
				date[i++] = ntp_info.djs_con_time1.hour %10;
				date[i++]=ntp_info.djs_con_time1.hour/10;
				
				up_date(date,i,copy_flag_dian,1);
				if(time_dec(&ntp_info.djs_con_time1))
				{
					display_mode_state=display_normal;
					break;	
				}	
				break;
			}
			#endif
			case START_TEST00:
			{
				for(i=0;i<DISPLAY_DIGITAL_LENGTH1;i++)
				{
					date[i]=count;	
				}
				if(count>=9)
				{
					count=0;
					display_mode_state=display_normal;	
				}
				else
				{
					count++;	
				}
				up_date(date,i,copy_flag_dian,1);
				
				break;
			}
			default:display_mode_state=display_normal;
			
		}
		#endif
	}
	else
	{
		old_date.year = 1;
		old_date.month = 1;
		old_date.date = 1;
		old_date.day = 0;
		old_time.hour = 0;
		old_time.min = 0;
		old_time.sec = 0;
		settime();
	}



	for(i=0;i<DISPLAY_DIGITAL_LENGTH1;i++)
	{
		seg_disp(10,0,1);	
	}
}
 



void up_date(uint8_t date[],uint8_t length,uint8_t dian,uint8_t flag)
{
	uint8_t i;
	for(i=0;i<length;i++)
	{
		seg_disp(date[i],dian,flag);		
	}	
	
	
	
	latch_rclk(flag); 	
}
#if defined(USE_TWO_FACE)

void up_time2(uint8_t udata_time[])
{
	uint8_t date[DISPLAY_DIGITAL_LENGTH2],i;
	static uint8_t copy_flag_dian=0,count;
	static enum
	{
		display_normal=0,
		#if defined(USE_DJS_MODE2)
		DJS_MODE,
		#endif
		START_TEST00
		#if defined(USE_DIGITAL_MODE2)
		,
		display_stop,
		display_close,
		
		display_open,
		display_reset
		#endif
		
	}display_mode_state=display_normal;	
	#if defined(USE_DIGITAL_MODE2)
		static uint8_t copy_display_mode_state;
	#endif
	copy_flag_dian ^=1;
	
	copy_display_mode_state=display_mode_state;

	switch(ntp_info.test_mode2)
	{
		case DIGITAL_TEST:
		{
			count=0;
			display_mode_state=START_TEST00;
			break;	
		}
		#if defined(USE_DIGITAL_MODE2)
		case DIGITAL_NORMAL:
		case DIGITAL_JIAOSHI:
		case DIGITAL_CHASE_TIME:
		case DIGITAL_DUISHI:
		{
			display_mode_state=display_normal;
			break;	
		}
		case DIGITAL_STOP:
		{
			display_mode_state=display_stop;
			break;	
		}
		case DIGITAL_CLOSE:
		{
			display_mode_state=display_close;
			break;	
		}
		case DIGITAL_OPEN:
		{
			display_mode_state=display_open;
			break;	
		}
		case DIGITAL_RESET:
		{
			display_mode_state=display_reset;
			break;	
		}
			
		#endif
			
		
	}

	#if defined(USE_DJS_MODE2)
	if(ntp_info.djs_on_off2)
	{
		if(Compare(old_time,ntp_info.djs_start_time2)==EQUAL)
		{
			ntp_info.djs_on_off2=0;
			display_mode_state=DJS_MODE;	
		}					
	}
	else
	{
		ntp_info.test_mode1=0xff;	
	}		
	#endif
	
	
	
	if(old_time.sec<=59 && old_time.min<=59 && old_time.hour<=23)
	{
		#if defined(TWO_USE_1S_2S_3S_4S_5S_6S_7S_8S_HMS)
		switch(display_mode_state)
		{
			case display_normal:
			{
				i=0;
				date[i++]=old_time.sec%10;
				date[i++]=old_time.sec/10;
				if(flag_dian2 == TRUE)
				{
					date[i++]=11;
				}
				else
				{
					date[i++]=10;
				}
				date[i++] = old_time.min%10;
				date[i++] = old_time.min/10;
				if(flag_dian2 == TRUE)
				{
					date[i++]=11;
				}
				else
				{
					date[i++]=10;
				}
				
				date[i++] = old_time.hour %10;
				if((old_time.hour/10) == 0)
				{
					date[i++]=10;	
				}
				else
				{
					date[i++]=old_time.hour/10;
				}
				up_date(date,i,0,2);
				break;
			}
			#if defined(USE_DJS_MODE2)
			case DJS_MODE:
			{
				
				i=0;
				date[i++]=ntp_info.djs_con_time2.sec%10;
				date[i++]=ntp_info.djs_con_time2.sec/10;
				
				date[i++]=11;
				
				date[i++] = ntp_info.djs_con_time2.min%10;
				date[i++] = ntp_info.djs_con_time2.min/10;
				
				date[i++]=11;
				
				
				date[i++] = ntp_info.djs_con_time2.hour %10;
				if((ntp_info.djs_con_time2.hour/10) == 0)
				{
					date[i++]=10;	
				}
				else
				{
					date[i++]=ntp_info.djs_con_time2.hour/10;
				}
				up_date(date,i,0,2);
				if(time_dec(&ntp_info.djs_con_time2))
				{
					display_mode_state=display_normal;
					break;	
				}	
				break;
			}
			#endif
			#if defined(USE_TEST_LED)	
			case START_TEST00:
			{
				for(i=0;i<DISPLAY_DIGITAL_LENGTH2;i++)
				{
					date[i]=count;	
				}
				if(count>=9)
				{
					count=0;
					display_mode_state=display_normal;	
				}
				else
				{
					count++;	
				}
				up_date(date,i,copy_flag_dian,2);
				
				break;
			}
			#endif
			default:display_mode_state=display_normal;
			
		}
		#elif defined(TWO_USE_1G_2G_3G_4G_HM)
		switch(display_mode_state)
		{
			case display_normal:
			{
				i=0;
				date[i++] = udata_time[0];
				date[i++] = udata_time[1];
				date[i++] = udata_time[2];
			    if(udata_time[3]==0)
				{
					date[i++] = 10;	
				}
				else
				{	
					date[i++] = udata_time[3];
				}
				up_date(date,i,flag_dian2,2);
				
				break;
			}
			#if defined(USE_DJS_MODE2)
			case DJS_MODE:
			{
				
				i=0;
				
				date[i++] = ntp_info.djs_con_time2.min%10;
				date[i++] = ntp_info.djs_con_time2.min/10;
				
				date[i++] = ntp_info.djs_con_time2.hour %10;
				date[i++]=ntp_info.djs_con_time2.hour/10;

				up_date(date,i,copy_flag_dian,2);
				if(time_dec(&ntp_info.djs_con_time2))
				{
					display_mode_state=display_normal;
					break;	
				}	
				break;
			}
			#endif
			case START_TEST00:
			{
				for(i=0;i<DISPLAY_DIGITAL_LENGTH2;i++)
				{
					date[i]=count;	
				}
				if(count>=9)
				{
					count=0;
					display_mode_state=display_normal;	
				}
				else
				{
					count++;	
				}
				up_date(date,i,copy_flag_dian,2);
				
				break;
			}
			#if defined(USE_DIGITAL_MODE2)
			case display_stop:
			{
				break;	
			}
			case display_close:
			{
				CCP1CON =0;
				LCD_EN2=1;
				break;	
			}
			case display_open:
			{
				CCP2CON |= 0b00001100;
				LCD_EN2=0;
				if(copy_display_mode_state==display_close)
				{
					
					
					display_mode_state=display_normal;
				}
				else
				{
					display_mode_state=copy_display_mode_state;	
				}	
				break;	
			}
			case display_reset:
			{
				Reset();
				break;	
			}	
			#endif
			default:display_mode_state=display_normal;
			
		}
		#elif defined(TWO_USE_1G_2G_3G_4G_5G_6G_HMS)
		switch(display_mode_state)
		{
			case display_normal:
			{
				i=0;
				date[i++] = old_time.sec%10;
				date[i++] = old_time.sec/10;
				date[i++] = old_time.min%10;
				date[i++] = old_time.min/10;
				date[i++] = old_time.hour %10;
				date[i++]=old_time.hour/10;
                /*if(old_time.hour/10==0)
				{
					date[i++] = 10;	
				}
				else
				{	
					date[i++] = old_time.hour/10;
				}
				*/
				up_date(date,i,flag_dian2,2);
				break;
			}
			#if defined(USE_DJS_MODE2)
			case DJS_MODE:
			{
				
				i=0;
				date[i++] = ntp_info.djs_con_time2.sec%10;
				date[i++] = ntp_info.djs_con_time2.sec/10;
				date[i++] = ntp_info.djs_con_time2.min%10;
				date[i++] = ntp_info.djs_con_time2.min/10;
				
				date[i++] = ntp_info.djs_con_time2.hour %10;
				date[i++]=ntp_info.djs_con_time2.hour/10;
				
				up_date(date,i,1,2);
				if(time_dec(&ntp_info.djs_con_time2))
				{
					display_mode_state=display_normal;
					break;	
				}	
				break;
			}
			#endif
			case START_TEST00:
			{
				for(i=0;i<DISPLAY_DIGITAL_LENGTH2;i++)
				{
					date[i]=count;	
				}
				if(count>=9)
				{
					count=0;
					display_mode_state=display_normal;	
				}
				else
				{
					count++;	
				}
				up_date(date,i,copy_flag_dian,2);
				
				break;
			}
			default:display_mode_state=display_normal;
			
		}
	  #elif defined(TWO_USE_YMD_DAY)
       switch(display_mode_state)
		{
			case display_normal:
			{
				if(old_time.sec!=0){//秒!=0的时候进行正常显示！！
			
					i=0; 		    	
					if(old_date.day==0)
						old_date.day=8;	
					
	                date[i++] = old_date.day;       
					date[i++] = old_date.date%10;
					date[i++] = old_date.date/10;
					date[i++] = old_date.month%10;
					date[i++] = old_date.month/10;
					date[i++] = old_date.year %10;
					date[i++] = old_date.year/10;
	                date[i++] =0;
	                date[i++] =2;
					up_date(date,i,0,2);
				}	
				break;
			}		
			case START_TEST00:
			{
				for(i=0;i<DISPLAY_DIGITAL_LENGTH2;i++)
				{
					date[i]=count;	
				}
				if(count>=9)
				{
					count=0;
					display_mode_state=display_normal;	
				}
				else
				{
					count++;	
				}
				up_date(date,i,copy_flag_dian,2);
				
				break;
			}
			default:display_mode_state=display_normal;			
		}
      #elif defined(TWO_USE_S_YMD_DAY)
        switch(display_mode_state)
		{
			case display_normal:
			{
				i=0;  
                date[i++] = old_date.day;      
				date[i++] = old_date.date%10;
				date[i++] = old_date.date/10;
				date[i++] = old_date.month%10;
				date[i++] = old_date.month/10;
				date[i++] = old_date.year %10;
				date[i++] = old_date.year/10;              
				up_date(date,i,0,2);
				break;
			}		
			case START_TEST00:
			{
				for(i=0;i<DISPLAY_DIGITAL_LENGTH2;i++)
				{
					date[i]=count;	
				}
				if(count>=9)
				{
					count=0;
					display_mode_state=display_normal;	
				}
				else
				{
					count++;	
				}
				up_date(date,i,copy_flag_dian,2);
				
				break;
			}
			default:display_mode_state=display_normal;
           }         
	  #elif defined(TWO_USE_MD_DAY)
        switch(display_mode_state)
		{
			case display_normal:
			{
				i=0;  
                date[i++] = old_date.day;      
				date[i++] = old_date.date%10;
				date[i++] = old_date.date/10;
				date[i++] = old_date.month%10;
				date[i++] = old_date.month/10;			
				up_date(date,i,0,2);
				break;
			}		
			case START_TEST00:
			{
				for(i=0;i<DISPLAY_DIGITAL_LENGTH2;i++)
				{
					date[i]=count;	
				}
				if(count>=9)
				{
					count=0;
					display_mode_state=display_normal;	
				}
				else
				{
					count++;	
				}
				up_date(date,i,copy_flag_dian,2);
				
				break;
			}
			default:display_mode_state=display_normal; 
           }         
      #elif defined(TWO_USE_DAY)
        switch(display_mode_state)
		{
			case display_normal:
			{
				i=0; 
                date[i++] = old_date.day;		
				up_date(date,i,0,2);
				break;
			}		
			case START_TEST00:
			{
				for(i=0;i<DISPLAY_DIGITAL_LENGTH2;i++)
				{
					date[i]=count;	
				}
				if(count>=9)
				{
					count=0;
					display_mode_state=display_normal;	
				}
				else
				{
					count++;	
				}
				up_date(date,i,copy_flag_dian,2);
				
				break;
			}
			default:display_mode_state=display_normal;
           }          
#endif
	}
   else
	{
		old_date.year = 1;
		old_date.month = 1;
		old_date.date = 1;
		old_date.day = 0;
		old_time.hour = 0;
		old_time.min = 0;
		old_time.sec = 0;
		settime();
	}

  for(i=0;i<DISPLAY_DIGITAL_LENGTH2;i++)
	{
		seg_disp(10,0,2);	
	}
}

#endif



uint8_t Compare(TIME first,TIME second)
{
	if((first.hour==second.hour) && \
	   (first.min==second.min) && \
	   (first.sec==second.sec))
	{
		return EQUAL;
	}
	else if((first.hour>second.hour) || \
		   ((first.hour==second.hour) && \
	        (first.min>second.min)) || \
	       ((first.hour==second.hour) && \
	        (first.min==second.min) &&
	        (first.sec>second.sec)))
	{
		return GREATER;
	}
	else
	{
		return LESS;	
	}  
}


