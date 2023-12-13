#ifndef __DELAY_H_
#define __DELAY_H_

#define _XTAL_FREQ 8000000

#pragma inline(_delay)
extern void _delay(unsigned long);
// NOTE: To use the macros below, YOU must have previously defined _XTAL_FREQ
#define __delay_us(x) _delay((unsigned long)((x)*(_XTAL_FREQ/4000000.0)))
#define __delay_ms(x) _delay((unsigned long)((x)*(_XTAL_FREQ/4000.0)))

#endif