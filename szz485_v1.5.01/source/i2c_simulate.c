   



 #include "include.h"

 
 //sbit Sda=P1^2; //定义总线连接端口
 //sbit Scl=P1^1;


 void mDelay(unsigned char j)//A normal delay
 {
  unsigned int i;
  for(;j>0;j--)
     {
	  for(i=0;i<125;i++)
	     {;}
	  }
  }

  //启动 IIC总线
  void Start(void)
  {
	  SDA_DIR = 0;
	  SCL_DIR = 0;
   Sda=1;
   NOP();NOP();
   Scl=1;
   NOP();NOP();NOP();NOP();NOP();
   Sda=0;
   NOP();NOP();NOP();NOP();NOP();
   Scl=0;
  }

  //停止 IIC总线
  void Stop(void)
  {
	  SDA_DIR = 0;
	  SCL_DIR = 0;
   Sda=0;
   NOP();
   Scl=1;
   NOP();NOP();NOP();NOP();NOP();
   Sda=1;
   NOP();NOP();NOP();NOP();NOP();
   Scl=0;
   }

   //应答 IIC总线
   void Ack(void)
   {
	   SDA_DIR = 0;
	  SCL_DIR = 0;
    Sda=0;
	NOP();NOP();NOP();
	Scl=1;
	NOP();NOP();NOP();NOP();NOP();
	Scl=0;
	NOP();NOP();
	}

	//非应答 IIC总线
	void NoAck(void)
	{
		SDA_DIR = 0;
	  SCL_DIR = 0;
	 Sda=1;
	 NOP();NOP();NOP();
	 Scl=1;
	 NOP();NOP();NOP();NOP();NOP();
	 Scl=0;
	 NOP();NOP();
	 }

	 //发送一个字节
	 void Send(unsigned char Data)
	 { 
	  unsigned char BitCounter=8;
	  unsigned char temp;
	
	SDA_DIR = 0;
	  SCL_DIR = 0;
	  do
	    {
		 temp=Data;
		 Scl=0;
		 NOP();NOP();NOP();NOP();NOP();
		 if((temp&0x80)==0x80)
		    Sda=1;
		 else
		    Sda=0;


			Scl=1;
			temp=Data<<1;
			Data=temp;
			BitCounter--;
		  }
	  while(BitCounter);
	      Scl=0;
	  }

	  //读一个字节并返回变量
	  unsigned char Read(void)
	  {
	   unsigned char temp=0;
	   unsigned char temp1=0;
	   unsigned char BitCounter=8;
		SDA_DIR = 1;
	  SCL_DIR = 0;
	   //Sda=1;
	   do
	     {
		  Scl=0;
          NOP();NOP();NOP();NOP();NOP();
		  Scl=1;
		  NOP();NOP();NOP();NOP();NOP();
		  if(Sda)
		     temp=temp|0x01;
		  else
		     temp=temp&0xfe;

		  if(BitCounter-1)
		     {
			  temp1=temp<<1;
			  temp=temp1;
			  }
			  BitCounter--;
			 }
		while(BitCounter);
		return(temp);
	  }
    //write to ROM
	  void WrToROM(unsigned char Data[],unsigned char Address,unsigned char Num)
	  {
	   unsigned char i;
	   unsigned char *PData;
	   PData=Data;
	   SDA_DIR = 0;
	  SCL_DIR = 0;
	   for(i=0;i<Num;i++)
	      {
		   Start();
		   Send(AddWr);//Write Address
		   Ack();
		   Send(Address+i);//Write sub Address
		   Ack();
		   Send(*(PData+i));//Write Data
		   Ack();
		   Stop();
		   mDelay(20);
		   }
	   }
   //read from ROM
	  void RdFromROM(unsigned char Data[],unsigned char Address,unsigned char Num)
	  {
	   unsigned char i;
	   unsigned char *PData;
	   PData=Data;
       for(i=0;i<Num;i++)
	      {
		   Start();
		   Send(AddWr);//Write Address
		   Ack();
 		   Send(Address+i);//Write sub Address
		   Ack();
		   Start();
		   Send(AddRd);//Read Address
		   Ack();
		   *(PData+i)=Read();//Read Data
		   Scl=0;
		   NoAck();
		   Stop();
		   }
	  }

	void main_init(void)
	{
	 unsigned char Number[10]={0x3f,0x06,0x5b,0x4f,0x66,0x6d,0x7d,0x07,0x7f,0x6f};// 显示码值 1234
	 unsigned char i;

	 
	 
	 WrToROM(Number,4,10);//写入24c02
	 mDelay(200);

    delete(Number);
	 RdFromROM(Number,4,10);//调用存储数据
	 

	}


