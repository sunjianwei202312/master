#ifndef __DS3231_H
#define __DS3231_H


#define DS3231_ADDR			0xD0	//ds3231地址
#define DS3231_SECOND		0x00	//秒
#define DS3231_MINUTE		0x01	//分
#define DS3231_HOUR			0x02	//时
#define DS3231_DAY			0x03	//星期
#define DS3231_DATE			0x04	//日
#define DS3231_MONTH		0x05	//月
#define DS3231_YEAR			0x06	//年
#define DS3231_A1_SECOND	0x07	//闹钟1秒
#define DS3231_A1_MINUTE	0x08	//闹钟1分
#define DS3231_A1_HOUR		0x09	//闹钟1时
#define DS3231_A1_DATE		0x0A	//闹钟1日
#define DS3231_A2_MINUTE	0x0B	//闹钟2分
#define DS3231_A2_HOUR		0x0C	//闹钟2时
#define DS3231_A2_DATE		0x0D	//闹钟2天
#define DS3231_CONTROL		0x0E	//控制
#define DS3231_STATUS		0x0F	//状态
#define DS3231_OFFSET		0x10	//晶体老化偏移
#define DS3231_MSB			0x11	//温度寄存器高字节
#define DS3231_LSB			0x0E	//温度寄存器低字节


#define	FLAG_DATE_NONE		0
#define	FLAG_DATE_ADD		1
#define	FLAG_DATE_DEC		2


void ds3231_init(void);
unsigned char  hex_dec(unsigned char	hex16);
uint8_t dec_hex(uint8_t dec16);
void get_time(void);
void settime(void);
void calc_zone(void);
void con_write_eeprom(uint8_t start,uint8_t databyte[],uint8_t len);


#endif