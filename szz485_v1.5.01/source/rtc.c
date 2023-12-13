
#include "include.h"

#define IC_ADDRESS 0xD0 //器件的总线地址

#define I2CTIME    5    //时钟周期




void start_i2c(void)
{ 
	SDA=1;
	SCL=1; 
	i2c_delay(I2CTIME);
	SDA=0;  
	i2c_delay(I2CTIME);
	SCL=0;  
}


  
void waitack_i2c(void)
{ 
  	uint8_t errtime=200;
  	SCL = 0;  
  	SDA = 1;  
  	SDA_DIR = 1;
  	i2c_delay(I2CTIME);
  	SCL = 1;
  	i2c_delay(I2CTIME);  
	while(SDA)
	{
		errtime--;
    		if(errtime == 0)
    		{
	    		stop_i2c(I2CTIME);
	      		return;
    		}
	}

	SDA_DIR = 0;  
  	SCL = 0;
} 


void sendack_i2c(void)
{ 
	SDA =0 ;
	i2c_delay(I2CTIME);
	SCL = 1;
	i2c_delay(I2CTIME);
	SCL = 0;
}


void sendnotack_i2c(void)
{   
	SDA =1 ;  
	i2c_delay(I2CTIME);
	SCL = 1;
	i2c_delay(I2CTIME);
	SCL = 0;
}


void i2c_send(uint8_t send_data)
{
	uint8_t count;      
	for(count=0;count<8;count++)
	{
		SCL = 0; 
		if((send_data&0x80)==0x80) 
		{
			SDA=1;
		}	  
		else 
		{
			SDA=0;
		}	
		send_data<<=1;
		i2c_delay(I2CTIME);
		SCL = 1;
		i2c_delay(I2CTIME);  
	}
	SCL = 0;
}


uint8_t i2c_read(void)
{
	uint8_t count;
	uint8_t dat = 0xff;   
	SDA=1; 
	SDA=1; 
	SDA_DIR = 1;
	for(count=0;count<8;count++)
	{        
		dat <<= 1;
		SCL = 0;
		i2c_delay(I2CTIME);         
		SCL = 1;  
		i2c_delay(I2CTIME);  
		if(SDA)  
		{
			dat|=0x01;
		}	
		else     
		{
			dat&=0xFE; 
		}	     
	}
	SCL = 0;
	SDA_DIR = 0;
	return(dat);
}


void writebyte(uint8_t address,uint8_t data)
{
	start_i2c();
	i2c_send(IC_ADDRESS);//硬件地址
	waitack_i2c(); 
	i2c_send(address);
	waitack_i2c();  
	i2c_send(data);  
	waitack_i2c(); 
	stop_i2c(I2CTIME);
}


uint8_t readbyte(uint8_t address)
{
	uint8_t recv_data=0xff;
	
	start_i2c();
	i2c_send(IC_ADDRESS);//器件地址
	waitack_i2c(); 
	
	i2c_send(address);   //寄存器地址
	waitack_i2c(); 
	
	start_i2c();   
	i2c_send(IC_ADDRESS+0x01); //读操作命令
	waitack_i2c();  
	
	recv_data=i2c_read(); //读数据
	sendnotack_i2c();  //发送非应答
	
	stop_i2c(I2CTIME);
	return(recv_data); 
}


