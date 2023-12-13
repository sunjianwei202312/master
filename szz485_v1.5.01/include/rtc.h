

#ifndef _RTC_H_
#define _RTC_H_

#define    SDA      RC4  //¶¨ÒåÒý½Å
#define    SCL      RC3  //
#define    SDA_DIR   TRISC4
#define    SCL_DIR		TRISC3

#define i2c_delay(x)  NOP();NOP();	//__delay_us(x)
#define stop_i2c(x)	SDA=0; \
					SCL=1; \
					i2c_delay(x); \
					SDA=1;i2c_delay(x)
void start_i2c(void);

void waitack_i2c(void);
void sendack_i2c(void);
void sendnotack_i2c(void);
void i2c_send(unsigned char send_data);
unsigned char i2c_read(void);
void writebyte(unsigned char address,unsigned char data);
unsigned char readbyte(unsigned char address);


#endif