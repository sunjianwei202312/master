#ifndef _LED_H_
#define _LED_H_




void shift_srclk(uint8_t flag);
void latch_rclk(uint8_t flag);
void seg_disp(uint8_t num, uint8_t dp,uint8_t flag);
void lcd_init(void);
void up_time1(uint8_t udata_time[]);
void up_date(uint8_t date[],uint8_t length,uint8_t dian,uint8_t flag);
#if defined(USE_TWO_FACE)
void up_time2(uint8_t udata_time[]);
#endif
uint8_t Compare(TIME first,TIME second);

#define EQUAL 				0
#define GREATER				1
#define LESS				2




//#define ONE_USE_1S_2S_3S_4S_5S_6S_7S_8S_HMS
//#define ONE_USE_1G_2G_3G_4G_HM
#define ONE_USE_1G_2G_3G_4G_5G_6G_HMS
//#define ONE_USE_YT_1G_2G_3G_4G_HM


#if defined(ONE_USE_1S_2S_3S_4S_5S_6S_7S_8S_HMS)
 #define DISPLAY_DIGITAL_LENGTH1 8
 #define ONE_USE_HMS
 #define ONE_USE_SMALL
 #define SOFTWARE_VERSION1	1

#elif defined(ONE_USE_1G_2G_3G_4G_HM)
#define DISPLAY_DIGITAL_LENGTH1 4
#define ONE_USE_HM
#define ONE_USE_BIG
#define SOFTWARE_VERSION1	2

#elif defined(ONE_USE_1G_2G_3G_4G_5G_6G_HMS)
#define DISPLAY_DIGITAL_LENGTH1 6
#define ONE_USE_HMS
#define ONE_USE_BIG
#define SOFTWARE_VERSION1	3

#elif defined(ONE_USE_YT_1G_2G_3G_4G_HM)
#define DISPLAY_DIGITAL_LENGTH1 6
#define ONE_USE_HM
#define ONE_USE_YT_BIG
#define SOFTWARE_VERSION1	4

#endif


#if defined(USE_TWO_FACE)

//#define TWO_USE_1S_2S_3S_4S_5S_6S_7S_8S_HMS
//#define TWO_USE_1G_2G_3G_4G_HM
//#define TWO_USE_1G_2G_3G_4G_5G_6G_HMS
#define TWO_USE_YMD_DAY     
//#define TWO_USE_S_YMD_DAY
//#define TWO_USE_MD_DAY
//#define TWO_USE_DAY


#endif


#if defined(TWO_USE_1S_2S_3S_4S_5S_6S_7S_8S_HMS)
#define DISPLAY_DIGITAL_LENGTH2 8
#define TWO_USE_HMS
#define TWO_USE_SMALL
#define SOFTWARE_VERSION2	1

#elif defined(TWO_USE_1G_2G_3G_4G_HM)
#define DISPLAY_DIGITAL_LENGTH2 4
#define TWO_USE_HM
#define TWO_USE_BIG
#define SOFTWARE_VERSION2	2

#elif defined(TWO_USE_1G_2G_3G_4G_5G_6G_HMS)
#define DISPLAY_DIGITAL_LENGTH2 6
#define TWO_USE_HMS
#define TWO_USE_BIG
#define SOFTWARE_VERSION2	3

#elif defined (TWO_USE_YMD_DAY)
#define DISPLAY_DIGITAL_LENGTH2 9
#define TWO_USE_BIG
#define SOFTWARE_VERSION2	4

#elif defined (TWO_USE_S_YMD_DAY)
#define DISPLAY_DIGITAL_LENGTH2 7
#define TWO_USE_BIG
#define SOFTWARE_VERSION2	5

#elif defined (TWO_USE_MD_DAY)
#define DISPLAY_DIGITAL_LENGTH2 5
#define TWO_USE_BIG
#define SOFTWARE_VERSION2	6

#elif defined (TWO_USE_DAY)
#define DISPLAY_DIGITAL_LENGTH2 1
#define TWO_USE_BIG
#define SOFTWARE_VERSION2	7

#endif









#define delay_1us Nop();Nop()


#define LCD_SER_DIR1   	TRISC0		//数据方向
#define LCD_SRCLK_DIR1	TRISC5		//移位锁存方向
#define LCD_RCLK_DIR1  	TRISA5		//锁存输出方向
#define LCD_SER_DIR2 	TRISA2	//数据方向
#define LCD_SRCLK_DIR2	TRISA3	//移位锁存方向
#define LCD_RCLK_DIR2  	TRISA4		//锁存输出方向


#define LCD_SER1    	RC0			//数据
#define LCD_SRCLK1		RC5			//移位锁存
#define LCD_RCLK1	  	RA5		//锁存输出
#define LCD_SER2    	RA2			//数据
#define LCD_SRCLK2		RA3			//移位锁存
#define LCD_RCLK2	  	RA4		//锁存输出





#define LCD_EN_DIR1 	TRISC2		//秒脉冲方向
#define LCD_EN1			RC2		//秒脉冲输出
#define LCD_EN_DIR2 	TRISC1		//秒脉冲方向
#define LCD_EN2			RC1		//秒脉冲输出


#endif
