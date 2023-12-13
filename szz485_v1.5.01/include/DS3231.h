#ifndef __DS3231_H
#define __DS3231_H


#define DS3231_ADDR			0xD0	//ds3231��ַ
#define DS3231_SECOND		0x00	//��
#define DS3231_MINUTE		0x01	//��
#define DS3231_HOUR			0x02	//ʱ
#define DS3231_DAY			0x03	//����
#define DS3231_DATE			0x04	//��
#define DS3231_MONTH		0x05	//��
#define DS3231_YEAR			0x06	//��
#define DS3231_A1_SECOND	0x07	//����1��
#define DS3231_A1_MINUTE	0x08	//����1��
#define DS3231_A1_HOUR		0x09	//����1ʱ
#define DS3231_A1_DATE		0x0A	//����1��
#define DS3231_A2_MINUTE	0x0B	//����2��
#define DS3231_A2_HOUR		0x0C	//����2ʱ
#define DS3231_A2_DATE		0x0D	//����2��
#define DS3231_CONTROL		0x0E	//����
#define DS3231_STATUS		0x0F	//״̬
#define DS3231_OFFSET		0x10	//�����ϻ�ƫ��
#define DS3231_MSB			0x11	//�¶ȼĴ������ֽ�
#define DS3231_LSB			0x0E	//�¶ȼĴ������ֽ�


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