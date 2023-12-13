#ifndef _SYS_H_
#define _SYS_H_

void sys_init(void);
void interupt_init(void);
void interrupt isr(void);
void system_value_init(void);
#if defined(USE_LIGHTING_MODE)
void lighting_cotrol(void);
void lighting_init(void);
#endif

#if defined(USE_LIGHTING_MODE2)
void lighting_cotrol2(void);
void lighting_init2(void);
#endif


#define LIGHTING_DIR			TRISC2



#define LIGHTING_DEFAULT_DUTY	1024

#define delay_ms __delay_ms

#endif
