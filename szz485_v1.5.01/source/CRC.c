
#define uchar unsigned char 
#define uint unsigned short int
unsigned short int calccrc(unsigned char crcbuf,unsigned short int crc)
{
	unsigned char i,chk;
	crc=crc ^ crcbuf;
	for(i=0;i<8;i++)
	{
		chk=crc&1;
		crc=crc>>1;	
		crc=crc&0x7fff;
		if (chk==1)
		{
			crc=crc^0xa001;
		}	
		crc=crc&0xffff;
	}
	
	return crc;
}
//*
unsigned short int MakeCRC16(unsigned char *buf,unsigned char len)
{
	uchar hi,lo;
	uint i;
	uint crc;
	crc=0xFFFF;
	for (i=0;i<len;i++)
	{
		crc=calccrc(*buf,crc);
		buf++;
	}
	hi=crc%256;
	lo=crc/256;
	crc=((uint)hi<<8)|lo;
	return crc;
}

//*/