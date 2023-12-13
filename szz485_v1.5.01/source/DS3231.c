#include "include.h"
#include "week.h"

extern TIME old_time;
extern DATE old_date;

extern NTP_INFO ntp_info;
#if defined(USE_YEAR_MONTH_DATA)
extern uint8_t up_date_flag;
#endif



void ds3231_init(void)
{
	#if defined(USE_ZONE_SAVE)
		uint8_t eeprom_data[3],i;
	#endif
	uint8_t ds3231_state;
	SCL_DIR = 0;
	

	#if defined(USE_ZONE_SAVE)
		
	
	eeprom_data[0] = read_eeprom(AA02E48_TIME_ZONE);	//读取秒
	i=0;
	if(eeprom_data[i] == 0xff)
	{
		ntp_info.time_zone = DEFAULT_TIME_ZONE;	
	}
	else
	{
		ntp_info.time_zone =eeprom_data[0];
	}
	#else
	ntp_info.time_zone = DEFAULT_TIME_ZONE;
	#endif
	
	
	ds3231_state = readbyte(DS3231_CONTROL);
	writebyte(DS3231_CONTROL,ds3231_state & 0x7f);
	 
}

void get_time(void)
{
	
	uint8_t ds3231_state,ds3231_time[7],ds3231_time2[7],ds3231_time3[7],i;
	ds3231_state = readbyte(DS3231_STATUS);
  	if(ds3231_state & 0x80)
  	{
	  	ds3231_state = ds3231_state & 0x7f;//若发送了停振，则清除此标志
	  	writebyte(DS3231_STATUS,ds3231_state);
	}

  	for(i=0;i<7;i++)
	{
		ds3231_time[i] = readbyte(DS3231_SECOND+i);
		ds3231_time2[i] = readbyte(DS3231_SECOND+i);
		ds3231_time3[i] = readbyte(DS3231_SECOND+i);
		
		ds3231_time[i] = hex_dec(ds3231_time[i]);		//转化为十进制
		ds3231_time2[i] = hex_dec(ds3231_time2[i]);		//转化为十进制
		ds3231_time3[i] = hex_dec(ds3231_time3[i]);		//转化为十进制
				
	}		
	for(i=0;i<7;i++)
	{
		if((ds3231_time[i] !=ds3231_time2[i]) || (ds3231_time[i] !=ds3231_time3[i]))
		{
			Reset();	
		}	
	}
		
	TMR1H=0x00;          //Clear timer3-related registers
  	TMR1L=0x00;
	old_time.sec	= ds3231_time[0] ;
	old_time.min 	= ds3231_time[1] ;
	old_time.hour 	= ds3231_time[2] ; 
	//old_date.day	= ds3231_time[3];
       
	old_date.date	= ds3231_time[4];
	old_date.month	= ds3231_time[5];
	old_date.year	= ds3231_time[6];

    old_date.day	= WeekDay20(ds3231_time[6],ds3231_time[5],ds3231_time[4]);

	if(old_time.sec<=59 && old_time.min<=59 && \
	   old_time.hour<=23 && old_date.date<=31 && \
	   old_date.month<=12 && old_date.year<=99)
	{	
		calc_zone();
	}	
}
void settime(void)
{

	uint8_t write_time[7],i;
	
	/*
	//below is added by sjw for EEPEOM  RL
    if((old_time.hour>=0)&&(old_time.hour<8))
	{
		#if defined(USE_YEAR_MONTH_DATA)
		up_date_flag=FLAG_DATE_DEC;
		#endif
	}
	*/
	//if((old_time.hour!=0)&&(old_time.min!=0)){
	//if(old_time.min!=0){
		
		write_time[0] = dec_hex(old_time.sec);
		write_time[1] = dec_hex(old_time.min);
		write_time[2] = dec_hex(old_time.hour);	
	    write_time[3] = dec_hex(old_date.day);
	    
	    
	    
		write_time[4] = dec_hex(old_date.date);
		write_time[5] = dec_hex(old_date.month);
		write_time[6] = dec_hex(old_date.year); 
	
		for(i=0;i<7;i++)
		{
			writebyte(DS3231_SECOND+i,write_time[i]);		
		}	
		/*
		writebyte(DS3231_MINUTE,write_time[1]);
		writebyte(DS3231_HOUR,write_time[2]);
		writebyte(DS3231_DAY,write_time[3]);
		writebyte(DS3231_DATE,write_time[4]);
		writebyte(DS3231_MONTH,write_time[5]);
		writebyte(DS3231_YEAR,write_time[6]);	
		//*/
	//}	

}
uint8_t hex_dec(uint8_t hex16)
{
	return ((hex16/16)*10+(hex16%16));
}

uint8_t dec_hex(uint8_t dec16)
{
	return((dec16/10)*16+(dec16%10));
}


void calc_zone(void)
{
	//if(old_time.min!=0){
		
	#if defined(USE_ZONE_SAVE)
	uint8_t i,j;
	i=ntp_info.time_zone&ZZSQ_E;
	j=ntp_info.time_zone&0x0f;
	if(i)
	{
		if(j<=12)
		{
			old_time.hour += j;
			if(old_time.hour>=24)
			{
				old_time.hour-=24;
				#if defined(USE_YEAR_MONTH_DATA)
				up_date_flag=FLAG_DATE_ADD;
				#endif
			}	
		}		
	}
	else
	{
		if(j<=12)
		{
			if(old_time.hour>=j)
			{
				old_time.hour -= j;	
			}	
			else
			{
				#if defined(USE_YEAR_MONTH_DATA)
				up_date_flag=FLAG_DATE_DEC;
				#endif
				old_time.hour+=24;
				old_time.hour -= j;	
			}	
		}		
	}	
	#else
	old_time.hour += 8;
	if(old_time.hour>=24)
	{
		old_time.hour-=24;		
		#if defined(USE_YEAR_MONTH_DATA)
		up_date_flag=FLAG_DATE_ADD;
		#endif

	}
	#endif
	//}
}	




void con_write_eeprom(uint8_t start,uint8_t databyte[],uint8_t len)
{
	uint8_t i;
	for(i=0;i<len;i++)
	{
		write_eeprom(start+i,databyte[i]);	
	}	
}	