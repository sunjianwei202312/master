#ifndef __I2C_H
#define __I2C_H
 

#define I2C_V3


#define BCL1IF	BCLIF
#define SSP1BUF	SSPBUF

#define SSP1ADD  SSPADD
#define R_W  RW
#define SSP1STAT SSPSTAT
#define SSP1CON1  SSPCON
#define SSP1CON2 SSPCON2
 #define SDA_DIR TRISC4
 #define SCL_DIR  TRISC3
 
#define I2C1_SCL  SCL_DIR
#define I2C1_SDA  SDA_DIR

#define SSP1IF SSPIF

#define SSP1IE SSPIE

/* SSPCON1 REGISTER */
#define   SSPENB    			0b00100000  	/* Enable serial port and configures SCK, SDO, SDI*/
#define   SLAVE_7   			0b00000110     	/* I2C Slave mode, 7-bit address*/
#define   SLAVE_10  			0b00000111    	/* I2C Slave mode, 10-bit address*/
#define   MASTER    			0b00001000     	/* I2C Master mode */
#define   MASTER_FIRMW			0b00001011		//I2C Firmware Controlled Master mode (slave Idle)
#define   SLAVE_7_STSP_INT 		0b00001110		//I2C Slave mode, 7-bit address with Start and Stop bit interrupts enabled
#define   SLAVE_10_STSP_INT 	0b00001111		//I2C Slave mode, 10-bit address with Start and Stop bit interrupts enabled

/* SSPSTAT REGISTER */
#define   SLEW_OFF  			0b10000000  	/* Slew rate disabled for 100kHz mode */
#define   SLEW_ON   			0b00000000  	/* Slew rate enabled for 400kHz mode  */





#if defined (I2C_V3)/* These versions have MSSP1 */

/* ***** I2C1 ***** */

/***********************************************************************************
Macro       : EnableIntI2C1

Include     : i2c.h

Description : Macro enables I2C  Interrupt
 
Arguments   : None
 
Remarks     : None
***********************************************************************************/
#define EnableIntI2C1                   (SSP1IE = 1)

/***********************************************************************************
Macro       : DisableIntI2C1

Include     : i2c.h

Description : Macro disables I2C  Interrupt
 
Arguments   : None
 
Remarks     : None
***********************************************************************************/
#define DisableIntI2C1                   (SSP1IE = 0)


 


/*******************************************************************
Macro       : I2C1_Clear_Intr_Status_Bit

Include     : i2c.h

Description : Macro to Clear I2C  Interrupt Status bit

Arguments   : None

Remarks     : None
*******************************************************************/
#define I2C1_Clear_Intr_Status_Bit     (SSP1IF = 0)

/*******************************************************************
Macro       : I2C1_Intr_Status

Include     : i2c.h 

Description : Macro to return I2C Interrupt Status

Arguments   : None

Remarks     : None
*******************************************************************/
#define I2C1_Intr_Status		SSP1IF

/*******************************************************************
Macro       : StopI2C1()

Include     : i2c.h

Description : Macro to initiate stop condition

Arguments   : None

Remarks     : This macro initiates stop condition and waits till the stop signal
		sequence is terminated.This macro is applicable only to master
*******************************************************************/
#define StopI2C1()  PEN=1;while(PEN)

#define StopI2C StopI2C1





/*******************************************************************
Macro       : RestartI2C1()

Include     : i2c.h

Description : Macro to initiate Restart condition

Arguments   : None

Remarks     : This macro initiates Restart condition and waits till the Restart signal
		sequence is terminated. This macro is applicable only to master
*******************************************************************/
#define RestartI2C1()  RSEN=1;while(RSEN)

#define RestartI2C RestartI2C1

/*******************************************************************
Macro       : NotAckI2C1()

Include     : i2c.h

Description : Macro to initiate negetive acknowledgement sequence

Arguments   : None

Remarks     : This macro initiates negetive acknowledgement condition and 
		waits till the acknowledgement sequence is terminated.
		This macro is applicable only to master
*******************************************************************/
#define NotAckI2C1()     ACKDT=1, ACKEN=1;while(ACKEN)

#define NotAckI2C NotAckI2C1

/*******************************************************************
Macro       : AckI2C1()

Include     : i2c.h

Description : Macro to initiate positive acknowledgement sequence

Arguments   : None

Remarks     : This macro initiates positive acknowledgement condition and 
		waits till the acknowledgement sequence is terminated.
		This macro is applicable only to master
*******************************************************************/
#define AckI2C1()        ACKDT=0, ACKEN=1;while(ACKEN)

#define AckI2C AckI2C1



/*********************************************************************
Macro  :  CloseI2C1()

Include            : i2c.h 

Description        : This Macro turns off the I2C module 

Arguments          : None 

Return Value       : None 

Remarks            : This Macro disables the I2C module.
*********************************************************************/
#define CloseI2C1()  SSP1CON1 &=0xDF

#define CloseI2C CloseI2C1

void OpenI2C1(  unsigned char sync_mode,  unsigned char slew );
#define OpenI2C OpenI2C1

/************************************************************************
Macro :  DataRdyI2C1() 

Include            : i2c.h 

Description        : This Macro provides status back to user if SSPxBUF
			register contain data. 
                     
Arguments          : None 

Remarks            : This Macro determines if there is any byte to read from
			SSPxBUF register.
*************************************************************************/
#define DataRdyI2C1()    (BF)

#define DataRdyI2C DataRdyI2C1

unsigned char ReadI2C1( void );
#define ReadI2C ReadI2C1

/**************************************************************************
Macro       : getcI2C1

Description : macro is identical to ReadI2C1,#define to ReadI2C1 in i2c.h
 
Arguments   : None
 
Remarks     : None 
***************************************************************************/
#define  getcI2C1  ReadI2C1
#define  getcI2C getcI2C1

unsigned char WriteI2C1(  unsigned char data_out );


/**************************************************************************
Macro       : putcI2C1

Description : macro is identical to WriteI2C1,#define to WriteI2C1 in i2c.h
 
Arguments   : None
 
Remarks     : None 
***************************************************************************/
#define  putcI2C1  WriteI2C1
#define  putcI2C putcI2C1

unsigned char getsI2C1(  unsigned char *rdptr,  unsigned char length );
#define getsI2C getsI2C1

unsigned char putsI2C1(  unsigned char *wrptr,unsigned char );
#define putsI2C putsI2C1




//****************** I2C EEPROM Function prototype ******************************

unsigned char EEAckPolling1(  unsigned char control );
#define EEAckPolling EEAckPolling1

unsigned char EEByteWrite1(  unsigned char control,
                            unsigned char address,
                            unsigned char data );
#define EEByteWrite EEByteWrite1

unsigned int  EECurrentAddRead1(  unsigned char control );
#define EECurrentAddRead EECurrentAddRead1

unsigned char EEPageWrite1(  unsigned char control,
                            unsigned char address,
                            unsigned char *wrptr,unsigned char );
#define EEPageWrite EEPageWrite1

unsigned int  EERandomRead1(  unsigned char control,  unsigned char address );
#define EERandomRead EERandomRead1

unsigned char EESequentialRead1(  unsigned char control,
                                 unsigned char address,
                                 unsigned char *rdptr,
                                 unsigned char length );
#define EESequentialRead EESequentialRead1
#endif


#endif

