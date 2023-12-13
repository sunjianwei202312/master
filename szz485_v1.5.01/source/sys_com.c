/**
  ******************************************************************************
  * @file sys_com.c
  * @brief This file 
  * @author 
  * @version V1.0
  * @date 
    ******************************************************************************

  */

/* Includes ------------------------------------------------------------------*/
#include"include.h"

/* Private typedef -----------------------------------------------------------*/

#if defined(USE_TEMP_HUMI_MODE)
/* Private define ------------------------------------------------------------*/
/* Private macro -------------------------------------------------------------*/
#define	NUMBER	100
/* Private variables ---------------------------------------------------------*/
	
	   
	   
u8 DHT11_State=1;//DHT11的状态
u8 temp_value=0;//温度
u8 humi_value=0;//湿度

u8 DHT11_Store[5]={0};//DHT11数据




//读取一个字节数据
u8 DHT11_ReadByte(void)
{
	u8 i,value=0,count=0;
	GIE=0;
	DHT11_State	= 1;
	for(i=8; i>0; i--)
	{
		value <<= 1;
		count=0;
		
		//等待每位数据前的低电平时间，大概50us
		
		while((DHT11_HUMR_VALUE==0)&&((count++)<NUMBER));
		if(count>=NUMBER)
		{
			DHT11_State	= 0;
			return 0;
		}
		//26~28us的高电平时间为“0”,70us高电平为”1“
		delay_10us();
		delay_10us();
		delay_10us();
//		delay_10us();
		//延时30us之后，检测数据线是否为高电平
		if(DHT11_HUMR_VALUE==1)
		{
			value++;
			//等待大约40us高电平结束
			count=0;
			while((DHT11_HUMR_VALUE==1)&&((count++)<NUMBER));
			if(count>=NUMBER)
			{
				DHT11_State	= 0;
				return 0;
			}
		}
	}
	GIE=1;
	return (value);
}


//DHT11的温湿度
u8 DH11_ReadTempAndHumi(void)
{
	u8 count=0,i;
	u8 check_value=0;
	
//	delay(20);
	//DHT11_HUMR_PIN	= 0;//输出
	DHT11_HUMR_VALUE	= 0;//拉低数据线大于18ms,发送开始信号
	delay(90);					//实际延时大约26ms
	DHT11_HUMR_VALUE	= 1;//释放数据，检测DHT11的应答信号
	DHT11_HUMR_PIN	= 1;//将数据线置为输入
	GIE=0;
	delay_10us();
	delay_10us();
	delay_10us();
	delay_10us();
	
	if(DHT11_HUMR_VALUE!=0)//DHT11没有响应
	{
		GIE=1;
		return 1;
	}
	else
	{
		//又响应
		while((DHT11_HUMR_VALUE==0)&&((count++)<NUMBER));
		if(count>=NUMBER)//超时
		{
			DHT11_HUMR_VALUE	= 1;
			GIE=1;
			DHT11_Store[0]=DHT11_HUMR_VALUE;
			return 2;
		}
		count	= 0;
		//DHT11_HUMR_VALUE	= 1;
		//应答信号后有一个80us的高电平
		while((DHT11_HUMR_VALUE==1)&&((count++)<NUMBER));
		if(count>=NUMBER)
		{
			DHT11_HUMR_VALUE	= 1;
			GIE=1;
			return 3;
		}
		
		//读取温湿度值
		for(i=0; i<5; i++)
		{
			DHT11_Store[i]	= DHT11_ReadByte();
			if(DHT11_State==0)//读取数据发送错误
			{
				DHT11_HUMR_VALUE	= 1;
				GIE=1;
				DHT11_State	= 1;
				return 4;
			}
			if(i!=4)
			{
				check_value	+= DHT11_Store[i];
			}
		}
		if(check_value==DHT11_Store[4])//校验和
		{
			temp_value	= DHT11_Store[2];//整数
			humi_value	= DHT11_Store[0];
			GIE=1;
			return 0;
		}
		else
		{
			//校验错误
			GIE=1;
			return 5;
		}		
	}
}




//延时函数
void delay_10us(void)
{
	Nop();
	Nop();
	Nop();
	Nop();
	Nop();
	Nop();
	Nop();
	Nop();
	Nop();
	Nop();
	Nop();
	Nop();
	Nop();
	Nop();
	Nop();
}

void delay(u8 n)
{
	u8 i,j;
	for(i=n;i>0;i--)
		for(j=160;j>0;j--);
}


#endif

