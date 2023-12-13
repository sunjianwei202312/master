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
	
	   
	   
u8 DHT11_State=1;//DHT11��״̬
u8 temp_value=0;//�¶�
u8 humi_value=0;//ʪ��

u8 DHT11_Store[5]={0};//DHT11����




//��ȡһ���ֽ�����
u8 DHT11_ReadByte(void)
{
	u8 i,value=0,count=0;
	GIE=0;
	DHT11_State	= 1;
	for(i=8; i>0; i--)
	{
		value <<= 1;
		count=0;
		
		//�ȴ�ÿλ����ǰ�ĵ͵�ƽʱ�䣬���50us
		
		while((DHT11_HUMR_VALUE==0)&&((count++)<NUMBER));
		if(count>=NUMBER)
		{
			DHT11_State	= 0;
			return 0;
		}
		//26~28us�ĸߵ�ƽʱ��Ϊ��0��,70us�ߵ�ƽΪ��1��
		delay_10us();
		delay_10us();
		delay_10us();
//		delay_10us();
		//��ʱ30us֮�󣬼���������Ƿ�Ϊ�ߵ�ƽ
		if(DHT11_HUMR_VALUE==1)
		{
			value++;
			//�ȴ���Լ40us�ߵ�ƽ����
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


//DHT11����ʪ��
u8 DH11_ReadTempAndHumi(void)
{
	u8 count=0,i;
	u8 check_value=0;
	
//	delay(20);
	//DHT11_HUMR_PIN	= 0;//���
	DHT11_HUMR_VALUE	= 0;//���������ߴ���18ms,���Ϳ�ʼ�ź�
	delay(90);					//ʵ����ʱ��Լ26ms
	DHT11_HUMR_VALUE	= 1;//�ͷ����ݣ����DHT11��Ӧ���ź�
	DHT11_HUMR_PIN	= 1;//����������Ϊ����
	GIE=0;
	delay_10us();
	delay_10us();
	delay_10us();
	delay_10us();
	
	if(DHT11_HUMR_VALUE!=0)//DHT11û����Ӧ
	{
		GIE=1;
		return 1;
	}
	else
	{
		//����Ӧ
		while((DHT11_HUMR_VALUE==0)&&((count++)<NUMBER));
		if(count>=NUMBER)//��ʱ
		{
			DHT11_HUMR_VALUE	= 1;
			GIE=1;
			DHT11_Store[0]=DHT11_HUMR_VALUE;
			return 2;
		}
		count	= 0;
		//DHT11_HUMR_VALUE	= 1;
		//Ӧ���źź���һ��80us�ĸߵ�ƽ
		while((DHT11_HUMR_VALUE==1)&&((count++)<NUMBER));
		if(count>=NUMBER)
		{
			DHT11_HUMR_VALUE	= 1;
			GIE=1;
			return 3;
		}
		
		//��ȡ��ʪ��ֵ
		for(i=0; i<5; i++)
		{
			DHT11_Store[i]	= DHT11_ReadByte();
			if(DHT11_State==0)//��ȡ���ݷ��ʹ���
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
		if(check_value==DHT11_Store[4])//У���
		{
			temp_value	= DHT11_Store[2];//����
			humi_value	= DHT11_Store[0];
			GIE=1;
			return 0;
		}
		else
		{
			//У�����
			GIE=1;
			return 5;
		}		
	}
}




//��ʱ����
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

