#ifndef _TYPE_H_
#define _TYPE_H_

typedef unsigned char  UINT8    ;                                       /*  无符号8位整型变量           */
typedef signed   char  INT8;                                            /*  有符号8位整型变量           */
typedef unsigned short int UINT16;                                          /*  无符号16位整型变量          */
typedef signed     short int INT16;                                           /*  有符号16位整型变量          */
typedef unsigned long int  UINT32;                                          /*  无符号32位整型变量          */
typedef signed   long int INT32;                                           /*  有符号32位整型变量          */
typedef float          F32;                                            /*  单精度浮点数（32位长度）    */
typedef double         D32;    

typedef enum BOOL_TYPE {FALSE=0, TRUE} BOOL;

#define	uint8_t		UINT8
#define	uint16_t		UINT16
#define	uint32_t		UINT32


typedef struct   _TIME
{
	unsigned char   	hour;		//时
	unsigned char		min;		//分
	unsigned char		sec;		//秒
}TIME;			//时间结构

typedef struct   _DATE
{
	unsigned char 		day;		//星期
	unsigned char   	date;	//日
	unsigned char		month;	//月
	unsigned char		year;	//年
}DATE;			//日期结构

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
	DIGITAL_NORMAL=0,		//正常走时
	DIGITAL_JIAOSHI,		//正追
	DIGITAL_STOP,			//停止
	DIGITAL_CHASE_TIME,		//追时
	DIGITAL_DUISHI,			//对时
	DIGITAL_CLOSE,			//关闭
	DIGITAL_OPEN,			//开启
	DIGITAL_TEST,			//测试
	DIGITAL_RESET			//重启
	
}DIGITAL_STATE;


#endif

