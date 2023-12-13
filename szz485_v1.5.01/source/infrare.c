

#include "include.h"
#if defined(USE_INFRARED_MODE)
uint8_t Ir_Code=0xff,Ir_wait=0;       //红外接收到的码值

extern TIME old_time;
extern DATE old_date;

extern uint8_t disp_data_time[4];	
extern uint8_t flicker_num,flicker_data_copy;

extern enum
{
	DISP_STATE_NORMAL=0,
	DISP_STATE_TIME
}disp_state;

extern BOOL flag_jiaoshi;
extern uint8_t jiaoshi_cnt;


/*********************************
*功能：红外接收
*
*********************************/
void infrare(void)
{    
	static unsigned char Leader,Ir_i,Ir_j;
	static unsigned char Ir_Buf[4];     
	if(Ir_wait>=40&&Ir_wait<=60)  
	{
		Leader=1; 
		Ir_i=0;
		Ir_j=0;
		Ir_Buf[0]=0;
		Ir_Buf[1]=0;
		Ir_Buf[2]=0;
		Ir_Buf[3]=0;         
	}
	if(Leader==1)
	{
		if(Ir_wait>=7&&Ir_wait<=11)
		{
			Ir_Buf[Ir_i]>>=1; 
			Ir_Buf[Ir_i]|=0x80;
			Ir_j++;
		}
		else if(Ir_wait>=3&&Ir_wait<=6)
		{
			Ir_Buf[Ir_i]>>=1;
			Ir_Buf[Ir_i]|=0x00;
			Ir_j++;
		}              	    
		if(Ir_j>=8) 
		{
			Ir_i++;
			Ir_j=0;
		}      
		if(Ir_i>=4)
		{
			Leader=0;
			Ir_i=0;
			Ir_j=0;
			if((Ir_Buf[0]==Address_L)&&(Ir_Buf[1]==Address_H))
			{                
				if(Ir_Buf[2]=~Ir_Buf[3])  
				{
					Ir_Code=Ir_Buf[2];    
				}	                             
			}
		}      
	}  
	Ir_wait=0;      	    
}

/*********************************
*功能：红外接收
*
*********************************/
void ir_operation(void)
{
	switch(disp_state)
 	{
 		case DISP_STATE_NORMAL:
 		{
	 		switch(Ir_Code)
	 		{
		 		case IR_FUNCTION1:
		 		{
			 		disp_state = DISP_STATE_TIME;
	 				disp_data_time[3] = old_time.hour / 10;
	 				disp_data_time[2] = old_time.hour % 10;
	 				disp_data_time[1] = old_time.min / 10;
	 				disp_data_time[0] = old_time.min % 10;
	 				flicker_num = 3;
	 				flicker_data_copy=disp_data_time[flicker_num];
			 		break;	
			 	}		
		 	}
 			break;
 		}
 		case DISP_STATE_TIME:
 		{
	 		switch(Ir_Code)
	 		{
		 		case IR_NUM1:
		 		{
	 				disp_data_time[flicker_num] = 1;
	 				flicker_data_copy=disp_data_time[flicker_num];
			 		break;	
			 	}
			 	case IR_NUM2:
		 		{
	 				disp_data_time[flicker_num] = 2;
	 				flicker_data_copy=disp_data_time[flicker_num];
			 		break;	
			 	}
			 	case IR_NUM3:
		 		{
	 				disp_data_time[flicker_num] = 3;
	 				flicker_data_copy=disp_data_time[flicker_num];
			 		break;	
			 	}
			 	case IR_NUM4:
		 		{
	 				disp_data_time[flicker_num] = 4;
	 				flicker_data_copy=disp_data_time[flicker_num];
			 		break;	
			 	}
			 	case IR_NUM5:
		 		{
	 				disp_data_time[flicker_num] = 5;
	 				flicker_data_copy=disp_data_time[flicker_num];
			 		break;	
			 	}
			 	case IR_NUM6:
		 		{
	 				disp_data_time[flicker_num] = 6;
	 				flicker_data_copy=disp_data_time[flicker_num];
			 		break;	
			 	}
			 	case IR_NUM7:
		 		{
	 				disp_data_time[flicker_num] = 7;
	 				flicker_data_copy=disp_data_time[flicker_num];
			 		break;	
			 	}
			 	case IR_NUM8:
		 		{
	 				disp_data_time[flicker_num] = 8;
	 				flicker_data_copy=disp_data_time[flicker_num];
			 		break;	
			 	}
			 	case IR_NUM9:
		 		{
	 				disp_data_time[flicker_num] = 9;
	 				flicker_data_copy=disp_data_time[flicker_num];
			 		break;	
			 	}
			 	case IR_NUM0:
		 		{
	 				disp_data_time[flicker_num] = 0;
	 				flicker_data_copy=disp_data_time[flicker_num];
			 		break;	
			 	}
			 	case IR_LEFT:
		 		{
					disp_data_time[flicker_num]=flicker_data_copy;
			 		if(flicker_num>=3)
			 		{
				 		flicker_num=0;
				 	}
				 	else
				 	{
						flicker_num++;	
					}
					flicker_data_copy=disp_data_time[flicker_num];
			 		break;	
			 	}
			 	case IR_RIGHT:
		 		{
			 		disp_data_time[flicker_num]=flicker_data_copy;
	 				if(flicker_num<=0)
			 		{
				 		flicker_num=3;
				 	}
				 	else
				 	{
						flicker_num--;	
					}
					flicker_data_copy=disp_data_time[flicker_num];
			 		break;	
			 	}
			 	case IR_CANCEL:
		 		{
	 				disp_state=DISP_STATE_NORMAL;
			 		break;	
			 	}
			 	case IR_CONFIRM:
		 		{
			 		disp_data_time[flicker_num]=flicker_data_copy;
	 				disp_data_time[3] = disp_data_time[3]*10 + disp_data_time[2];
					disp_data_time[1] = disp_data_time[1]*10 + disp_data_time[0];
					if((disp_data_time[3] <= 23) && (disp_data_time[1] <= 59))
					{
						old_time.hour = disp_data_time[3];
						old_time.min = disp_data_time[1];
						if(old_time.hour<8)
						{
							old_time.hour+=16;	
						}
						else
						{
							old_time.hour-=8;			
						}
								
						old_time.sec = 0;
						old_date.day=3;
						old_date.date=11;
						old_date.month=12;
						old_date.year=13;
						settime();
						old_time.hour = disp_data_time[3];
						old_time.min = disp_data_time[1];
					}
					flag_jiaoshi = TRUE;
					jiaoshi_cnt=0;
					
					
					disp_state=DISP_STATE_NORMAL;
			 		break;	
			 	}
			 			
		 	}
 			
 			break;
 		}
 		default:
 		{
 			disp_state = DISP_STATE_NORMAL;
 		}
 	}
}
void ir_init(void)
{
	IR_PIN_DIR=1;
	RBIE=1;
	RBIF=0;
	IR_IOCB=1;
	WPUB=0xFF;
	RBPU=0;
	T0CS=0;
	T0IE=1;
	T0IF=0;
	PS2=0;
	PS1=0;
	PS0=0;
		
}

#endif

	
 