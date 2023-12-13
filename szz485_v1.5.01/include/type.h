#ifndef _TYPE_H_
#define _TYPE_H_

typedef unsigned char  UINT8    ;                                       /*  �޷���8λ���ͱ���           */
typedef signed   char  INT8;                                            /*  �з���8λ���ͱ���           */
typedef unsigned short int UINT16;                                          /*  �޷���16λ���ͱ���          */
typedef signed     short int INT16;                                           /*  �з���16λ���ͱ���          */
typedef unsigned long int  UINT32;                                          /*  �޷���32λ���ͱ���          */
typedef signed   long int INT32;                                           /*  �з���32λ���ͱ���          */
typedef float          F32;                                            /*  �����ȸ�������32λ���ȣ�    */
typedef double         D32;    

typedef enum BOOL_TYPE {FALSE=0, TRUE} BOOL;

#define	uint8_t		UINT8
#define	uint16_t		UINT16
#define	uint32_t		UINT32


typedef struct   _TIME
{
	unsigned char   	hour;		//ʱ
	unsigned char		min;		//��
	unsigned char		sec;		//��
}TIME;			//ʱ��ṹ

typedef struct   _DATE
{
	unsigned char 		day;		//����
	unsigned char   	date;	//��
	unsigned char		month;	//��
	unsigned char		year;	//��
}DATE;			//���ڽṹ

typedef struct _NTP_INFO 
{ 

	#if defined(USE_LIGHTING_MODE)
	uint8_t display_on_off1;
	uint8_t display_grade1;
	TIME start_time1;
	TIME end_time1;
	#endif
	#if defined(USE_LIGHTING_MODE2)
	uint8_t display_on_off2;
	uint8_t display_grade2;
	TIME start_time2;
	TIME end_time2;
	#endif
	uint8_t test_mode1;
	uint8_t test_mode2;
	#if defined(USE_DJS_MODE1)
	uint8_t djs_on_off1;
	TIME djs_start_time1;
	TIME djs_con_time1;
	#endif
	
	#if defined(USE_DJS_MODE2)
	uint8_t djs_on_off2;
	TIME djs_start_time2;
	TIME djs_con_time2;
	
	#endif
	uint8_t time_zone;
	
} NTP_INFO;

typedef enum _DIGITAL_STATE 
{	
	DIGITAL_NORMAL=0,		//������ʱ
	DIGITAL_JIAOSHI,		//��׷
	DIGITAL_STOP,			//ֹͣ
	DIGITAL_CHASE_TIME,		//׷ʱ
	DIGITAL_DUISHI,			//��ʱ
	DIGITAL_CLOSE,			//�ر�
	DIGITAL_OPEN,			//����
	DIGITAL_TEST,			//����
	DIGITAL_RESET			//����
	
}DIGITAL_STATE;


#endif

