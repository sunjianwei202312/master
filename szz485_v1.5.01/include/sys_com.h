/**
  ******************************************************************************
  * @file sys_com.h
  * @brief This file software
  * @author 
  * @version V1.0
  * @date 
    ******************************************************************************

  */
/* Define to prevent recursive inclusion -------------------------------------*/
#ifndef __SYS_COM_H
#define __SYS_COM_H
/* Includes ------------------------------------------------------------------*/
#include"pic_type.h"



/* Exported macro ------------------------------------------------------------*/

//广播地址
#define BROADCAST_ADDRESS	0xFF


//命令字
#define 	CMD_GET_SYS_STATE 	0x0011

//数据帧格式偏移量
#define		T_HEAD_POS			0x00
#define		T_ADDR_POS			0x01
#define		T_PROTVER_POS		0x02
#define		T_HARDWARE_POS		0x03
#define		T_CARDTYPE_POS		0x04
#define		T_LENGTH_POS		0x05
//#define		T_CMD_POS			0x06
#define		T_DATA_POS			0x06
#define		T_CHECKSUM_POS		0x08
#define		T_TALL_POS			0x09


// Transmit data byte position (CMD->)
#define		T_DATA_CMDH_POS			0x00
#define		T_DATA_CMDL_POS			0x01
#define		T_DATA_ERROR_POS		0x02


//Received data
#define		DATA_CMDH_POS	0x00
#define		DATA_CMDL_POS	0x01
#define		DATA_DATA_POS	0x02

//DHT11传感器接口
#define	DHT11_HUMR_PIN		TRISA3//
#define DHT11_HUMR_VALUE	RA3

extern u8 temp_value;//温度
extern u8 humi_value;//湿度

void send_char(u8 data);
void SendFrame(void);
void CommandParser(void);
void Sys_staus(void);

u8 DH11_ReadTempAndHumi(void);//DHT11的温湿度

void delay_10us(void);
void delay(u8 n);
#endif/*__SYS_COM_H*/
