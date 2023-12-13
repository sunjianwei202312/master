#ifndef _I2C_SIMULATE_H_
#define _I2C_SIMULATE_H_


#define AddWr 0xd0 //Write Address
 #define AddRd 0xd1 //Read Address

 //全局变量
 #define Sda  RC4
 #define Scl    RC3
 
 #define SDA_DIR TRISC4
 #define SCL_DIR  TRISC3
 void mDelay(unsigned char j);
  void Start(void);
  void Stop(void);
  void Ack(void);
  void NoAck(void);
  void Send(unsigned char Data);
  unsigned char Read(void);
  void WrToROM(unsigned char Data[],unsigned char Address,unsigned char Num);
  void RdFromROM(unsigned char Data[],unsigned char Address,unsigned char Num);
  

#endif