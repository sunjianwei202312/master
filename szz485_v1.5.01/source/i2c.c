#include "include.h"







unsigned char EEAckPolling1( unsigned char control )
{   
  while ((SSP1CON2 & 0x1F) | (R_W));                      // ensure module is idle 
  SEN=1;                     // initiate START condition
  while ( SEN );      // wait until start condition is over 
  if ( BCL1IF )           // test for bus collision
  {
    return ( -1 );                 // return with Bus Collision error 
  }

  else
  {
    if ( WriteI2C1( control ) == (unsigned char)-1)    // write byte - R/W bit should be 0
    {
	  StopI2C1();  
      return ( -3 );               // set error for write collision
    }

    while ( ACKSTAT ) // test for ACK condition received
    {
      RestartI2C1();               // initiate Restart condition
      while ( RSEN ); // wait until re-start condition is over 
      if ( BCL1IF )       // test for bus collision
      {
        return ( -1 );             // return with Bus Collision error 
      }
	  if ( WriteI2C1( control ) == (unsigned char)-1)  // write byte - R/W bit should be 0
      {
	   StopI2C1();  
       return ( -3 );             // set error for write collision
      }
    }
  }
       
  StopI2C1();                      // send STOP condition
  while ( PEN );      // wait until stop condition is over         
  if ( BCL1IF )           // test for bus collision
  {
    return ( -1 );                 // return with Bus Collision error 
  }
  return ( 0 );                    // return with no error     
}

unsigned char EEByteWrite1( unsigned char control, unsigned char address, unsigned char data )
{
  while ((SSP1CON2 & 0x1F) | (R_W));                      // ensure module is idle
  SEN=1;                    // initiate START condition
  while ( SEN );      // wait until start condition is over 
  if ( BCL1IF )           // test for bus collision
  {
    return ( -1 );                 // return with Bus Collision error 
  }
  else                             // start condition successful
  {
    if ( WriteI2C1( control ) )    // write byte - R/W bit should be 0
    {
	  StopI2C1();  
      return ( -3 );               // set error for write collision
    }

    
    if ( !ACKSTAT )   // test for ACK condition received
    { 
      if ( WriteI2C1( address ) )  // write word address for EEPROM
      {
	    StopI2C1();  
        return ( -3 );             // set error for write collision
      }

     
      if ( !ACKSTAT ) // test for ACK condition received
      { 
        if ( WriteI2C1( data ) )   // data byte for EEPROM
        {
		  StopI2C1();  
          return ( -3 );           // set error for write collision
        }
      }
      else
      {
	    StopI2C1();  
        return ( -2 );             // return with Not Ack error condition   
      }
    }
    else
    {
	  StopI2C1();  
      return ( -2 );               // return with Not Ack error condition   
    }
  }

    
  StopI2C1();                      // send STOP condition
  while ( PEN );      // wait until stop condition is over 
  if ( BCL1IF )           // test for bus collision
  {
    return ( -1 );                // return with Bus Collision error 
  }
  return ( 0 );                   // return with no error
}


unsigned int EECurrentAddRead1( unsigned char control )
{
  while ((SSP1CON2 & 0x1F) | (R_W));                      // ensure module is idle
  SEN=1;                     // initiate START condition
  while ( SEN );      // wait until start condition is over 
  if ( BCL1IF )           // test for bus collision
  {
    return ( -1 );                 // return with Bus Collision error 
  }
  else
  {
    if ( WriteI2C1( control ) )    // write byte - R/W bit should be 0
    {
	  StopI2C1();  
      return ( -3 );               // set error for write collision
    }

    
    if ( !ACKSTAT )   // test for ACK condition received
    { 
      RCEN = 1;       // enable master for 1 byte reception
      while ( RCEN ); // check that receive sequence is over
      NotAckI2C1();                // send NOT ACK condition
      while ( ACKEN );// wait until ACK sequence is over                        
      StopI2C1();                  // send STOP condition
      while ( PEN );  // wait until stop condition is over 
      if ( BCL1IF )       // test for bus collision
      {
        return ( -1 );             // return with Bus Collision error 
      }
    }
    else
    {
	  StopI2C1();  
      return ( -2 );               // return with Not Ack error condition
    }
  }
  return ( (unsigned int) SSP1BUF ); // return with contents of SSP1BUF
}



unsigned char EEPageWrite1( unsigned char control, unsigned char address, unsigned char *wrptr,unsigned char len )
{
  while ((SSP1CON2 & 0x1F) | (R_W));                      // ensure module is idle
  SEN=1;                    // initiate START condition
  while ( SEN );      // wait until start condition is over 
  if ( BCL1IF )           // test for bus collision
  {
    return ( -1 );                 // return with Bus Collision error 
  }
  else
  {
    if ( WriteI2C1( control ) )    // write 1 byte - R/W bit should be 0
    {
	  StopI2C1();  
      return ( -3 );               // return with write collision error
    }

 
    if ( !ACKSTAT )   // test for ACK condition, if received 
    { 
      if ( WriteI2C1( address ) )  // write address byte to EEPROM
      {
	    StopI2C1();  
        return ( -3 );             // return with write collision error
      }

      
      if ( !ACKSTAT ) // test for ACK condition, if received
      {
        if ( putsI2C1( wrptr,len ) )
        {
		  StopI2C1();  
          return( -4 );            // bus device responded possible error
        }
      }
      else
      {
	    StopI2C1();  
        return ( -2 );             // return with Not Ack error
      }
    }
    else
    {
	  StopI2C1();  
      return ( -2 );               // return with Not Ack error
    }
  }

  
  StopI2C1();                      // send STOP condition
  while ( PEN );      // wait until stop condition is over 
  if ( BCL1IF )           // test for Bus collision
  {
    return ( -1 );                 // return with Bus Collision error 
  }
  return ( 0 );                    // return with no error
}


unsigned int EERandomRead1( unsigned char control, unsigned char address )
{
  while ((SSP1CON2 & 0x1F) | (R_W));                      // ensure module is idle
  SEN=1;                     // initiate START condition
  while ( SEN );      // wait until start condition is over 
  if ( BCL1IF )           // test for bus collision
  {
    return ( -1 );                 // return with Bus Collision error 
  }
  else
  {
    if ( WriteI2C1( control ) )    // write 1 byte
    {
	  StopI2C1();  
      return ( -3 );               // return with write collision error
    }

   
    if ( !ACKSTAT )   // test for ACK condition, if received
    {
      if ( WriteI2C1( address ) )  // WRITE word address for EEPROM
      {
	    StopI2C1();  
        return ( -3 );             // return with write collision error
      }

      
      if ( !ACKSTAT ) // test for ACK condition, if received
      {
        RestartI2C1();             // generate I2C1 bus restart condition
        while ( RSEN );// wait until re-start condition is over 
        if ( BCL1IF )     // test for bus collision
        {
          return ( -1 );           // return with Bus Collision error 
        }
                          
        if ( WriteI2C1( control+1 ))// write 1 byte - R/W bit should be 1
        {
		  StopI2C1();  
          return ( -3 );           // return with write collision error
        }

        
        if ( !ACKSTAT )// test for ACK condition, if received
        {
          RCEN = 1;       // enable master for 1 byte reception
          while ( RCEN ); // check that receive sequence is over
          NotAckI2C1();              // send ACK condition
          while ( ACKEN ); // wait until ACK sequence is over 
          StopI2C1();              // send STOP condition
          while ( PEN ); // wait until stop condition is over 
          if ( BCL1IF )   // test for bus collision
          {
           return ( -1 );          // return with Bus Collision error 
          }
        }
        else
        {
		  StopI2C1();  
          return ( -2 );           // return with Not Ack error
        }

      }
      else
      {
	    StopI2C1();   
        return ( -2 );             // return with Not Ack error
      }
    }
    else
    {
	  StopI2C1();  
      return ( -2 );               // return with Not Ack error
    }
  }
  return ( (unsigned int) SSP1BUF ); // return with data
}

unsigned char EESequentialRead1( unsigned char control, unsigned char address, unsigned char *rdptr, unsigned char length )
{
  while ((SSP1CON2 & 0x1F) | (R_W));                      // ensure module is idle
  NOP();
  SEN=1;                   // initiate START condition
  while ( SEN );      // wait until start condition is over 
  if ( BCL1IF )           // test for bus collision
  {
	  BCL1IF = 0;
    return ( -1 );                 // return with Bus Collision error 
  }
  else
  {
    if ( WriteI2C1( control ) )    // write 1 byte 
    {
	  StopI2C1();  
      return ( -3 );               // set error for write collision
    }

    
    if ( !ACKSTAT )   // test for ACK condition, if received
    {
      if ( WriteI2C1( address ) )  // WRITE word address to EEPROM
      {
	    StopI2C1();  
        return ( -3 );             // return with write collision error
      }
 
      
      if ( !ACKSTAT ) // test for ACK condition received
      {
        RestartI2C1();             // generate I2C bus restart condition
        while ( RSEN );  // wait until re-start condition is over 
        if ( WriteI2C1( control +1 ) )// WRITE 1 byte - R/W bit should be 1 for read
        {
		  StopI2C1();  
          return ( -3 );           // set error for write collision
        }
      
        
        if ( !ACKSTAT )// test for ACK condition received
        {
          if ( getsI2C1( rdptr, length ) )// read in multiple bytes
          {
            return ( -1 );         // return with Bus Collision error
          }

          NotAckI2C1();            // send not ACK condition
          while ( ACKEN );// wait until ACK sequence is over 
          StopI2C1();              // send STOP condition
          while ( PEN );// wait until stop condition is over 
          if ( BCL1IF )   // test for bus collision
          {
            return ( -1 );         // return with Bus Collision error 
          }
        }
        else
        {
		  StopI2C1();  
          return ( -2 );           // return with Not Ack error
        }
      }
      else
      {
	    StopI2C1();  
        return ( -2 );             // return with Not Ack error
      } 
    }
    else
    {
	  StopI2C1();  
      return ( -2 );               // return with Not Ack error
    }
  }
  return ( 0 );                    // return with no error
}


unsigned char getsI2C1( unsigned char *rdptr, unsigned char length )
{
    while ( length-- )            // perform getcI2C1() for 'length' number of bytes
    {
      *rdptr++ = getcI2C1();       // save byte received
      while ( RCEN ); // check that receive sequence is over    

      if ( BCL1IF )       // test for bus collision
      {
        return ( -1 );             // return with Bus Collision error 
      }

	  
	if( ((SSP1CON1&0x0F)==0x08) || ((SSP1CON1&0x0F)==0x0B) )	//master mode only
	{	
      if ( length )               // test if 'length' bytes have been read
      {
        ACKDT = 0;    // set acknowledge bit state for ACK        
        ACKEN = 1;    // initiate bus acknowledge sequence
        while ( ACKEN ); // wait until ACK sequence is over 
      } 
	} 
	  
    }
    return ( 0 );                  // last byte received so don't send ACK      
}






void OpenI2C1( unsigned char sync_mode, unsigned char slew )
{
  SSP1STAT &= 0x3F;                // power on state 
  SSP1CON1 = 0x00;                 // power on state
  SSP1CON2 = 0x00;                 // power on state
  SSP1CON1 |= sync_mode;           // select serial mode 
  SSP1STAT |= slew;                // slew rate on/off 

  I2C1_SCL = 1;               // Set SCL1 (PORTC,3) pin to input
  I2C1_SDA = 1;               // Set SDA1 (PORTC,4) pin to input

  SSP1CON1 |= SSPENB;              // enable synchronous serial port 
}


unsigned char putsI2C1( unsigned char *wrptr,unsigned char len )
{
   auto unsigned char temp;  
	while ( len-- )                 // transmit data until null character 
  {
    if ( SSPM3 )      // if Master transmitter then execute the following
    {
	  temp = putcI2C1 ( *wrptr );
	  if (temp ) return ( temp );   	
                         // terminate putsI2C1() function
    }

    else                           // else Slave transmitter
    {
      SSP1IF = 0;         // reset SSP1IF bit
      SSP1BUF = *wrptr;            // load SSP1BUF with new data
      CKP = 1;        // release clock line 
      while ( !SSP1IF );  // wait until ninth clock pulse received

      if ( ( CKP ) && ( !BF ) )// if R/W=0 and BF=0, NOT ACK was received
      {
        return ( -2 );             // terminate PutsI2C1() function
      }
    }

  wrptr ++;                        // increment pointer

  }                                // continue data writes until null character

  return ( 0 );
}


unsigned char ReadI2C1( void )
{

if( ((SSP1CON1&0x0F)==0x08) || ((SSP1CON1&0x0F)==0x0B) )	//master mode only
  RCEN = 1;           // enable master for 1 byte reception
  while ( !BF );      // wait until byte received  
  return ( SSP1BUF );              // return with read byte 
}







unsigned char WriteI2C1( unsigned char data_out )
{
  SSP1BUF = data_out;           // write single byte to SSP1BUF
  if ( WCOL )      // test if write collision occurred
    return ( -1 );              // if WCOL bit is set return negative #
  else
  {
    if( ((SSP1CON1&0x0F)!=0x08) && ((SSP1CON1&0x0F)!=0x0B) )	//slave mode only 
	{
      CKP = 1;        // release clock line 
      while ( !SSP1IF );  // wait until ninth clock pulse received

      if ( ( !R_W ) && ( !BF ) )// if R/W=0 and BF=0, NOT ACK was received
      {
        return ( -2 );             //Return NACK
      }	
	  else return(0);				//Return ACK
	
    }
	else if( ((SSP1CON1&0x0F)==0x08) || ((SSP1CON1&0x0F)==0x0B) )	//master mode only	
	{
		while( BF );   // wait until write cycle is complete      
		while ((SSP1CON2 & 0x1F) | (R_W));                  // ensure module is idle
	    if ( ACKSTAT ) // test for ACK condition received
	    	 return ( -2 );				//Return NACK	
		else return ( 0 );               //Return ACK
	}
	else return (0);
  }
}
