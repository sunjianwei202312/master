#ifndef _INCLUDE_H_
#define _INCLUDE_H_
#define __PICCPRO__ 1
#define _XTAL_FREQ 8000000


//#define USE_DEBUG_MODE
//#define USE_TEST_MODE

#define USE_TWO_FACE
//#define USE_LIGHTING_MODE
//#define USE_LIGHTING_MODE2

//#define USE_DJS_MODE1
//#define USE_DJS_MODE2
//#define USE_ZONE_SAVE
#define USE_YEAR_MONTH_DATA

//#define USE_INFRARED_MODE

#define USE_TEST_LED


#define USE_DIGITAL_MODE1
#define USE_DIGITAL_MODE2

//#define USE_TEMP_HUMI_MODE

#define Nop()     NOP()

#include <htc.h>
#include "type.h"
#include "timer1.h"
#include "usart.h"
#include "sys.h"
#include "led.h"
#include "rtc.h"
#include "DS3231.h"
#include "crc.h"
#include "eeprom.h"

#include "timer2.h"

#include "infrare.h"

#if defined(USE_TEMP_HUMI_MODE)
#include "sys_com.h"
#undef USE_TWO_FACE
#endif
#endif
