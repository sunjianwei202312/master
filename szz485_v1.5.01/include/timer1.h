#ifndef _TIMER1_H_
#define _TIMER1_H_

void timer1_init(void);
void timer1_isr(void);



uint8_t time_add(TIME *t);
uint8_t time_dec(TIME *t);
#if defined(USE_YEAR_MONTH_DATA)
void date_dec(DATE *t);
void date_add(DATE *t);
uint8_t isleap(uint16_t year);
#endif

#define	MAIN_CLOCK_L	TMR1L
#define MAIN_CLOCK_H	TMR1H

#define	WDTPS_0000()		WDTPS3=0;WDTPS2 = 0;WDTPS1=0;WDTPS0=0	//预分频比1:32
#define	WDTPS_0001()		WDTPS3=0;WDTPS2 = 0;WDTPS1=0;WDTPS0=1	//预分频比1:64
#define	WDTPS_0010()		WDTPS3=0;WDTPS2 = 0;WDTPS1=1;WDTPS0=0	//预分频比1:128
#define	WDTPS_0011()		WDTPS3=0;WDTPS2 = 0;WDTPS1=1;WDTPS0=1	//预分频比1:256
#define	WDTPS_0100()		WDTPS3=0;WDTPS2 = 1;WDTPS1=0;WDTPS0=0	//预分频比1:512
#define	WDTPS_0101()		WDTPS3=0;WDTPS2 = 1;WDTPS1=0;WDTPS0=1	//预分频比1:1024
#define	WDTPS_0110()		WDTPS3=0;WDTPS2 = 1;WDTPS1=1;WDTPS0=0	//预分频比1:2048
#define	WDTPS_0111()		WDTPS3=0;WDTPS2 = 1;WDTPS1=1;WDTPS0=1	//预分频比1:4096
#define	WDTPS_1000()		WDTPS3=1;WDTPS2 = 0;WDTPS1=0;WDTPS0=0	//预分频比1:8192
#define	WDTPS_1001()		WDTPS3=1;WDTPS2 = 0;WDTPS1=0;WDTPS0=1	//预分频比1:16384
#define	WDTPS_1010()		WDTPS3=1;WDTPS2 = 0;WDTPS1=1;WDTPS0=0	//预分频比1:32768
#define	WDTPS_1011()		WDTPS3=1;WDTPS2 = 0;WDTPS1=1;WDTPS0=1	//预分频比1:65536
#define	TIMER0_PSA()		PSA=0		//预分频器分给TIMER0
#define	WDT_PSA()			PSA=1		//预分频器分给看门狗
#define	WDT_EN()			SWDTEN=1		//使能看门狗


#endif
