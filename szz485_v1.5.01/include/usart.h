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
 
#define	FUN_CLOCK_JIAOSHI				0x0900		//Уʱ
#define FUN_CLOCK_QUERY					0x0901	//��ѯ
#define FUN_CLOCK_QUERY_REP				0x0902	//��ѯ�ظ�
#define FUN_CLOCK_STATE					0x0903	//��������״̬
#define FUN_CLOCK_STATE_REP				0x0904	//����
#define FUN_CLOCK_LIGHTING				0x0905	//������������
#define FUN_CLOCK_LIGHTING_REP			0x0906	//����
#define FUN_CLOCK_CHECK					0x0907	//������������ʱ��
#define FUN_CLOCK_CHECK_REP				0x0908	//�ظ�
#define FUN_CLOCK_RESET					0x0909	//������������
#define FUN_CLOCK_RESET_REP				0x090A	//�ظ�
#define FUN_CLOCK_ZZH					0x090B	//��������12/24����
#define FUN_CLOCK_ZZH_REP				0x090C	//�ظ���������12/24����
#define FUN_CLOCK_OC					0x090D	//�������ӿ���
#define FUN_CLOCK_OC_REP				0x090E	//�ظ��������ӿ���
#define FUN_CLOCK_ZZSQ					0x090F	//��������ʱ��
#define FUN_CLOCK_ZZSQ_REP				0x0910	//�ظ���������ʱ��
#define FUN_CLOCK_PAR					0x0911	//�������Ӳ���
#define FUN_CLOCK_PAR_REP				0x0912	//�ظ��������Ӳ���
#define FUN_CLOCK_MZCS					0x0913	//ĸ�ӹ㲥����

#define FUN_CLOCK_LOGIN					0x0915	//������ĸ��ע��
#define FUN_CLOCK_LOGIN_REP				0x0916	//ĸ�ӻظ�����ע��
#define FUN_CLOCK_ONE_KEY				0x0917	//��������һ��Уʱ
#define FUN_CLOCK_ONE_KEY_REP			0x0918	//�ظ�����
#define FUN_CLOCK_DEFAULT				0x0919	//�������ӻָ���������
#define FUN_CLOCK_DEFAULT_REP			0x091A	//�ظ�����
#define FUN_CLOCK_DISPLAY				0x091B	//���������������ȵȼ�
#define FUN_CLOCK_DISPLAY_REP			0x091C	//�ظ�����
#define FUN_CLOCK_TEST					0x091D	//�������Ӳ���
#define FUN_CLOCK_TEST_REP				0x091E	//�ظ�����
#define FUN_CLOCK_DJS					0x091F	//�������ӵ���ʱ
#define FUN_CLOCK_DJS_REP				0x0920	//�ظ�����
#define FUN_CLOCK_MZZX					0x0921	//��ѯ���������롢ϵͳʱ��
#define FUN_CLOCK_MZZX_REP				0x0922	//�ظ���ѯ
#define FUN_CLOCK_VERSION				0x0923	//��ѯ�汾��
#define FUN_CLOCK_VERSION_REP			0x0924	//�ظ���ѯ

#define PROGRAM_VERSION		0x0009

#define REPLY_LEN_POSITION				0x01	//�����й������ʼλ��
#define REPLY_FUNC_POSITION				0x02	//�����й������ʼλ��
#define REPLY_ID_POSITION				0x04	//������IDλ��
#define REPLY_MAC_POSITION				0x04	//������MACλ��
#define REPLY_MZCS_MS_POSITION			0x04	//����������λ��
#define REPLY_LOGIN_MAC_POSITION		0x04	//������MACλ��
#define REPLY_FACE_POSITION				0x05	//���������λ��
#define REPLY_ZZSQ_POSITION				0x05	//������ʱ��λ��
#define REPLY_STATE_POSITION			0x06	//�ظ�����������״̬��λ��
#define REPLY_CHECK_POSITION			0x06	//�ظ�����������ʱ���λ��
#define REPLY_MZCS_IP_POSITION			0x0B	//������IPλ��

#define REPLY_JIAOSHI_POSITION			0x04	//�ظ�������Уʱ�ĳ�ʼλ��
#define REPLY_ID_POSITION				0x04	//�ظ�������ID�ŵ�λ��

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

#define WARRING_NOT_JIAOSHI				0x08	//δУʱ�澯
#define WARRING_FACE_ZHONGZHEN			0x02	//����1��⵽����
#define WARRING_CON_ZHONGZHEN			0x04	//����2��⵽����

#define ZZSQ_W							0x00
#define	ZZSQ_E							0x80

#define MZCS_MASTER						0x01
#define	MZCS_SLAVE						0x02

#define	DATA_HEAD1						0xD3   	//��ͷ1
#define	DATA_TAIL1						0xD8   	//��β1

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

#define BUTTON1_DIR	TRISB6		//���뿪�صķ������
#define BUTTON2_DIR	TRISB7		//
#define BUTTON3_DIR	TRISB5		//
#define BUTTON4_DIR	TRISB4		//
#define BUTTON5_DIR	TRISB2		//
#define BUTTON6_DIR	TRISB1			//
#define BUTTON7_DIR	TRISA0		//
#define BUTTON8_DIR	TRISA1			//


#define BUTTON1		RB6		//���뿪�ص�ֵ
#define BUTTON2		RB7		//
#define BUTTON3		RB5		//
#define BUTTON4		RB4		//
#define BUTTON5		RB2		//
#define BUTTON6		RB1		//	
#define BUTTON7		RA0		//
#define BUTTON8		RA1		//



#define SEL_RS485_DIR	TRISB0		//	485�������
#define	SEL_RS485_RX()	while(!TRMT);RB0 = 0		//����Ϊ����״̬
#define	SEL_RS485_TX()	RB0 = 1		//	����Ϊ����״̬
#define REC_ERROR	OERR				//�����־
#define	REC_ENABLE	CREN		//ʹ�ܽ���
#define	RX_INTERRUPT	RCIE		//�����жϱ�־


#define USART_SAVE_TIME			1
#define USART_SAVE_ZONE			2
#define USART_SAVE_DEFAULT		3
#define USART_SAVE_LIGHTING		4

#endif
