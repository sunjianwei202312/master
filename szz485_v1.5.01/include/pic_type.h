/**
  ******************************************************************************
  * @file pic_type.h
  * @brief This file contains all common data types.
  * @author 
  * @version V1.0
  * @date 
    ******************************************************************************

  */

/* Define to prevent recursive inclusion -------------------------------------*/
#ifndef __PIC_TYPE_H
#define __PIC_TYPE_H

/* Includes ------------------------------------------------------------------*/
/* Exported types ------------------------------------------------------------*/
typedef signed long  s32;
typedef signed short s16;
typedef signed char  s8;

typedef signed long  const sc32;  /* Read Only */
typedef signed short const sc16;  /* Read Only */
typedef signed char  const sc8;   /* Read Only */

typedef volatile signed long  vs32;
typedef volatile signed short vs16;
typedef volatile signed char  vs8;

typedef volatile signed long  const vsc32;  /* Read Only */
typedef volatile signed short const vsc16;  /* Read Only */
typedef volatile signed char  const vsc8;   /* Read Only */

typedef unsigned long  u32;
typedef unsigned short u16;
typedef unsigned char  u8;

typedef unsigned long  const uc32;  /* Read Only */
typedef unsigned short const uc16;  /* Read Only */
typedef unsigned char  const uc8;   /* Read Only */

typedef volatile unsigned long  vu32;
typedef volatile unsigned short vu16;
typedef volatile unsigned char  vu8;

typedef volatile unsigned long  const vuc32;  /* Read Only */
typedef volatile unsigned short const vuc16;  /* Read Only */
typedef volatile unsigned char  const vuc8;   /* Read Only */


typedef struct BIT_struct   //定义8位的位结构变量
{
	u8 bit1:1;
	u8 bit2:1;
	u8 bit3:1;
	u8 bit4:1;
	u8 bit5:1;
	u8 bit6:1;
	u8 bit7:1;
	u8 bit8:1;
}
BITS_Typedef;

typedef union BIT_union	//定义8位数据联合体
{
	BITS_Typedef  bitu;
	u8		 	 charu;
}
BITU_Typedef;




typedef enum {
  RESET = 0,
  SET = !RESET
}
FlagStatus, ITStatus, BitStatus;

typedef enum {
  DISABLE = 0,
  ENABLE = !DISABLE
}
FunctionalState;

#define IS_FUNCTIONALSTATE_OK(VALUE) ( (VALUE == ENABLE) || (VALUE == DISABLE) )

typedef enum {
  ERROR = 0,
  SUCCESS = !ERROR
}
ErrorStatus;

#define U8_MAX     ((u8)255)
#define S8_MAX     ((s8)127)
#define S8_MIN     ((s8)-128)
#define U16_MAX    ((u16)65535u)
#define S16_MAX    ((s16)32767)
#define S16_MIN    ((s16)-32768)
#define U32_MAX    ((u32)4294967295uL)
#define S32_MAX    ((s32)2147483647)
#define S32_MIN    ((s32)-2147483648)

/* Exported constants --------------------------------------------------------*/
/* Exported macro ------------------------------------------------------------*/
#define LOW		0
#define HIGH	1
#define OFF		0
#define ON		1

/* Exported functions ------------------------------------------------------- */
#define SETCHANVALUE(a, b, var)	({ if (var) \
			a |= (1<<(b-1));	\
			else	{ \
			a |= (1<<(b-1)); a ^= (1<<(b-1)); }})

#define GETCHANVALUE(a, b) 	((a>>(b-1))&0x01)


#endif /* __PIC_TYPE_H */

/******************* (C) COPYRIGHT 2012  *****END OF FILE****/
