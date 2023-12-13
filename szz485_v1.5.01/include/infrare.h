
#ifndef infrare_h
#define infrare_h

#define Address_L  				0x10
#define Address_H  				0xED
#define IR_PIN_DIR    			TRISB3  //定义红外接收引脚
#define IR_PIN    				RB3  //定义红外接收引脚
#define IR_IOCB    				IOCB3  //定义红外接收引脚

#define BEE      				RB3  //蜂鸣器

#define	IR_NUM1					0x1a
#define	IR_NUM2					0x5B
#define	IR_NUM3					0x5E
#define	IR_NUM4					0x5A
#define	IR_NUM5					0x1E
#define	IR_NUM6					0x59
#define	IR_NUM7					0x02
#define	IR_NUM8					0x5D
#define	IR_NUM9					0x07
#define	IR_NUM0					0x09

#define	IR_FUNCTION1			0x0a
#define	IR_FUNCTION2			0x01
#define	IR_LEFT					0x45
#define	IR_RIGHT				0x03
#define	IR_CANCEL				0x05
#define	IR_CONFIRM				0x06






extern unsigned char Ir_order1,Ir_order2;
extern unsigned char Ir_Code,Ir_wait;

void infrare(void);
void ir_operation(void);

void ir_init(void);


#endif