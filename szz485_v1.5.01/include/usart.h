#ifndef _SERIAL_H_
#define _SERIAL_H_

#define BAUD 9600      
#define FOSC 8000000L
#define NINE 0     /* Use 9bit communication? FALSE=8bit */

#define DIVIDER ((int)(FOSC/(16UL * BAUD) -1))
#define HIGH_SPEED 1

#if NINE == 1
#define NINE_BITS 0x40
#else
#define NINE_BITS 0
#endif

#if HIGH_SPEED == 1
#define SPEED 0x4
#else
#define SPEED 0
#endif

#if defined(_16F87) || defined(_16F88)
	#define RX_PIN TRISB2
	#define TX_PIN TRISB5
#else
	#define RX_PIN TRISC7
	#define TX_PIN TRISC6
#endif

/* Serial initialization */
#define init_comms()\
	RX_PIN = 1;	\
	TX_PIN = 1;		  \
	SPBRG = DIVIDER;     	\
	RCSTA = (NINE_BITS|0x90);	\
	TXSTA = (SPEED|NINE_BITS|0x20);		\
	RCIE = 1;

void putch(uint8_t byte);
void usart_init(void);
void usart_isr(void);
uint8_t id_code(void);
void cdata_execute(void);

#define	Reset()							TMR1ON = 0;GIE = 0;PEIE = 0

#define LETTER_E	0x45
 
#define	FUN_CLOCK_JIAOSHI				0x0900		//校时
#define FUN_CLOCK_QUERY					0x0901	//查询
#define FUN_CLOCK_QUERY_REP				0x0902	//查询回复
#define FUN_CLOCK_STATE					0x0903	//设置子钟状态
#define FUN_CLOCK_STATE_REP				0x0904	//返回
#define FUN_CLOCK_LIGHTING				0x0905	//设置子钟照明
#define FUN_CLOCK_LIGHTING_REP			0x0906	//返回
#define FUN_CLOCK_CHECK					0x0907	//设置子钟钟面时间
#define FUN_CLOCK_CHECK_REP				0x0908	//回复
#define FUN_CLOCK_RESET					0x0909	//设置子钟重启
#define FUN_CLOCK_RESET_REP				0x090A	//回复
#define FUN_CLOCK_ZZH					0x090B	//设置子钟12/24进制
#define FUN_CLOCK_ZZH_REP				0x090C	//回复设置子钟12/24进制
#define FUN_CLOCK_OC					0x090D	//设置子钟开关
#define FUN_CLOCK_OC_REP				0x090E	//回复设置子钟开关
#define FUN_CLOCK_ZZSQ					0x090F	//设置子钟时区
#define FUN_CLOCK_ZZSQ_REP				0x0910	//回复设置子钟时区
#define FUN_CLOCK_PAR					0x0911	//设置子钟参数
#define FUN_CLOCK_PAR_REP				0x0912	//回复设置子钟参数
#define FUN_CLOCK_MZCS					0x0913	//母钟广播参数

#define FUN_CLOCK_LOGIN					0x0915	//子钟向母钟注册
#define FUN_CLOCK_LOGIN_REP				0x0916	//母钟回复子钟注册
#define FUN_CLOCK_ONE_KEY				0x0917	//设置子钟一键校时
#define FUN_CLOCK_ONE_KEY_REP			0x0918	//回复设置
#define FUN_CLOCK_DEFAULT				0x0919	//设置子钟恢复出厂设置
#define FUN_CLOCK_DEFAULT_REP			0x091A	//回复设置
#define FUN_CLOCK_DISPLAY				0x091B	//设置数字子钟亮度等级
#define FUN_CLOCK_DISPLAY_REP			0x091C	//回复设置
#define FUN_CLOCK_TEST					0x091D	//设置子钟测试
#define FUN_CLOCK_TEST_REP				0x091E	//回复设置
#define FUN_CLOCK_DJS					0x091F	//设置子钟倒计时
#define FUN_CLOCK_DJS_REP				0x0920	//回复设置
#define FUN_CLOCK_MZZX					0x0921	//查询照明、钟针、系统时间
#define FUN_CLOCK_MZZX_REP				0x0922	//回复查询
#define FUN_CLOCK_VERSION				0x0923	//查询版本号
#define FUN_CLOCK_VERSION_REP			0x0924	//回复查询

#define PROGRAM_VERSION		0x0009

#define REPLY_LEN_POSITION				0x01	//数据中功能码初始位置
#define REPLY_FUNC_POSITION				0x02	//数据中功能码初始位置
#define REPLY_ID_POSITION				0x04	//数据中ID位置
#define REPLY_MAC_POSITION				0x04	//数据中MAC位置
#define REPLY_MZCS_MS_POSITION			0x04	//数据中主备位置
#define REPLY_LOGIN_MAC_POSITION		0x04	//数据中MAC位置
#define REPLY_FACE_POSITION				0x05	//数据中面号位置
#define REPLY_ZZSQ_POSITION				0x05	//数据中时区位置
#define REPLY_STATE_POSITION			0x06	//回复数据中设置状态的位置
#define REPLY_CHECK_POSITION			0x06	//回复数据中钟面时间的位置
#define REPLY_MZCS_IP_POSITION			0x0B	//数据中IP位置

#define REPLY_JIAOSHI_POSITION			0x04	//回复数据中校时的初始位置
#define REPLY_ID_POSITION				0x04	//回复数据中ID号的位置

#define	MOTOR_CLOCK						0x01
#define	DIGITAL_CLOCK					0x00
#define	MOTOR_LIGHTING_NO				0x00
#define	MOTOR_LIGHTING_YES				0x02
#define	MOTOR_LIGHTING_OFF				0x00
#define	MOTOR_LIGHTING_ON				0x04
#define	MOTOR_ONE_FACE					0x08
#define	MOTOR_TWO_FACE					0x10
#define ZZH_12HOUR						0x00
#define	ZZH_24HOUR						0x20
#define	ZZH_422_485						0x00
#define	ZZH_NTP							0x40
#define	ZZH_SUPPORT_DJS					0x80

#define WARRING_NOT_JIAOSHI				0x08	//未校时告警
#define WARRING_FACE_ZHONGZHEN			0x02	//钟针1检测到错误
#define WARRING_CON_ZHONGZHEN			0x04	//钟针2检测到错误

#define ZZSQ_W							0x00
#define	ZZSQ_E							0x80

#define MZCS_MASTER						0x01
#define	MZCS_SLAVE						0x02

#define	DATA_HEAD1						0xD3   	//报头1
#define	DATA_TAIL1						0xD8   	//报尾1

/*
#define LENGTH_CLOCK_JIAOSHI			16
#define LENGTH_QUERY					8
#define LENGTH_STATE					10
#define LENGTH_LIGHTING					17
#define LENGTH_CHECK					12
#define LENGTH_RESET					8
#define LENGTH_ZZH						9
#define LENGTH_OC						9
#define LENGTH_ZZSQ						9
#define LENGTH_PAR						29
#define LENGTH_MZCS						28
#define LENGTH_LOGIN					29
#define LENGTH_LOGIN_REP				28	
#define LENGTH_ONE_KEY					8
#define LENGTH_DEFAULT					8	
#define LENGTH_DISPLAY					17
#define LENGTH_TEST						8
#define LENGTH_DJS						16
//*/


#define LENGTH_CLOCK_JIAOSHI			16
#define LENGTH_QUERY					8
#define LENGTH_STATE					10
#define LENGTH_LIGHTING					17
#define LENGTH_CHECK					12
#define LENGTH_RESET					8
#define LENGTH_ZZH						9
#define LENGTH_OC						9
#define LENGTH_ZZSQ						9
#define LENGTH_PAR						29
#define LENGTH_MZCS						28
#define LENGTH_LOGIN					29
#define LENGTH_LOGIN_REP				28	
#define LENGTH_ONE_KEY					8
#define LENGTH_DEFAULT					8	
#define LENGTH_DISPLAY					17
#define LENGTH_TEST						10
#define LENGTH_DJS						16



#define TXD_BUFFER_LEN					20
#define RXD_BUFFER_LEN					17

#define BUTTON1_DIR	TRISB6		//拨码开关的方向控制
#define BUTTON2_DIR	TRISB7		//
#define BUTTON3_DIR	TRISB5		//
#define BUTTON4_DIR	TRISB4		//
#define BUTTON5_DIR	TRISB2		//
#define BUTTON6_DIR	TRISB1			//
#define BUTTON7_DIR	TRISA0		//
#define BUTTON8_DIR	TRISA1			//


#define BUTTON1		RB6		//拨码开关的值
#define BUTTON2		RB7		//
#define BUTTON3		RB5		//
#define BUTTON4		RB4		//
#define BUTTON5		RB2		//
#define BUTTON6		RB1		//	
#define BUTTON7		RA0		//
#define BUTTON8		RA1		//



#define SEL_RS485_DIR	TRISB0		//	485方向控制
#define	SEL_RS485_RX()	while(!TRMT);RB0 = 0		//设置为接收状态
#define	SEL_RS485_TX()	RB0 = 1		//	设置为发送状态
#define REC_ERROR	OERR				//错误标志
#define	REC_ENABLE	CREN		//使能接收
#define	RX_INTERRUPT	RCIE		//接收中断标志


#define USART_SAVE_TIME			1
#define USART_SAVE_ZONE			2
#define USART_SAVE_DEFAULT		3
#define USART_SAVE_LIGHTING		4

#endif
