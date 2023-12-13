opt subtitle "HI-TECH Software Omniscient Code Generator (Lite mode) build 6738"

opt pagewidth 120

	opt lm

	processor	16F883
clrc	macro
	bcf	3,0
	endm
clrz	macro
	bcf	3,2
	endm
setc	macro
	bsf	3,0
	endm
setz	macro
	bsf	3,2
	endm
skipc	macro
	btfss	3,0
	endm
skipz	macro
	btfss	3,2
	endm
skipnc	macro
	btfsc	3,0
	endm
skipnz	macro
	btfsc	3,2
	endm
indf	equ	0
indf0	equ	0
pc	equ	2
pcl	equ	2
status	equ	3
fsr	equ	4
fsr0	equ	4
c	equ	1
z	equ	0
pclath	equ	10
# 83 "E:\Projects\COLOCK\Master_sub_slock\yzj\programe_updata\SZZ485_V1.4\source\main.c"
	psect config,class=CONFIG,delta=2 ;#
# 83 "E:\Projects\COLOCK\Master_sub_slock\yzj\programe_updata\SZZ485_V1.4\source\main.c"
	dw 0x3FFA & 0x3FFF & 0x3FFF & 0x3FFF & 0x3FBF & 0x3F7F& 0x3FFF& 0x3BFF& 0x37FF & 0x2FFF &0x1FFF ;#
	FNCALL	_main,_interupt_init
	FNCALL	_main,_system_value_init
	FNCALL	_main,_timer1_init
	FNCALL	_main,_ds3231_init
	FNCALL	_main,_usart_init
	FNCALL	_main,_get_time
	FNCALL	_main,_lcd_init
	FNCALL	_main,_timer2_init
	FNCALL	_main,_MakeCRC16
	FNCALL	_main,___lwmod
	FNCALL	_main,_putch
	FNCALL	_main,_settime
	FNCALL	_main,_calc_zone
	FNCALL	_main,_date_dec
	FNCALL	_main,_date_add
	FNCALL	_main,_time_add
	FNCALL	_main,___awmod
	FNCALL	_main,___awdiv
	FNCALL	_main,_up_time1
	FNCALL	_main,_up_time2
	FNCALL	_lcd_init,___awmod
	FNCALL	_lcd_init,___awdiv
	FNCALL	_lcd_init,_up_time1
	FNCALL	_lcd_init,_up_time2
	FNCALL	_up_time2,_up_date
	FNCALL	_up_time2,_settime
	FNCALL	_up_time2,_seg_disp
	FNCALL	_up_time1,_up_date
	FNCALL	_up_time1,_settime
	FNCALL	_up_time1,_seg_disp
	FNCALL	_up_date,_seg_disp
	FNCALL	_up_date,_latch_rclk
	FNCALL	_settime,_dec_hex
	FNCALL	_settime,_writebyte
	FNCALL	_get_time,_readbyte
	FNCALL	_get_time,_writebyte
	FNCALL	_get_time,_hex_dec
	FNCALL	_get_time,_calc_zone
	FNCALL	_ds3231_init,_readbyte
	FNCALL	_ds3231_init,_writebyte
	FNCALL	_date_dec,_isleap
	FNCALL	_date_add,_isleap
	FNCALL	_MakeCRC16,_calccrc
	FNCALL	_seg_disp,_shift_srclk
	FNCALL	_dec_hex,___awmod
	FNCALL	_dec_hex,___awdiv
	FNCALL	_hex_dec,___awdiv
	FNCALL	_hex_dec,___bmul
	FNCALL	_writebyte,_start_i2c
	FNCALL	_writebyte,_i2c_send
	FNCALL	_writebyte,_waitack_i2c
	FNCALL	_readbyte,_start_i2c
	FNCALL	_readbyte,_i2c_send
	FNCALL	_readbyte,_waitack_i2c
	FNCALL	_readbyte,_i2c_read
	FNCALL	_readbyte,_sendnotack_i2c
	FNCALL	_usart_init,_id_code
	FNCALL	_isleap,___lwmod
	FNROOT	_main
	FNCALL	_isr,_timer1_isr
	FNCALL	_isr,_usart_isr
	FNCALL	_isr,_timer2_isr
	FNCALL	intlevel1,_isr
	global	intlevel1
	FNROOT	intlevel1
	global	_months
psect	idataBANK2,class=CODE,space=0,delta=2
global __pidataBANK2
__pidataBANK2:
	file	"E:\Projects\COLOCK\Master_sub_slock\yzj\programe_updata\SZZ485_V1.4\source\sys.c"
	line	17

;initializer for _months
	retlw	0
	retlw	01Fh
	retlw	01Ch
	retlw	01Fh
	retlw	01Eh
	retlw	01Fh
	retlw	01Eh
	retlw	01Fh
	retlw	01Fh
	retlw	01Eh
	retlw	01Fh
	retlw	01Eh
	retlw	01Fh
	global	_SEG_CODE1
psect	strings,class=STRING,delta=2
global __pstrings
__pstrings:
;	global	stringdir,stringtab,__stringbase
stringtab:
;	String table - string pointers are 1 byte each
stringcode:stringdir:
movlw high(stringdir)
movwf pclath
movf fsr,w
incf fsr
	addwf pc
__stringbase:
	retlw	0
psect	strings
	file	"E:\Projects\COLOCK\Master_sub_slock\yzj\programe_updata\SZZ485_V1.4\source\led.c"
	line	24
_SEG_CODE1:
	retlw	0FCh
	retlw	060h
	retlw	0DAh
	retlw	0F2h
	retlw	066h
	retlw	0B6h
	retlw	0BEh
	retlw	0E0h
	retlw	0FEh
	retlw	0F6h
	retlw	0
	global	_SEG_CODE2
psect	strings
	file	"E:\Projects\COLOCK\Master_sub_slock\yzj\programe_updata\SZZ485_V1.4\source\led.c"
	line	39
_SEG_CODE2:
	retlw	0FCh
	retlw	060h
	retlw	0DAh
	retlw	0F2h
	retlw	066h
	retlw	0B6h
	retlw	0BEh
	retlw	0E0h
	retlw	0FEh
	retlw	0F6h
	retlw	0
	global	_ONE_DP
psect	strings
	file	"E:\Projects\COLOCK\Master_sub_slock\yzj\programe_updata\SZZ485_V1.4\source\led.c"
	line	51
_ONE_DP:
	retlw	01h
	global	_TWO_DP
psect	strings
	file	"E:\Projects\COLOCK\Master_sub_slock\yzj\programe_updata\SZZ485_V1.4\source\led.c"
	line	61
_TWO_DP:
	retlw	01h
	global	_SEG_CODE1
	global	_SEG_CODE2
	global	_ONE_DP
	global	_TWO_DP
	global	_disp_rxd_length
	global	_flag_jiaoshi
	global	_my_id_code
	global	_timer1_cnt
	global	_up_date_flag
	global	up_time1@copy_display_mode_state
	global	up_time1@count
	global	up_time1@display_mode_state
	global	up_time2@copy_display_mode_state
	global	up_time2@count
	global	up_time2@display_mode_state
	global	_flag_dian1
	global	_flag_dian2
	global	_flag_usart_start
	global	_up_time_flag
	global	_usart_count
	global	_usart_timer_cnt
	global	_rx_udata
	global	_copy_old_date
	global	_copy_old_time
	global	_ntp_info
	global	_flag_data_process
	global	_jiaoshi_cnt
	global	_timer2_cnt
	global	_up_led_display
	global	main@save_time_cnt
	global	up_time1@copy_flag_dian
	global	up_time2@copy_flag_dian
	global	_old_time
	global	_tx_udata
	global	_copy_rx_udata
	global	_disp_data_time
	global	_CCP1CON
_CCP1CON	set	23
	global	_CCP2CON
_CCP2CON	set	29
	global	_INTCON
_INTCON	set	11
	global	_RCREG
_RCREG	set	26
	global	_RCSTA
_RCSTA	set	24
	global	_TMR1H
_TMR1H	set	15
	global	_TMR1L
_TMR1L	set	14
	global	_TMR2
_TMR2	set	17
	global	_TXREG
_TXREG	set	25
	global	_CREN
_CREN	set	196
	global	_GIE
_GIE	set	95
	global	_OERR
_OERR	set	193
	global	_PEIE
_PEIE	set	94
	global	_RA0
_RA0	set	40
	global	_RA1
_RA1	set	41
	global	_RA2
_RA2	set	42
	global	_RA3
_RA3	set	43
	global	_RA4
_RA4	set	44
	global	_RA5
_RA5	set	45
	global	_RB0
_RB0	set	48
	global	_RB1
_RB1	set	49
	global	_RB2
_RB2	set	50
	global	_RB4
_RB4	set	52
	global	_RB5
_RB5	set	53
	global	_RB6
_RB6	set	54
	global	_RB7
_RB7	set	55
	global	_RC0
_RC0	set	56
	global	_RC1
_RC1	set	57
	global	_RC2
_RC2	set	58
	global	_RC3
_RC3	set	59
	global	_RC4
_RC4	set	60
	global	_RC5
_RC5	set	61
	global	_RCIF
_RCIF	set	101
	global	_T1CKPS0
_T1CKPS0	set	132
	global	_T1CKPS1
_T1CKPS1	set	133
	global	_T1OSCEN
_T1OSCEN	set	131
	global	_T2CKPS0
_T2CKPS0	set	144
	global	_T2CKPS1
_T2CKPS1	set	145
	global	_TMR1CS
_TMR1CS	set	129
	global	_TMR1GE
_TMR1GE	set	134
	global	_TMR1IF
_TMR1IF	set	96
	global	_TMR1ON
_TMR1ON	set	128
	global	_TMR2IF
_TMR2IF	set	97
	global	_TMR2ON
_TMR2ON	set	146
	global	_TOUTPS0
_TOUTPS0	set	147
	global	_TOUTPS1
_TOUTPS1	set	148
	global	_TOUTPS2
_TOUTPS2	set	149
	global	_TOUTPS3
_TOUTPS3	set	150
	global	_TXIF
_TXIF	set	100
	global	_SPBRG
_SPBRG	set	153
	global	_TXSTA
_TXSTA	set	152
	global	_PSA
_PSA	set	1035
	global	_RCIE
_RCIE	set	1125
	global	_TMR1IE
_TMR1IE	set	1120
	global	_TMR2IE
_TMR2IE	set	1121
	global	_TRISA0
_TRISA0	set	1064
	global	_TRISA1
_TRISA1	set	1065
	global	_TRISA2
_TRISA2	set	1066
	global	_TRISA3
_TRISA3	set	1067
	global	_TRISA4
_TRISA4	set	1068
	global	_TRISA5
_TRISA5	set	1069
	global	_TRISB0
_TRISB0	set	1072
	global	_TRISB1
_TRISB1	set	1073
	global	_TRISB2
_TRISB2	set	1074
	global	_TRISB4
_TRISB4	set	1076
	global	_TRISB5
_TRISB5	set	1077
	global	_TRISB6
_TRISB6	set	1078
	global	_TRISB7
_TRISB7	set	1079
	global	_TRISC0
_TRISC0	set	1080
	global	_TRISC1
_TRISC1	set	1081
	global	_TRISC2
_TRISC2	set	1082
	global	_TRISC3
_TRISC3	set	1083
	global	_TRISC4
_TRISC4	set	1084
	global	_TRISC5
_TRISC5	set	1085
	global	_TRISC6
_TRISC6	set	1086
	global	_TRISC7
_TRISC7	set	1087
	global	_TRMT
_TRMT	set	1217
	global	_EEADR
_EEADR	set	269
	global	_EEDAT
_EEDAT	set	268
	global	_WDTPS0
_WDTPS0	set	2089
	global	_WDTPS1
_WDTPS1	set	2090
	global	_WDTPS2
_WDTPS2	set	2091
	global	_WDTPS3
_WDTPS3	set	2092
	global	_ANSEL
_ANSEL	set	392
	global	_ANSELH
_ANSELH	set	393
	global	_EECON2
_EECON2	set	397
	global	_EEPGD
_EEPGD	set	3175
	global	_RD
_RD	set	3168
	global	_WR
_WR	set	3169
	global	_WREN
_WREN	set	3170
	global	_old_date
psect	nvBANK1,class=BANK1,space=1
global __pnvBANK1
__pnvBANK1:
_old_date:
       ds      4

	file	"SZZ485_V1.4.as"
	line	#
psect cinit,class=CODE,delta=2
global start_initialization
start_initialization:

psect	bssCOMMON,class=COMMON,space=1
global __pbssCOMMON
__pbssCOMMON:
_flag_dian1:
       ds      1

_flag_dian2:
       ds      1

_flag_usart_start:
       ds      1

_up_time_flag:
       ds      1

_usart_count:
       ds      1

_usart_timer_cnt:
       ds      1

psect	bssBANK0,class=BANK0,space=1
global __pbssBANK0
__pbssBANK0:
_disp_rxd_length:
       ds      1

_flag_jiaoshi:
       ds      1

_my_id_code:
       ds      1

_timer1_cnt:
       ds      1

_up_date_flag:
       ds      1

up_time1@copy_display_mode_state:
       ds      1

up_time1@count:
       ds      1

up_time1@display_mode_state:
       ds      1

up_time2@copy_display_mode_state:
       ds      1

up_time2@count:
       ds      1

up_time2@display_mode_state:
       ds      1

_old_time:
       ds      3

psect	bssBANK1,class=BANK1,space=1
global __pbssBANK1
__pbssBANK1:
_rx_udata:
       ds      17

_copy_old_date:
       ds      4

_copy_old_time:
       ds      3

_ntp_info:
       ds      3

_flag_data_process:
       ds      1

_jiaoshi_cnt:
       ds      1

_timer2_cnt:
       ds      1

_up_led_display:
       ds      1

main@save_time_cnt:
       ds      1

up_time1@copy_flag_dian:
       ds      1

up_time2@copy_flag_dian:
       ds      1

_tx_udata:
       ds      20

_copy_rx_udata:
       ds      17

_disp_data_time:
       ds      4

psect	dataBANK2,class=BANK2,space=1
global __pdataBANK2
__pdataBANK2:
	file	"E:\Projects\COLOCK\Master_sub_slock\yzj\programe_updata\SZZ485_V1.4\source\sys.c"
	line	17
_months:
       ds      13

psect clrtext,class=CODE,delta=2
global clear_ram
;	Called with FSR containing the base address, and
;	W with the last address+1
clear_ram:
	clrwdt			;clear the watchdog before getting into this loop
clrloop:
	clrf	indf		;clear RAM location pointed to by FSR
	incf	fsr,f		;increment pointer
	xorwf	fsr,w		;XOR with final address
	btfsc	status,2	;have we reached the end yet?
	retlw	0		;all done for this memory range, return
	xorwf	fsr,w		;XOR again to restore value
	goto	clrloop		;do the next byte

; Clear objects allocated to COMMON
psect cinit,class=CODE,delta=2
	movlw	low(__pbssCOMMON)
	movwf	fsr
	movlw	low((__pbssCOMMON)+06h)
	fcall	clear_ram
; Clear objects allocated to BANK0
psect cinit,class=CODE,delta=2
	bcf	status, 7	;select IRP bank0
	movlw	low(__pbssBANK0)
	movwf	fsr
	movlw	low((__pbssBANK0)+0Eh)
	fcall	clear_ram
; Clear objects allocated to BANK1
psect cinit,class=CODE,delta=2
	movlw	low(__pbssBANK1)
	movwf	fsr
	movlw	low((__pbssBANK1)+04Bh)
	fcall	clear_ram
global btemp
psect inittext,class=CODE,delta=2
global init_fetch,btemp
;	Called with low address in FSR and high address in W
init_fetch:
	movf btemp,w
	movwf pclath
	movf btemp+1,w
	movwf pc
global init_ram
;Called with:
;	high address of idata address in btemp 
;	low address of idata address in btemp+1 
;	low address of data in FSR
;	high address + 1 of data in btemp-1
init_ram:
	fcall init_fetch
	movwf indf,f
	incf fsr,f
	movf fsr,w
	xorwf btemp-1,w
	btfsc status,2
	retlw 0
	incf btemp+1,f
	btfsc status,2
	incf btemp,f
	goto init_ram
; Initialize objects allocated to BANK2
psect cinit,class=CODE,delta=2
global init_ram, __pidataBANK2
	bsf	status, 7	;select IRP bank2
	movlw low(__pdataBANK2+13)
	movwf btemp-1,f
	movlw high(__pidataBANK2)
	movwf btemp,f
	movlw low(__pidataBANK2)
	movwf btemp+1,f
	movlw low(__pdataBANK2)
	movwf fsr,f
	fcall init_ram
psect cinit,class=CODE,delta=2
global end_of_initialization

;End of C runtime variable initialization code

end_of_initialization:
clrf status
ljmp _main	;jump to C main() function
psect	cstackBANK2,class=BANK2,space=1
global __pcstackBANK2
__pcstackBANK2:
	global	main@calc_chk_value
main@calc_chk_value:	; 2 bytes @ 0x0
	ds	2
	global	main@flag_save_data
main@flag_save_data:	; 1 bytes @ 0x2
	ds	1
	global	main@copy_func
main@copy_func:	; 2 bytes @ 0x3
	ds	2
	global	main@flag_temp
main@flag_temp:	; 1 bytes @ 0x5
	ds	1
	global	main@len_cnt
main@len_cnt:	; 1 bytes @ 0x6
	ds	1
	global	_main$5113
_main$5113:	; 2 bytes @ 0x7
	ds	2
	global	main@flag_send_data
main@flag_send_data:	; 1 bytes @ 0x9
	ds	1
	global	main@j
main@j:	; 1 bytes @ 0xA
	ds	1
	global	main@func
main@func:	; 2 bytes @ 0xB
	ds	2
	global	main@chk_value
main@chk_value:	; 2 bytes @ 0xD
	ds	2
	global	main@i
main@i:	; 1 bytes @ 0xF
	ds	1
psect	cstackCOMMON,class=COMMON,space=1
global __pcstackCOMMON
__pcstackCOMMON:
	global	?_calc_zone
?_calc_zone:	; 0 bytes @ 0x0
	global	?_up_time1
?_up_time1:	; 0 bytes @ 0x0
	global	?_up_time2
?_up_time2:	; 0 bytes @ 0x0
	global	?_interupt_init
?_interupt_init:	; 0 bytes @ 0x0
	global	?_system_value_init
?_system_value_init:	; 0 bytes @ 0x0
	global	?_timer2_init
?_timer2_init:	; 0 bytes @ 0x0
	global	?_timer2_isr
?_timer2_isr:	; 0 bytes @ 0x0
	global	??_timer2_isr
??_timer2_isr:	; 0 bytes @ 0x0
	global	?_timer1_init
?_timer1_init:	; 0 bytes @ 0x0
	global	?_timer1_isr
?_timer1_isr:	; 0 bytes @ 0x0
	global	??_timer1_isr
??_timer1_isr:	; 0 bytes @ 0x0
	global	?_date_add
?_date_add:	; 0 bytes @ 0x0
	global	?_date_dec
?_date_dec:	; 0 bytes @ 0x0
	global	?_usart_init
?_usart_init:	; 0 bytes @ 0x0
	global	?_usart_isr
?_usart_isr:	; 0 bytes @ 0x0
	global	??_usart_isr
??_usart_isr:	; 0 bytes @ 0x0
	global	?_putch
?_putch:	; 0 bytes @ 0x0
	global	?_ds3231_init
?_ds3231_init:	; 0 bytes @ 0x0
	global	?_get_time
?_get_time:	; 0 bytes @ 0x0
	global	?_settime
?_settime:	; 0 bytes @ 0x0
	global	?_shift_srclk
?_shift_srclk:	; 0 bytes @ 0x0
	global	?_latch_rclk
?_latch_rclk:	; 0 bytes @ 0x0
	global	?_lcd_init
?_lcd_init:	; 0 bytes @ 0x0
	global	?_main
?_main:	; 0 bytes @ 0x0
	global	?_isr
?_isr:	; 0 bytes @ 0x0
	global	?_start_i2c
?_start_i2c:	; 0 bytes @ 0x0
	global	?_waitack_i2c
?_waitack_i2c:	; 0 bytes @ 0x0
	global	?_sendnotack_i2c
?_sendnotack_i2c:	; 0 bytes @ 0x0
	global	?_i2c_send
?_i2c_send:	; 0 bytes @ 0x0
	global	?_id_code
?_id_code:	; 1 bytes @ 0x0
	global	?_readbyte
?_readbyte:	; 1 bytes @ 0x0
	global	?_hex_dec
?_hex_dec:	; 1 bytes @ 0x0
	global	?_dec_hex
?_dec_hex:	; 1 bytes @ 0x0
	global	?_time_add
?_time_add:	; 1 bytes @ 0x0
	global	?_i2c_read
?_i2c_read:	; 1 bytes @ 0x0
	ds	1
	global	usart_isr@cbuffer
usart_isr@cbuffer:	; 1 bytes @ 0x1
	ds	1
	global	??_isr
??_isr:	; 0 bytes @ 0x2
	ds	4
psect	cstackBANK0,class=BANK0,space=1
global __pcstackBANK0
__pcstackBANK0:
	global	??_id_code
??_id_code:	; 0 bytes @ 0x0
	global	??_calc_zone
??_calc_zone:	; 0 bytes @ 0x0
	global	??_interupt_init
??_interupt_init:	; 0 bytes @ 0x0
	global	??_system_value_init
??_system_value_init:	; 0 bytes @ 0x0
	global	??_timer2_init
??_timer2_init:	; 0 bytes @ 0x0
	global	??_timer1_init
??_timer1_init:	; 0 bytes @ 0x0
	global	??_time_add
??_time_add:	; 0 bytes @ 0x0
	global	??_putch
??_putch:	; 0 bytes @ 0x0
	global	??_shift_srclk
??_shift_srclk:	; 0 bytes @ 0x0
	global	??_latch_rclk
??_latch_rclk:	; 0 bytes @ 0x0
	global	??_start_i2c
??_start_i2c:	; 0 bytes @ 0x0
	global	??_waitack_i2c
??_waitack_i2c:	; 0 bytes @ 0x0
	global	??_sendnotack_i2c
??_sendnotack_i2c:	; 0 bytes @ 0x0
	global	??_i2c_send
??_i2c_send:	; 0 bytes @ 0x0
	global	??_i2c_read
??_i2c_read:	; 0 bytes @ 0x0
	global	?_calccrc
?_calccrc:	; 2 bytes @ 0x0
	global	?___lwmod
?___lwmod:	; 2 bytes @ 0x0
	global	?___awmod
?___awmod:	; 2 bytes @ 0x0
	global	id_code@id
id_code@id:	; 1 bytes @ 0x0
	global	putch@byte
putch@byte:	; 1 bytes @ 0x0
	global	shift_srclk@flag
shift_srclk@flag:	; 1 bytes @ 0x0
	global	latch_rclk@flag
latch_rclk@flag:	; 1 bytes @ 0x0
	global	calccrc@crc
calccrc@crc:	; 2 bytes @ 0x0
	global	___lwmod@divisor
___lwmod@divisor:	; 2 bytes @ 0x0
	global	___awmod@divisor
___awmod@divisor:	; 2 bytes @ 0x0
	ds	1
	global	??_usart_init
??_usart_init:	; 0 bytes @ 0x1
	global	?_seg_disp
?_seg_disp:	; 0 bytes @ 0x1
	global	time_add@t
time_add@t:	; 1 bytes @ 0x1
	global	seg_disp@dp
seg_disp@dp:	; 1 bytes @ 0x1
	global	waitack_i2c@errtime
waitack_i2c@errtime:	; 1 bytes @ 0x1
	global	i2c_send@send_data
i2c_send@send_data:	; 1 bytes @ 0x1
	global	i2c_read@dat
i2c_read@dat:	; 1 bytes @ 0x1
	ds	1
	global	??_calccrc
??_calccrc:	; 0 bytes @ 0x2
	global	seg_disp@flag
seg_disp@flag:	; 1 bytes @ 0x2
	global	i2c_send@count
i2c_send@count:	; 1 bytes @ 0x2
	global	i2c_read@count
i2c_read@count:	; 1 bytes @ 0x2
	global	___lwmod@dividend
___lwmod@dividend:	; 2 bytes @ 0x2
	global	___awmod@dividend
___awmod@dividend:	; 2 bytes @ 0x2
	ds	1
	global	??_readbyte
??_readbyte:	; 0 bytes @ 0x3
	global	?_writebyte
?_writebyte:	; 0 bytes @ 0x3
	global	??_seg_disp
??_seg_disp:	; 0 bytes @ 0x3
	global	writebyte@data
writebyte@data:	; 1 bytes @ 0x3
	ds	1
	global	??_writebyte
??_writebyte:	; 0 bytes @ 0x4
	global	??___lwmod
??___lwmod:	; 0 bytes @ 0x4
	global	??___awmod
??___awmod:	; 0 bytes @ 0x4
	global	seg_disp@num
seg_disp@num:	; 1 bytes @ 0x4
	global	calccrc@crcbuf
calccrc@crcbuf:	; 1 bytes @ 0x4
	global	writebyte@address
writebyte@address:	; 1 bytes @ 0x4
	global	readbyte@address
readbyte@address:	; 1 bytes @ 0x4
	ds	1
	global	seg_disp@date
seg_disp@date:	; 1 bytes @ 0x5
	global	calccrc@chk
calccrc@chk:	; 1 bytes @ 0x5
	global	readbyte@recv_data
readbyte@recv_data:	; 1 bytes @ 0x5
	global	___lwmod@counter
___lwmod@counter:	; 1 bytes @ 0x5
	global	___awmod@counter
___awmod@counter:	; 1 bytes @ 0x5
	ds	1
	global	??_ds3231_init
??_ds3231_init:	; 0 bytes @ 0x6
	global	?_isleap
?_isleap:	; 1 bytes @ 0x6
	global	seg_disp@i
seg_disp@i:	; 1 bytes @ 0x6
	global	calccrc@i
calccrc@i:	; 1 bytes @ 0x6
	global	___awmod@sign
___awmod@sign:	; 1 bytes @ 0x6
	global	isleap@year
isleap@year:	; 2 bytes @ 0x6
	ds	1
	global	?_up_date
?_up_date:	; 0 bytes @ 0x7
	global	?_MakeCRC16
?_MakeCRC16:	; 2 bytes @ 0x7
	global	?___awdiv
?___awdiv:	; 2 bytes @ 0x7
	global	ds3231_init@ds3231_state
ds3231_init@ds3231_state:	; 1 bytes @ 0x7
	global	up_date@length
up_date@length:	; 1 bytes @ 0x7
	global	MakeCRC16@len
MakeCRC16@len:	; 1 bytes @ 0x7
	global	___awdiv@divisor
___awdiv@divisor:	; 2 bytes @ 0x7
	ds	1
	global	??_isleap
??_isleap:	; 0 bytes @ 0x8
	global	up_date@dian
up_date@dian:	; 1 bytes @ 0x8
	ds	1
	global	??_MakeCRC16
??_MakeCRC16:	; 0 bytes @ 0x9
	global	up_date@flag
up_date@flag:	; 1 bytes @ 0x9
	global	___awdiv@dividend
___awdiv@dividend:	; 2 bytes @ 0x9
	ds	1
	global	??_up_date
??_up_date:	; 0 bytes @ 0xA
	global	??_date_add
??_date_add:	; 0 bytes @ 0xA
	global	??_date_dec
??_date_dec:	; 0 bytes @ 0xA
	ds	1
	global	??___awdiv
??___awdiv:	; 0 bytes @ 0xB
	global	date_add@month_day
date_add@month_day:	; 1 bytes @ 0xB
	global	date_dec@t
date_dec@t:	; 1 bytes @ 0xB
	global	MakeCRC16@buf
MakeCRC16@buf:	; 1 bytes @ 0xB
	ds	1
	global	date_add@t
date_add@t:	; 1 bytes @ 0xC
	global	MakeCRC16@hi
MakeCRC16@hi:	; 1 bytes @ 0xC
	global	___awdiv@counter
___awdiv@counter:	; 1 bytes @ 0xC
	ds	1
	global	up_date@date
up_date@date:	; 1 bytes @ 0xD
	global	MakeCRC16@lo
MakeCRC16@lo:	; 1 bytes @ 0xD
	global	___awdiv@sign
___awdiv@sign:	; 1 bytes @ 0xD
	ds	1
	global	up_date@i
up_date@i:	; 1 bytes @ 0xE
	global	MakeCRC16@i
MakeCRC16@i:	; 2 bytes @ 0xE
	global	___awdiv@quotient
___awdiv@quotient:	; 2 bytes @ 0xE
	ds	2
	global	??_dec_hex
??_dec_hex:	; 0 bytes @ 0x10
	global	?___bmul
?___bmul:	; 1 bytes @ 0x10
	global	___bmul@multiplicand
___bmul@multiplicand:	; 1 bytes @ 0x10
	global	MakeCRC16@crc
MakeCRC16@crc:	; 2 bytes @ 0x10
	ds	1
	global	??___bmul
??___bmul:	; 0 bytes @ 0x11
	ds	1
	global	___bmul@product
___bmul@product:	; 1 bytes @ 0x12
	ds	1
	global	___bmul@multiplier
___bmul@multiplier:	; 1 bytes @ 0x13
	ds	1
	global	??_hex_dec
??_hex_dec:	; 0 bytes @ 0x14
	ds	1
	global	dec_hex@dec16
dec_hex@dec16:	; 1 bytes @ 0x15
	ds	1
	global	??_settime
??_settime:	; 0 bytes @ 0x16
	ds	1
	global	settime@write_time
settime@write_time:	; 7 bytes @ 0x17
	ds	1
	global	hex_dec@hex16
hex_dec@hex16:	; 1 bytes @ 0x18
	ds	1
	global	??_get_time
??_get_time:	; 0 bytes @ 0x19
	ds	1
	global	get_time@ds3231_time2
get_time@ds3231_time2:	; 7 bytes @ 0x1A
	ds	4
	global	settime@i
settime@i:	; 1 bytes @ 0x1E
	ds	1
	global	??_up_time1
??_up_time1:	; 0 bytes @ 0x1F
	global	??_up_time2
??_up_time2:	; 0 bytes @ 0x1F
	ds	2
	global	up_time1@date
up_time1@date:	; 4 bytes @ 0x21
	global	get_time@ds3231_time3
get_time@ds3231_time3:	; 7 bytes @ 0x21
	ds	1
	global	up_time2@date
up_time2@date:	; 4 bytes @ 0x22
	ds	3
	global	up_time1@udata_time
up_time1@udata_time:	; 1 bytes @ 0x25
	ds	1
	global	up_time1@i
up_time1@i:	; 1 bytes @ 0x26
	global	up_time2@udata_time
up_time2@udata_time:	; 1 bytes @ 0x26
	ds	1
	global	up_time2@i
up_time2@i:	; 1 bytes @ 0x27
	ds	1
	global	??_lcd_init
??_lcd_init:	; 0 bytes @ 0x28
	global	get_time@ds3231_time
get_time@ds3231_time:	; 7 bytes @ 0x28
	ds	3
	global	_lcd_init$5112
_lcd_init$5112:	; 2 bytes @ 0x2B
	ds	4
	global	get_time@ds3231_state
get_time@ds3231_state:	; 1 bytes @ 0x2F
	ds	1
	global	get_time@i
get_time@i:	; 1 bytes @ 0x30
	ds	1
	global	??_main
??_main:	; 0 bytes @ 0x31
	ds	3
;;Data sizes: Strings 0, constant 24, data 13, bss 95, persistent 4 stack 0
;;Auto spaces:   Size  Autos    Used
;; COMMON          14      6      12
;; BANK0           80     52      66
;; BANK1           80      0      79
;; BANK2           80     16      29

;;
;; Pointer list with targets:

;; ?_calccrc	unsigned short  size(1) Largest target is 0
;;
;; ?_MakeCRC16	unsigned short  size(1) Largest target is 0
;;
;; ?___awmod	int  size(1) Largest target is 0
;;
;; ?___awdiv	int  size(1) Largest target is 0
;;
;; ?___lwmod	unsigned int  size(1) Largest target is 0
;;
;; MakeCRC16@buf	PTR unsigned char  size(1) Largest target is 20
;;		 -> tx_udata(BANK1[20]), copy_rx_udata(BANK1[17]), 
;;
;; up_time2@udata_time	PTR unsigned char  size(1) Largest target is 4
;;		 -> disp_data_time(BANK1[4]), 
;;
;; up_date@date	PTR unsigned char  size(1) Largest target is 4
;;		 -> up_time2@date(BANK0[4]), up_time1@date(BANK0[4]), 
;;
;; up_time1@udata_time	PTR unsigned char  size(1) Largest target is 4
;;		 -> disp_data_time(BANK1[4]), 
;;
;; date_dec@t	PTR struct _DATE size(1) Largest target is 4
;;		 -> old_date(BANK1[4]), 
;;
;; date_add@t	PTR struct _DATE size(1) Largest target is 4
;;		 -> old_date(BANK1[4]), 
;;
;; time_add@t	PTR struct _TIME size(1) Largest target is 3
;;		 -> old_time(BANK0[3]), 
;;


;;
;; Critical Paths under _main in COMMON
;;
;;   None.
;;
;; Critical Paths under _isr in COMMON
;;
;;   _isr->_usart_isr
;;
;; Critical Paths under _main in BANK0
;;
;;   _main->_get_time
;;   _lcd_init->_up_time2
;;   _up_time2->_settime
;;   _up_time1->_settime
;;   _up_date->_seg_disp
;;   _settime->_dec_hex
;;   _get_time->_hex_dec
;;   _ds3231_init->_readbyte
;;   _date_dec->_isleap
;;   _date_add->_isleap
;;   _MakeCRC16->_calccrc
;;   _seg_disp->_shift_srclk
;;   _dec_hex->___awdiv
;;   _hex_dec->___bmul
;;   _writebyte->_i2c_send
;;   _readbyte->_i2c_send
;;   _readbyte->_i2c_read
;;   _usart_init->_id_code
;;   _isleap->___lwmod
;;   ___awdiv->___awmod
;;   ___bmul->___awdiv
;;
;; Critical Paths under _isr in BANK0
;;
;;   None.
;;
;; Critical Paths under _main in BANK1
;;
;;   None.
;;
;; Critical Paths under _isr in BANK1
;;
;;   None.
;;
;; Critical Paths under _main in BANK2
;;
;;   None.
;;
;; Critical Paths under _isr in BANK2
;;
;;   None.

;;
;;Main: autosize = 0, tempsize = 3, incstack = 0, save=0
;;

;;
;;Call Graph Tables:
;;
;; ---------------------------------------------------------------------------------
;; (Depth) Function   	        Calls       Base Space   Used Autos Params    Refs
;; ---------------------------------------------------------------------------------
;; (0) _main                                                21    21      0   25936
;;                                             49 BANK0      3     3      0
;;                                              0 BANK2     16    16      0
;;                      _interupt_init
;;                  _system_value_init
;;                        _timer1_init
;;                        _ds3231_init
;;                         _usart_init
;;                           _get_time
;;                           _lcd_init
;;                        _timer2_init
;;                          _MakeCRC16
;;                            ___lwmod
;;                              _putch
;;                            _settime
;;                          _calc_zone
;;                           _date_dec
;;                           _date_add
;;                           _time_add
;;                            ___awmod
;;                            ___awdiv
;;                           _up_time1
;;                           _up_time2
;; ---------------------------------------------------------------------------------
;; (1) _lcd_init                                             7     7      0    8224
;;                                             40 BANK0      5     5      0
;;                            ___awmod
;;                            ___awdiv
;;                           _up_time1
;;                           _up_time2
;; ---------------------------------------------------------------------------------
;; (1) _up_time2                                             9     9      0    3554
;;                                             31 BANK0      9     9      0
;;                            _up_date
;;                            _settime
;;                           _seg_disp
;; ---------------------------------------------------------------------------------
;; (1) _up_time1                                             8     8      0    3656
;;                                             31 BANK0      8     8      0
;;                            _up_date
;;                            _settime
;;                           _seg_disp
;; ---------------------------------------------------------------------------------
;; (2) _up_date                                              8     5      3     799
;;                                              7 BANK0      8     5      3
;;                           _seg_disp
;;                         _latch_rclk
;; ---------------------------------------------------------------------------------
;; (2) _settime                                              9     9      0    1530
;;                                             22 BANK0      9     9      0
;;                            _dec_hex
;;                          _writebyte
;; ---------------------------------------------------------------------------------
;; (1) _get_time                                            24    24      0    2588
;;                                             25 BANK0     24    24      0
;;                           _readbyte
;;                          _writebyte
;;                            _hex_dec
;;                          _calc_zone
;; ---------------------------------------------------------------------------------
;; (1) _ds3231_init                                          2     2      0     553
;;                                              6 BANK0      2     2      0
;;                           _readbyte
;;                          _writebyte
;; ---------------------------------------------------------------------------------
;; (1) _date_dec                                             2     2      0     635
;;                                             10 BANK0      2     2      0
;;                             _isleap
;; ---------------------------------------------------------------------------------
;; (1) _date_add                                             3     3      0     669
;;                                             10 BANK0      3     3      0
;;                             _isleap
;; ---------------------------------------------------------------------------------
;; (1) _MakeCRC16                                           11     9      2     634
;;                                              7 BANK0     11     9      2
;;                            _calccrc
;; ---------------------------------------------------------------------------------
;; (2) _seg_disp                                             6     4      2     483
;;                                              1 BANK0      6     4      2
;;                        _shift_srclk
;; ---------------------------------------------------------------------------------
;; (3) _dec_hex                                              6     6      0     940
;;                                             16 BANK0      6     6      0
;;                            ___awmod
;;                            ___awdiv
;; ---------------------------------------------------------------------------------
;; (2) _hex_dec                                              5     5      0     643
;;                                             20 BANK0      5     5      0
;;                            ___awdiv
;;                             ___bmul
;; ---------------------------------------------------------------------------------
;; (3) _writebyte                                            2     1      1     201
;;                                              3 BANK0      2     1      1
;;                          _start_i2c
;;                           _i2c_send
;;                        _waitack_i2c
;; ---------------------------------------------------------------------------------
;; (2) _readbyte                                             3     3      0     318
;;                                              3 BANK0      3     3      0
;;                          _start_i2c
;;                           _i2c_send
;;                        _waitack_i2c
;;                           _i2c_read
;;                     _sendnotack_i2c
;; ---------------------------------------------------------------------------------
;; (1) _usart_init                                           1     1      0      61
;;                                              1 BANK0      1     1      0
;;                            _id_code
;; ---------------------------------------------------------------------------------
;; (2) _isleap                                               4     2      2     325
;;                                              6 BANK0      4     2      2
;;                            ___lwmod
;; ---------------------------------------------------------------------------------
;; (4) ___awmod                                              7     3      4     433
;;                                              0 BANK0      7     3      4
;; ---------------------------------------------------------------------------------
;; (4) ___awdiv                                              9     5      4     445
;;                                              7 BANK0      9     5      4
;;                            ___awmod (ARG)
;; ---------------------------------------------------------------------------------
;; (3) ___lwmod                                              6     2      4     232
;;                                              0 BANK0      6     2      4
;; ---------------------------------------------------------------------------------
;; (3) ___bmul                                               4     3      1     136
;;                                             16 BANK0      4     3      1
;;                            ___awdiv (ARG)
;; ---------------------------------------------------------------------------------
;; (3) _i2c_read                                             3     3      0     111
;;                                              0 BANK0      3     3      0
;; ---------------------------------------------------------------------------------
;; (4) _i2c_send                                             3     3      0     102
;;                                              0 BANK0      3     3      0
;; ---------------------------------------------------------------------------------
;; (3) _sendnotack_i2c                                       0     0      0       0
;; ---------------------------------------------------------------------------------
;; (4) _waitack_i2c                                          2     2      0      37
;;                                              0 BANK0      2     2      0
;; ---------------------------------------------------------------------------------
;; (4) _start_i2c                                            0     0      0       0
;; ---------------------------------------------------------------------------------
;; (2) _calccrc                                              7     5      2     331
;;                                              0 BANK0      7     5      2
;; ---------------------------------------------------------------------------------
;; (1) _timer2_init                                          0     0      0       0
;; ---------------------------------------------------------------------------------
;; (1) _system_value_init                                    0     0      0       0
;; ---------------------------------------------------------------------------------
;; (1) _interupt_init                                        0     0      0       0
;; ---------------------------------------------------------------------------------
;; (3) _latch_rclk                                           1     1      0      93
;;                                              0 BANK0      1     1      0
;; ---------------------------------------------------------------------------------
;; (3) _shift_srclk                                          1     1      0      93
;;                                              0 BANK0      1     1      0
;; ---------------------------------------------------------------------------------
;; (1) _calc_zone                                            1     1      0       0
;;                                              0 BANK0      1     1      0
;; ---------------------------------------------------------------------------------
;; (1) _putch                                                1     1      0      31
;;                                              0 BANK0      1     1      0
;; ---------------------------------------------------------------------------------
;; (2) _id_code                                              1     1      0      61
;;                                              0 BANK0      1     1      0
;; ---------------------------------------------------------------------------------
;; (1) _time_add                                             2     2      0     279
;;                                              0 BANK0      2     2      0
;; ---------------------------------------------------------------------------------
;; (1) _timer1_init                                          0     0      0       0
;; ---------------------------------------------------------------------------------
;; Estimated maximum stack depth 4
;; ---------------------------------------------------------------------------------
;; (Depth) Function   	        Calls       Base Space   Used Autos Params    Refs
;; ---------------------------------------------------------------------------------
;; (6) _isr                                                  4     4      0      23
;;                                              2 COMMON     4     4      0
;;                         _timer1_isr
;;                          _usart_isr
;;                         _timer2_isr
;; ---------------------------------------------------------------------------------
;; (7) _timer2_isr                                           1     1      0       0
;;                                              0 COMMON     1     1      0
;; ---------------------------------------------------------------------------------
;; (7) _usart_isr                                            2     2      0      23
;;                                              0 COMMON     2     2      0
;; ---------------------------------------------------------------------------------
;; (7) _timer1_isr                                           1     1      0       0
;;                                              0 COMMON     1     1      0
;; ---------------------------------------------------------------------------------
;; Estimated maximum stack depth 7
;; ---------------------------------------------------------------------------------

;; Call Graph Graphs:

;; _main (ROOT)
;;   _interupt_init
;;   _system_value_init
;;   _timer1_init
;;   _ds3231_init
;;     _readbyte
;;       _start_i2c
;;       _i2c_send
;;       _waitack_i2c
;;       _i2c_read
;;       _sendnotack_i2c
;;     _writebyte
;;       _start_i2c
;;       _i2c_send
;;       _waitack_i2c
;;   _usart_init
;;     _id_code
;;   _get_time
;;     _readbyte
;;       _start_i2c
;;       _i2c_send
;;       _waitack_i2c
;;       _i2c_read
;;       _sendnotack_i2c
;;     _writebyte
;;       _start_i2c
;;       _i2c_send
;;       _waitack_i2c
;;     _hex_dec
;;       ___awdiv
;;         ___awmod (ARG)
;;       ___bmul
;;         ___awdiv (ARG)
;;           ___awmod (ARG)
;;     _calc_zone
;;   _lcd_init
;;     ___awmod
;;     ___awdiv
;;       ___awmod (ARG)
;;     _up_time1
;;       _up_date
;;         _seg_disp
;;           _shift_srclk
;;         _latch_rclk
;;       _settime
;;         _dec_hex
;;           ___awmod
;;           ___awdiv
;;             ___awmod (ARG)
;;         _writebyte
;;           _start_i2c
;;           _i2c_send
;;           _waitack_i2c
;;       _seg_disp
;;         _shift_srclk
;;     _up_time2
;;       _up_date
;;         _seg_disp
;;           _shift_srclk
;;         _latch_rclk
;;       _settime
;;         _dec_hex
;;           ___awmod
;;           ___awdiv
;;             ___awmod (ARG)
;;         _writebyte
;;           _start_i2c
;;           _i2c_send
;;           _waitack_i2c
;;       _seg_disp
;;         _shift_srclk
;;   _timer2_init
;;   _MakeCRC16
;;     _calccrc
;;   ___lwmod
;;   _putch
;;   _settime
;;     _dec_hex
;;       ___awmod
;;       ___awdiv
;;         ___awmod (ARG)
;;     _writebyte
;;       _start_i2c
;;       _i2c_send
;;       _waitack_i2c
;;   _calc_zone
;;   _date_dec
;;     _isleap
;;       ___lwmod
;;   _date_add
;;     _isleap
;;       ___lwmod
;;   _time_add
;;   ___awmod
;;   ___awdiv
;;     ___awmod (ARG)
;;   _up_time1
;;     _up_date
;;       _seg_disp
;;         _shift_srclk
;;       _latch_rclk
;;     _settime
;;       _dec_hex
;;         ___awmod
;;         ___awdiv
;;           ___awmod (ARG)
;;       _writebyte
;;         _start_i2c
;;         _i2c_send
;;         _waitack_i2c
;;     _seg_disp
;;       _shift_srclk
;;   _up_time2
;;     _up_date
;;       _seg_disp
;;         _shift_srclk
;;       _latch_rclk
;;     _settime
;;       _dec_hex
;;         ___awmod
;;         ___awdiv
;;           ___awmod (ARG)
;;       _writebyte
;;         _start_i2c
;;         _i2c_send
;;         _waitack_i2c
;;     _seg_disp
;;       _shift_srclk
;;
;; _isr (ROOT)
;;   _timer1_isr
;;   _usart_isr
;;   _timer2_isr
;;

;; Address spaces:

;;Name               Size   Autos  Total    Cost      Usage
;;SFR3                 0      0       0       4        0.0%
;;BITSFR3              0      0       0       4        0.0%
;;BANK2               50     10      1D       7       36.3%
;;BITBANK2            50      0       0       6        0.0%
;;SFR2                 0      0       0       5        0.0%
;;BITSFR2              0      0       0       5        0.0%
;;SFR1                 0      0       0       2        0.0%
;;BITSFR1              0      0       0       2        0.0%
;;BANK1               50      0      4F       5       98.8%
;;BITBANK1            50      0       0       4        0.0%
;;CODE                 0      0       0       0        0.0%
;;DATA                 0      0      C3      10        0.0%
;;ABS                  0      0      BA       8        0.0%
;;NULL                 0      0       0       0        0.0%
;;STACK                0      0       9       2        0.0%
;;BANK0               50     34      42       3       82.5%
;;BITBANK0            50      0       0       9        0.0%
;;SFR0                 0      0       0       1        0.0%
;;BITSFR0              0      0       0       1        0.0%
;;COMMON               E      6       C       1       85.7%
;;BITCOMMON            E      0       0       0        0.0%
;;EEDATA             100      0       0       0        0.0%

	global	_main
psect	maintext,global,class=CODE,delta=2
global __pmaintext
__pmaintext:

;; *************** function _main *****************
;; Defined at:
;;		line 86 in file "E:\Projects\COLOCK\Master_sub_slock\yzj\programe_updata\SZZ485_V1.4\source\main.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  chk_value       2   13[BANK2 ] unsigned short 
;;  func            2   11[BANK2 ] unsigned short 
;;  copy_func       2    3[BANK2 ] unsigned short 
;;  calc_chk_val    2    0[BANK2 ] unsigned short 
;;  i               1   15[BANK2 ] unsigned char 
;;  j               1   10[BANK2 ] unsigned char 
;;  flag_send_da    1    9[BANK2 ] unsigned char 
;;  len_cnt         1    6[BANK2 ] unsigned char 
;;  flag_temp       1    5[BANK2 ] unsigned char 
;;  flag_save_da    1    2[BANK2 ] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, btemp+1, pclath, cstack
;; Tracked objects:
;;		On entry : 17F/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK2
;;      Params:         0       0       0       0
;;      Locals:         0       0       0      16
;;      Temps:          0       3       0       0
;;      Totals:         0       3       0      16
;;Total ram usage:       19 bytes
;; Hardware stack levels required when called:    7
;; This function calls:
;;		_interupt_init
;;		_system_value_init
;;		_timer1_init
;;		_ds3231_init
;;		_usart_init
;;		_get_time
;;		_lcd_init
;;		_timer2_init
;;		_MakeCRC16
;;		___lwmod
;;		_putch
;;		_settime
;;		_calc_zone
;;		_date_dec
;;		_date_add
;;		_time_add
;;		___awmod
;;		___awdiv
;;		_up_time1
;;		_up_time2
;; This function is called by:
;;		Startup code after reset
;; This function uses a non-reentrant model
;;
psect	maintext
	file	"E:\Projects\COLOCK\Master_sub_slock\yzj\programe_updata\SZZ485_V1.4\source\main.c"
	line	86
	global	__size_of_main
	__size_of_main	equ	__end_of_main-_main
	
_main:	
	opt	stack 1
; Regs used in _main: [wreg-fsr0h+status,2+status,0+btemp+1+pclath+cstack]
	line	94
	
l14502:	
;main.c: 87: UINT16 chk_value,calc_chk_value;
;main.c: 88: UINT16 func,copy_func;
;main.c: 89: UINT8 i,j,flag_send_data,flag_save_data;
;main.c: 90: static UINT8 save_time_cnt=0;
;main.c: 91: UINT8 len_cnt,flag_temp;
;main.c: 94: interupt_init();
	fcall	_interupt_init
	line	95
	
l14504:	
;main.c: 95: system_value_init();
	fcall	_system_value_init
	line	96
	
l14506:	
;main.c: 96: timer1_init();
	fcall	_timer1_init
	line	97
;main.c: 97: ds3231_init();
	fcall	_ds3231_init
	line	98
;main.c: 98: usart_init();
	fcall	_usart_init
	line	99
	
l14508:	
;main.c: 99: get_time();
	fcall	_get_time
	line	110
	
l14510:	
;main.c: 110: lcd_init();
	fcall	_lcd_init
	line	113
;main.c: 113: timer2_init();
	fcall	_timer2_init
	goto	l14512
	line	125
;main.c: 125: while(1)
	
l4299:	
	line	129
	
l14512:	
;main.c: 126: {
;main.c: 129: if(usart_timer_cnt>5)
	movlw	(06h)
	subwf	(_usart_timer_cnt),w
	skipc
	goto	u6671
	goto	u6670
u6671:
	goto	l14548
u6670:
	line	131
	
l14514:	
;main.c: 130: {
;main.c: 131: flag_usart_start=0;
	clrc
	movlw	0
	btfsc	status,0
	movlw	1
	movwf	(_flag_usart_start)
	line	132
;main.c: 132: usart_count=0;
	clrc
	movlw	0
	btfsc	status,0
	movlw	1
	movwf	(_usart_count)
	line	133
;main.c: 133: usart_timer_cnt=0;
	clrc
	movlw	0
	btfsc	status,0
	movlw	1
	movwf	(_usart_timer_cnt)
	line	134
	
l14516:	
;main.c: 134: if((rx_udata[0]==0xD3)&&(rx_udata[1]<17-4))
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(_rx_udata)^080h,w
	xorlw	0D3h
	skipz
	goto	u6681
	goto	u6680
u6681:
	goto	l14548
u6680:
	
l14518:	
	movlw	(0Dh)
	subwf	0+(_rx_udata)^080h+01h,w
	skipnc
	goto	u6691
	goto	u6690
u6691:
	goto	l14548
u6690:
	line	136
	
l14520:	
;main.c: 135: {
;main.c: 136: if(rx_udata[rx_udata[1]+4]==0xD8)
	movf	0+(_rx_udata)^080h+01h,w
	addlw	04h
	addlw	_rx_udata&0ffh
	movwf	fsr0
	bcf	status, 7	;select IRP bank1
	movf	indf,w
	xorlw	0D8h
	skipz
	goto	u6701
	goto	u6700
u6701:
	goto	l14548
u6700:
	line	138
	
l14522:	
;main.c: 137: {
;main.c: 138: RCIE=0;
	bcf	(1125/8)^080h,(1125)&7
	line	139
	
l14524:	
;main.c: 139: func = rx_udata[0x02]<<8;
	movf	0+(_rx_udata)^080h+02h,w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_main+0)+0
	clrf	(??_main+0)+0+1
	movlw	08h
	movwf	btemp+1
u6715:
	clrc
	rlf	(??_main+0)+0,f
	rlf	(??_main+0)+1,f
	decfsz	btemp+1,f
	goto	u6715
	movf	0+(??_main+0)+0,w
	bcf	status, 5	;RP0=0, select bank2
	bsf	status, 6	;RP1=1, select bank2
	movwf	(main@func)^0100h
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	1+(??_main+0)+0,w
	bcf	status, 5	;RP0=0, select bank2
	bsf	status, 6	;RP1=1, select bank2
	movwf	(main@func+1)^0100h
	line	140
	
l14526:	
;main.c: 140: func += rx_udata[0x02+1];
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	0+(_rx_udata)^080h+03h,w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_main+0)+0
	clrf	(??_main+0)+0+1
	movf	0+(??_main+0)+0,w
	bcf	status, 5	;RP0=0, select bank2
	bsf	status, 6	;RP1=1, select bank2
	addwf	(main@func)^0100h,f
	skipnc
	incf	(main@func+1)^0100h,f
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	1+(??_main+0)+0,w
	bcf	status, 5	;RP0=0, select bank2
	bsf	status, 6	;RP1=1, select bank2
	addwf	(main@func+1)^0100h,f
	line	141
	
l14528:	
;main.c: 141: i=rx_udata[0x04];
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	0+(_rx_udata)^080h+04h,w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_main+0)+0
	movf	(??_main+0)+0,w
	bcf	status, 5	;RP0=0, select bank2
	bsf	status, 6	;RP1=1, select bank2
	movwf	(main@i)^0100h
	line	142
	
l14530:	
;main.c: 142: if((func == 0x0900) ||(i == my_id_code) || (i == 0xff))
	movlw	high(0900h)
	xorwf	(main@func+1)^0100h,w
	skipz
	goto	u6725
	movlw	low(0900h)
	xorwf	(main@func)^0100h,w
u6725:

	skipnz
	goto	u6721
	goto	u6720
u6721:
	goto	l14536
u6720:
	
l14532:	
	movf	(main@i)^0100h,w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	xorwf	(_my_id_code),w
	skipnz
	goto	u6731
	goto	u6730
u6731:
	goto	l14536
u6730:
	
l14534:	
	bcf	status, 5	;RP0=0, select bank2
	bsf	status, 6	;RP1=1, select bank2
	movf	(main@i)^0100h,w
	xorlw	0FFh
	skipz
	goto	u6741
	goto	u6740
u6741:
	goto	l14546
u6740:
	goto	l14536
	
l4305:	
	line	144
	
l14536:	
;main.c: 143: {
;main.c: 144: disp_rxd_length=rx_udata[1]+5;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	0+(_rx_udata)^080h+01h,w
	addlw	05h
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_main+0)+0
	movf	(??_main+0)+0,w
	movwf	(_disp_rxd_length)
	line	145
;main.c: 145: for(i=0;i<disp_rxd_length;i++)
	clrc
	movlw	0
	btfsc	status,0
	movlw	1
	bcf	status, 5	;RP0=0, select bank2
	bsf	status, 6	;RP1=1, select bank2
	movwf	(main@i)^0100h
	goto	l14542
	line	146
	
l4307:	
	line	147
	
l14538:	
;main.c: 146: {
;main.c: 147: copy_rx_udata[i]=rx_udata[i];
	movf	(main@i)^0100h,w
	addlw	_rx_udata&0ffh
	movwf	fsr0
	movf	indf,w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_main+0)+0
	bcf	status, 5	;RP0=0, select bank2
	bsf	status, 6	;RP1=1, select bank2
	movf	(main@i)^0100h,w
	addlw	_copy_rx_udata&0ffh
	movwf	fsr0
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(??_main+0)+0,w
	movwf	indf
	line	148
;main.c: 148: rx_udata[i]=0;
	clrc
	bcf	status, 5	;RP0=0, select bank2
	bsf	status, 6	;RP1=1, select bank2
	movf	(main@i)^0100h,w
	addlw	_rx_udata&0ffh
	movwf	fsr0
	movlw	0
	btfsc	status,0
	movlw	1
	movwf	indf
	line	145
	
l14540:	
	movlw	(01h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_main+0)+0
	movf	(??_main+0)+0,w
	bcf	status, 5	;RP0=0, select bank2
	bsf	status, 6	;RP1=1, select bank2
	addwf	(main@i)^0100h,f
	goto	l14542
	
l4306:	
	
l14542:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(_disp_rxd_length),w
	bcf	status, 5	;RP0=0, select bank2
	bsf	status, 6	;RP1=1, select bank2
	subwf	(main@i)^0100h,w
	skipc
	goto	u6751
	goto	u6750
u6751:
	goto	l14538
u6750:
	goto	l14544
	
l4308:	
	line	150
	
l14544:	
;main.c: 149: }
;main.c: 150: flag_data_process=1;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	clrf	(_flag_data_process)^080h
	bsf	status,0
	rlf	(_flag_data_process)^080h,f
	goto	l14546
	line	151
	
l4303:	
	line	152
	
l14546:	
;main.c: 151: }
;main.c: 152: RCIE=1;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	bsf	(1125/8)^080h,(1125)&7
	goto	l14548
	line	154
	
l4302:	
	goto	l14548
	line	155
	
l4301:	
	goto	l14548
	line	156
	
l4300:	
	line	158
	
l14548:	
;main.c: 154: }
;main.c: 155: }
;main.c: 156: }
;main.c: 158: flag_send_data=0;
	clrc
	movlw	0
	btfsc	status,0
	movlw	1
	bcf	status, 5	;RP0=0, select bank2
	bsf	status, 6	;RP1=1, select bank2
	movwf	(main@flag_send_data)^0100h
	line	159
	
l14550:	
;main.c: 159: flag_save_data=0;
	clrc
	movlw	0
	btfsc	status,0
	movlw	1
	movwf	(main@flag_save_data)^0100h
	line	160
	
l14552:	
;main.c: 160: flag_temp=0;
	clrc
	movlw	0
	btfsc	status,0
	movlw	1
	movwf	(main@flag_temp)^0100h
	line	161
;main.c: 161: if(flag_data_process == TRUE)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(_flag_data_process)^080h,w
	xorlw	01h
	skipz
	goto	u6761
	goto	u6760
u6761:
	goto	l14694
u6760:
	line	164
	
l14554:	
;main.c: 162: {
;main.c: 164: chk_value = copy_rx_udata[disp_rxd_length-2] + copy_rx_udata[disp_rxd_length-3]*256;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(_disp_rxd_length),w
	addlw	0FDh
	addlw	_copy_rx_udata&0ffh
	movwf	fsr0
	bcf	status, 7	;select IRP bank1
	movf	indf,w
	movwf	(??_main+0)+0
	clrf	(??_main+0)+0+1
	movlw	08h
	movwf	btemp+1
u6775:
	clrc
	rlf	(??_main+0)+0,f
	rlf	(??_main+0)+1,f
	decfsz	btemp+1,f
	goto	u6775
	movf	(_disp_rxd_length),w
	addlw	0FEh
	addlw	_copy_rx_udata&0ffh
	movwf	fsr0
	movf	indf,w
	addwf	0+(??_main+0)+0,w
	bcf	status, 5	;RP0=0, select bank2
	bsf	status, 6	;RP1=1, select bank2
	movwf	(main@chk_value)^0100h
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	1+(??_main+0)+0,w
	skipnc
	incf	1+(??_main+0)+0,w
	bcf	status, 5	;RP0=0, select bank2
	bsf	status, 6	;RP1=1, select bank2
	movwf	((main@chk_value)^0100h)+1
	line	165
	
l14556:	
;main.c: 165: calc_chk_value = MakeCRC16(&copy_rx_udata[0],disp_rxd_length-3);
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(_disp_rxd_length),w
	addlw	0FDh
	movwf	(??_main+0)+0
	movf	(??_main+0)+0,w
	movwf	(?_MakeCRC16)
	movlw	(_copy_rx_udata)&0ffh
	fcall	_MakeCRC16
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(1+(?_MakeCRC16)),w
	bcf	status, 5	;RP0=0, select bank2
	bsf	status, 6	;RP1=1, select bank2
	clrf	(main@calc_chk_value+1)^0100h
	addwf	(main@calc_chk_value+1)^0100h
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(0+(?_MakeCRC16)),w
	bcf	status, 5	;RP0=0, select bank2
	bsf	status, 6	;RP1=1, select bank2
	clrf	(main@calc_chk_value)^0100h
	addwf	(main@calc_chk_value)^0100h

	line	166
	
l14558:	
;main.c: 166: if(chk_value == calc_chk_value)
	movf	(main@calc_chk_value+1)^0100h,w
	xorwf	(main@chk_value+1)^0100h,w
	skipz
	goto	u6785
	movf	(main@calc_chk_value)^0100h,w
	xorwf	(main@chk_value)^0100h,w
u6785:

	skipz
	goto	u6781
	goto	u6780
u6781:
	goto	l14692
u6780:
	line	168
	
l14560:	
;main.c: 167: {
;main.c: 168: func = copy_rx_udata[2]<<8;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	0+(_copy_rx_udata)^080h+02h,w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_main+0)+0
	clrf	(??_main+0)+0+1
	movlw	08h
	movwf	btemp+1
u6795:
	clrc
	rlf	(??_main+0)+0,f
	rlf	(??_main+0)+1,f
	decfsz	btemp+1,f
	goto	u6795
	movf	0+(??_main+0)+0,w
	bcf	status, 5	;RP0=0, select bank2
	bsf	status, 6	;RP1=1, select bank2
	movwf	(main@func)^0100h
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	1+(??_main+0)+0,w
	bcf	status, 5	;RP0=0, select bank2
	bsf	status, 6	;RP1=1, select bank2
	movwf	(main@func+1)^0100h
	line	169
	
l14562:	
;main.c: 169: func += copy_rx_udata[3];
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	0+(_copy_rx_udata)^080h+03h,w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_main+0)+0
	clrf	(??_main+0)+0+1
	movf	0+(??_main+0)+0,w
	bcf	status, 5	;RP0=0, select bank2
	bsf	status, 6	;RP1=1, select bank2
	addwf	(main@func)^0100h,f
	skipnc
	incf	(main@func+1)^0100h,f
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	1+(??_main+0)+0,w
	bcf	status, 5	;RP0=0, select bank2
	bsf	status, 6	;RP1=1, select bank2
	addwf	(main@func+1)^0100h,f
	line	173
;main.c: 173: switch(func)
	goto	l14690
	line	175
;main.c: 174: {
;main.c: 175: case 0x0900:
	
l4312:	
	line	177
	
l14564:	
;main.c: 176: {
;main.c: 177: if(disp_rxd_length < 16)
	movlw	(010h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	subwf	(_disp_rxd_length),w
	skipnc
	goto	u6801
	goto	u6800
u6801:
	goto	l14568
u6800:
	goto	l14692
	line	179
	
l14566:	
;main.c: 178: {
;main.c: 179: break;
	goto	l14692
	line	180
	
l4313:	
	line	203
	
l14568:	
;main.c: 180: }
;main.c: 200: {
;main.c: 203: i = 0x04;
	movlw	(04h)
	movwf	(??_main+0)+0
	movf	(??_main+0)+0,w
	bcf	status, 5	;RP0=0, select bank2
	bsf	status, 6	;RP1=1, select bank2
	movwf	(main@i)^0100h
	line	204
	
l14570:	
;main.c: 204: chk_value = copy_rx_udata[i++]*256;
	movf	(main@i)^0100h,w
	addlw	_copy_rx_udata&0ffh
	movwf	fsr0
	bcf	status, 7	;select IRP bank1
	movf	indf,w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_main+0)+0
	clrf	(??_main+0)+0+1
	movlw	08h
	movwf	btemp+1
u6815:
	clrc
	rlf	(??_main+0)+0,f
	rlf	(??_main+0)+1,f
	decfsz	btemp+1,f
	goto	u6815
	movf	0+(??_main+0)+0,w
	bcf	status, 5	;RP0=0, select bank2
	bsf	status, 6	;RP1=1, select bank2
	movwf	(main@chk_value)^0100h
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	1+(??_main+0)+0,w
	bcf	status, 5	;RP0=0, select bank2
	bsf	status, 6	;RP1=1, select bank2
	movwf	(main@chk_value+1)^0100h
	
l14572:	
	movlw	(01h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_main+0)+0
	movf	(??_main+0)+0,w
	bcf	status, 5	;RP0=0, select bank2
	bsf	status, 6	;RP1=1, select bank2
	addwf	(main@i)^0100h,f
	line	205
	
l14574:	
;main.c: 205: chk_value += copy_rx_udata[i++];
	movf	(main@i)^0100h,w
	addlw	_copy_rx_udata&0ffh
	movwf	fsr0
	movf	indf,w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_main+0)+0
	clrf	(??_main+0)+0+1
	movf	0+(??_main+0)+0,w
	bcf	status, 5	;RP0=0, select bank2
	bsf	status, 6	;RP1=1, select bank2
	addwf	(main@chk_value)^0100h,f
	skipnc
	incf	(main@chk_value+1)^0100h,f
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	1+(??_main+0)+0,w
	bcf	status, 5	;RP0=0, select bank2
	bsf	status, 6	;RP1=1, select bank2
	addwf	(main@chk_value+1)^0100h,f
	
l14576:	
	movlw	(01h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_main+0)+0
	movf	(??_main+0)+0,w
	bcf	status, 5	;RP0=0, select bank2
	bsf	status, 6	;RP1=1, select bank2
	addwf	(main@i)^0100h,f
	line	206
	
l14578:	
;main.c: 206: chk_value %= 100;
	movlw	low(064h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(?___lwmod)
	movlw	high(064h)
	movwf	((?___lwmod))+1
	bcf	status, 5	;RP0=0, select bank2
	bsf	status, 6	;RP1=1, select bank2
	movf	(main@chk_value+1)^0100h,w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	1+(?___lwmod)+02h
	addwf	1+(?___lwmod)+02h
	bcf	status, 5	;RP0=0, select bank2
	bsf	status, 6	;RP1=1, select bank2
	movf	(main@chk_value)^0100h,w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	0+(?___lwmod)+02h
	addwf	0+(?___lwmod)+02h

	fcall	___lwmod
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(1+(?___lwmod)),w
	bcf	status, 5	;RP0=0, select bank2
	bsf	status, 6	;RP1=1, select bank2
	clrf	(main@chk_value+1)^0100h
	addwf	(main@chk_value+1)^0100h
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(0+(?___lwmod)),w
	bcf	status, 5	;RP0=0, select bank2
	bsf	status, 6	;RP1=1, select bank2
	clrf	(main@chk_value)^0100h
	addwf	(main@chk_value)^0100h

	line	207
	
l14580:	
;main.c: 207: if((chk_value>=13) && (copy_rx_udata[i]<=12) && (copy_rx_udata[i+1]<=31) && (copy_rx_udata[i+2]<=23) && (copy_rx_udata[i+3]<=59) && (copy_rx_udata[i+4]<=59))
	movlw	high(0Dh)
	subwf	(main@chk_value+1)^0100h,w
	movlw	low(0Dh)
	skipnz
	subwf	(main@chk_value)^0100h,w
	skipc
	goto	u6821
	goto	u6820
u6821:
	goto	l14692
u6820:
	
l14582:	
	movf	(main@i)^0100h,w
	addlw	_copy_rx_udata&0ffh
	movwf	fsr0
	movlw	(0Dh)
	bcf	status, 7	;select IRP bank1
	subwf	indf,w
	skipnc
	goto	u6831
	goto	u6830
u6831:
	goto	l14692
u6830:
	
l14584:	
	movf	(main@i)^0100h,w
	addlw	01h
	addlw	_copy_rx_udata&0ffh
	movwf	fsr0
	movlw	(020h)
	subwf	indf,w
	skipnc
	goto	u6841
	goto	u6840
u6841:
	goto	l14692
u6840:
	
l14586:	
	movf	(main@i)^0100h,w
	addlw	02h
	addlw	_copy_rx_udata&0ffh
	movwf	fsr0
	movlw	(018h)
	subwf	indf,w
	skipnc
	goto	u6851
	goto	u6850
u6851:
	goto	l14692
u6850:
	
l14588:	
	movf	(main@i)^0100h,w
	addlw	03h
	addlw	_copy_rx_udata&0ffh
	movwf	fsr0
	movlw	(03Ch)
	subwf	indf,w
	skipnc
	goto	u6861
	goto	u6860
u6861:
	goto	l14692
u6860:
	
l14590:	
	movf	(main@i)^0100h,w
	addlw	04h
	addlw	_copy_rx_udata&0ffh
	movwf	fsr0
	movlw	(03Ch)
	subwf	indf,w
	skipnc
	goto	u6871
	goto	u6870
u6871:
	goto	l14692
u6870:
	line	214
	
l14592:	
;main.c: 213: {
;main.c: 214: copy_old_date.year = chk_value;
	movf	(main@chk_value)^0100h,w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_main+0)+0
	movf	(??_main+0)+0,w
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	0+(_copy_old_date)^080h+03h
	line	215
	
l14594:	
;main.c: 215: copy_old_date.month = copy_rx_udata[i++];
	bcf	status, 5	;RP0=0, select bank2
	bsf	status, 6	;RP1=1, select bank2
	movf	(main@i)^0100h,w
	addlw	_copy_rx_udata&0ffh
	movwf	fsr0
	movf	indf,w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_main+0)+0
	movf	(??_main+0)+0,w
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	0+(_copy_old_date)^080h+02h
	
l14596:	
	movlw	(01h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_main+0)+0
	movf	(??_main+0)+0,w
	bcf	status, 5	;RP0=0, select bank2
	bsf	status, 6	;RP1=1, select bank2
	addwf	(main@i)^0100h,f
	line	216
	
l14598:	
;main.c: 216: copy_old_date.date = copy_rx_udata[i++];
	movf	(main@i)^0100h,w
	addlw	_copy_rx_udata&0ffh
	movwf	fsr0
	movf	indf,w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_main+0)+0
	movf	(??_main+0)+0,w
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	0+(_copy_old_date)^080h+01h
	
l14600:	
	movlw	(01h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_main+0)+0
	movf	(??_main+0)+0,w
	bcf	status, 5	;RP0=0, select bank2
	bsf	status, 6	;RP1=1, select bank2
	addwf	(main@i)^0100h,f
	line	217
	
l14602:	
;main.c: 217: copy_old_time.hour = copy_rx_udata[i++];
	movf	(main@i)^0100h,w
	addlw	_copy_rx_udata&0ffh
	movwf	fsr0
	movf	indf,w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_main+0)+0
	movf	(??_main+0)+0,w
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(_copy_old_time)^080h
	
l14604:	
	movlw	(01h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_main+0)+0
	movf	(??_main+0)+0,w
	bcf	status, 5	;RP0=0, select bank2
	bsf	status, 6	;RP1=1, select bank2
	addwf	(main@i)^0100h,f
	line	218
	
l14606:	
;main.c: 218: copy_old_time.min = copy_rx_udata[i++];
	movf	(main@i)^0100h,w
	addlw	_copy_rx_udata&0ffh
	movwf	fsr0
	movf	indf,w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_main+0)+0
	movf	(??_main+0)+0,w
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	0+(_copy_old_time)^080h+01h
	
l14608:	
	movlw	(01h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_main+0)+0
	movf	(??_main+0)+0,w
	bcf	status, 5	;RP0=0, select bank2
	bsf	status, 6	;RP1=1, select bank2
	addwf	(main@i)^0100h,f
	line	219
	
l14610:	
;main.c: 219: copy_old_time.sec = copy_rx_udata[i];
	movf	(main@i)^0100h,w
	addlw	_copy_rx_udata&0ffh
	movwf	fsr0
	movf	indf,w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_main+0)+0
	movf	(??_main+0)+0,w
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	0+(_copy_old_time)^080h+02h
	line	222
	
l14612:	
;main.c: 222: if(copy_old_time.sec == 0)
	movf	0+(_copy_old_time)^080h+02h,f
	skipz
	goto	u6881
	goto	u6880
u6881:
	goto	l14622
u6880:
	line	224
	
l14614:	
;main.c: 223: {
;main.c: 224: old_date.year =copy_old_date.year;
	movf	0+(_copy_old_date)^080h+03h,w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_main+0)+0
	movf	(??_main+0)+0,w
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	0+(_old_date)^080h+03h
	line	225
;main.c: 225: old_date.month =copy_old_date.month;
	movf	0+(_copy_old_date)^080h+02h,w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_main+0)+0
	movf	(??_main+0)+0,w
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	0+(_old_date)^080h+02h
	line	226
;main.c: 226: old_date.date =copy_old_date.date;
	movf	0+(_copy_old_date)^080h+01h,w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_main+0)+0
	movf	(??_main+0)+0,w
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	0+(_old_date)^080h+01h
	line	227
;main.c: 227: old_time.hour = copy_old_time.hour;
	movf	(_copy_old_time)^080h,w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_main+0)+0
	movf	(??_main+0)+0,w
	movwf	(_old_time)
	line	228
;main.c: 228: old_time.min = copy_old_time.min;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	0+(_copy_old_time)^080h+01h,w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_main+0)+0
	movf	(??_main+0)+0,w
	movwf	0+(_old_time)+01h
	line	229
;main.c: 229: old_time.sec = copy_old_time.sec;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	0+(_copy_old_time)^080h+02h,w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_main+0)+0
	movf	(??_main+0)+0,w
	movwf	0+(_old_time)+02h
	line	231
	
l14616:	
;main.c: 231: TMR1L = 0;
	clrf	(14)	;volatile
	line	232
	
l14618:	
;main.c: 232: TMR1H = 0;
	clrf	(15)	;volatile
	line	233
	
l14620:	
;main.c: 233: timer1_cnt = 0;
	clrc
	movlw	0
	btfsc	status,0
	movlw	1
	movwf	(_timer1_cnt)
	line	235
;main.c: 235: flag_jiaoshi = TRUE;
	clrf	(_flag_jiaoshi)
	bsf	status,0
	rlf	(_flag_jiaoshi),f
	line	236
;main.c: 236: up_led_display=1;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	clrf	(_up_led_display)^080h
	bsf	status,0
	rlf	(_up_led_display)^080h,f
	line	237
;main.c: 237: flag_save_data=1;
	bcf	status, 5	;RP0=0, select bank2
	bsf	status, 6	;RP1=1, select bank2
	clrf	(main@flag_save_data)^0100h
	bsf	status,0
	rlf	(main@flag_save_data)^0100h,f
	goto	l14622
	line	238
	
l4316:	
	line	240
	
l14622:	
;main.c: 238: }
;main.c: 240: jiaoshi_cnt=0;
	clrc
	movlw	0
	btfsc	status,0
	movlw	1
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(_jiaoshi_cnt)^080h
	goto	l14692
	line	241
	
l4315:	
	line	249
;main.c: 241: }
;main.c: 245: }
;main.c: 249: break;
	goto	l14692
	line	251
;main.c: 250: }
;main.c: 251: case 0x0901:
	
l4317:	
	line	253
	
l14624:	
;main.c: 252: {
;main.c: 253: if(disp_rxd_length < 8)
	movlw	(08h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	subwf	(_disp_rxd_length),w
	skipnc
	goto	u6891
	goto	u6890
u6891:
	goto	l14628
u6890:
	goto	l14692
	line	255
	
l14626:	
;main.c: 254: {
;main.c: 255: break;
	goto	l14692
	line	256
	
l4318:	
	line	257
	
l14628:	
;main.c: 256: }
;main.c: 257: if(copy_rx_udata[0x04]==my_id_code)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	0+(_copy_rx_udata)^080h+04h,w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	xorwf	(_my_id_code),w
	skipz
	goto	u6901
	goto	u6900
u6901:
	goto	l14692
u6900:
	line	259
	
l14630:	
;main.c: 258: {
;main.c: 259: flag_send_data=1;
	bcf	status, 5	;RP0=0, select bank2
	bsf	status, 6	;RP1=1, select bank2
	clrf	(main@flag_send_data)^0100h
	bsf	status,0
	rlf	(main@flag_send_data)^0100h,f
	goto	l14692
	line	260
	
l4319:	
	line	261
;main.c: 260: }
;main.c: 261: break;
	goto	l14692
	line	263
;main.c: 262: }
;main.c: 263: case 0x0923:
	
l4320:	
	line	265
	
l14632:	
;main.c: 264: {
;main.c: 265: flag_send_data=1;
	clrf	(main@flag_send_data)^0100h
	bsf	status,0
	rlf	(main@flag_send_data)^0100h,f
	line	266
;main.c: 266: break;
	goto	l14692
	line	268
;main.c: 267: }
;main.c: 268: case 0x0909:
	
l4321:	
	line	270
	
l14634:	
;main.c: 269: {
;main.c: 270: if(disp_rxd_length < 8)
	movlw	(08h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	subwf	(_disp_rxd_length),w
	skipnc
	goto	u6911
	goto	u6910
u6911:
	goto	l14638
u6910:
	goto	l14692
	line	272
	
l14636:	
;main.c: 271: {
;main.c: 272: break;
	goto	l14692
	line	273
	
l4322:	
	line	274
	
l14638:	
;main.c: 273: }
;main.c: 274: if(copy_rx_udata[0x04]==my_id_code)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	0+(_copy_rx_udata)^080h+04h,w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	xorwf	(_my_id_code),w
	skipz
	goto	u6921
	goto	u6920
u6921:
	goto	l14642
u6920:
	line	276
	
l14640:	
;main.c: 275: {
;main.c: 276: flag_send_data=1;
	bcf	status, 5	;RP0=0, select bank2
	bsf	status, 6	;RP1=1, select bank2
	clrf	(main@flag_send_data)^0100h
	bsf	status,0
	rlf	(main@flag_send_data)^0100h,f
	goto	l14642
	line	277
	
l4323:	
	line	278
	
l14642:	
;main.c: 277: }
;main.c: 278: TMR1ON = 0;GIE = 0;PEIE = 0;
	bcf	status, 6	;RP1=0, select bank0
	bcf	(128/8),(128)&7
	
l14644:	
	bcf	(95/8),(95)&7
	
l14646:	
	bcf	(94/8),(94)&7
	line	279
;main.c: 279: break;
	goto	l14692
	line	586
;main.c: 280: }
;main.c: 586: case 0x091D:
	
l4324:	
	line	588
	
l14648:	
;main.c: 587: {
;main.c: 588: if(disp_rxd_length<10)
	movlw	(0Ah)
	bcf	status, 6	;RP1=0, select bank0
	subwf	(_disp_rxd_length),w
	skipnc
	goto	u6931
	goto	u6930
u6931:
	goto	l14652
u6930:
	goto	l4326
	line	590
	
l14650:	
;main.c: 589: {
;main.c: 590: return;
	goto	l4326
	line	591
	
l4325:	
	line	592
	
l14652:	
;main.c: 591: }
;main.c: 592: i=0x05;
	movlw	(05h)
	movwf	(??_main+0)+0
	movf	(??_main+0)+0,w
	bcf	status, 5	;RP0=0, select bank2
	bsf	status, 6	;RP1=1, select bank2
	movwf	(main@i)^0100h
	line	593
	
l14654:	
;main.c: 593: if(copy_rx_udata[i]==1)
	movf	(main@i)^0100h,w
	addlw	_copy_rx_udata&0ffh
	movwf	fsr0
	bcf	status, 7	;select IRP bank1
	movf	indf,w
	xorlw	01h
	skipz
	goto	u6941
	goto	u6940
u6941:
	goto	l14664
u6940:
	line	595
	
l14656:	
;main.c: 594: {
;main.c: 595: i++;
	movlw	(01h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_main+0)+0
	movf	(??_main+0)+0,w
	bcf	status, 5	;RP0=0, select bank2
	bsf	status, 6	;RP1=1, select bank2
	addwf	(main@i)^0100h,f
	line	596
	
l14658:	
;main.c: 596: if(copy_rx_udata[i]<=8)
	movf	(main@i)^0100h,w
	addlw	_copy_rx_udata&0ffh
	movwf	fsr0
	movlw	(09h)
	subwf	indf,w
	skipnc
	goto	u6951
	goto	u6950
u6951:
	goto	l14662
u6950:
	line	598
	
l14660:	
;main.c: 597: {
;main.c: 598: ntp_info.test_mode1 = copy_rx_udata[i];
	movf	(main@i)^0100h,w
	addlw	_copy_rx_udata&0ffh
	movwf	fsr0
	movf	indf,w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_main+0)+0
	movf	(??_main+0)+0,w
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(_ntp_info)^080h
	line	599
;main.c: 599: }
	goto	l14684
	line	600
	
l4328:	
	line	602
	
l14662:	
;main.c: 600: else
;main.c: 601: {
;main.c: 602: flag_temp++;
	movlw	(01h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_main+0)+0
	movf	(??_main+0)+0,w
	bcf	status, 5	;RP0=0, select bank2
	bsf	status, 6	;RP1=1, select bank2
	addwf	(main@flag_temp)^0100h,f
	goto	l14684
	line	603
	
l4329:	
	line	604
;main.c: 603: }
;main.c: 604: }
	goto	l14684
	line	605
	
l4327:	
	
l14664:	
;main.c: 605: else if(copy_rx_udata[i]==2)
	movf	(main@i)^0100h,w
	addlw	_copy_rx_udata&0ffh
	movwf	fsr0
	movf	indf,w
	xorlw	02h
	skipz
	goto	u6961
	goto	u6960
u6961:
	goto	l14674
u6960:
	line	607
	
l14666:	
;main.c: 606: {
;main.c: 607: i++;
	movlw	(01h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_main+0)+0
	movf	(??_main+0)+0,w
	bcf	status, 5	;RP0=0, select bank2
	bsf	status, 6	;RP1=1, select bank2
	addwf	(main@i)^0100h,f
	line	608
	
l14668:	
;main.c: 608: if(copy_rx_udata[i]<=8)
	movf	(main@i)^0100h,w
	addlw	_copy_rx_udata&0ffh
	movwf	fsr0
	movlw	(09h)
	subwf	indf,w
	skipnc
	goto	u6971
	goto	u6970
u6971:
	goto	l14672
u6970:
	line	610
	
l14670:	
;main.c: 609: {
;main.c: 610: ntp_info.test_mode2 = copy_rx_udata[i];
	movf	(main@i)^0100h,w
	addlw	_copy_rx_udata&0ffh
	movwf	fsr0
	movf	indf,w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_main+0)+0
	movf	(??_main+0)+0,w
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	0+(_ntp_info)^080h+01h
	line	611
;main.c: 611: }
	goto	l14684
	line	612
	
l4332:	
	line	614
	
l14672:	
;main.c: 612: else
;main.c: 613: {
;main.c: 614: flag_temp++;
	movlw	(01h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_main+0)+0
	movf	(??_main+0)+0,w
	bcf	status, 5	;RP0=0, select bank2
	bsf	status, 6	;RP1=1, select bank2
	addwf	(main@flag_temp)^0100h,f
	goto	l14684
	line	615
	
l4333:	
	line	616
;main.c: 615: }
;main.c: 616: }
	goto	l14684
	line	617
	
l4331:	
	
l14674:	
;main.c: 617: else if(copy_rx_udata[i]==0XFF)
	movf	(main@i)^0100h,w
	addlw	_copy_rx_udata&0ffh
	movwf	fsr0
	movf	indf,w
	xorlw	0FFh
	skipz
	goto	u6981
	goto	u6980
u6981:
	goto	l14684
u6980:
	line	619
	
l14676:	
;main.c: 618: {
;main.c: 619: i++;
	movlw	(01h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_main+0)+0
	movf	(??_main+0)+0,w
	bcf	status, 5	;RP0=0, select bank2
	bsf	status, 6	;RP1=1, select bank2
	addwf	(main@i)^0100h,f
	line	620
	
l14678:	
;main.c: 620: if(copy_rx_udata[i]<=8)
	movf	(main@i)^0100h,w
	addlw	_copy_rx_udata&0ffh
	movwf	fsr0
	movlw	(09h)
	subwf	indf,w
	skipnc
	goto	u6991
	goto	u6990
u6991:
	goto	l14682
u6990:
	line	622
	
l14680:	
;main.c: 621: {
;main.c: 622: ntp_info.test_mode1 = copy_rx_udata[i];
	movf	(main@i)^0100h,w
	addlw	_copy_rx_udata&0ffh
	movwf	fsr0
	movf	indf,w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_main+0)+0
	movf	(??_main+0)+0,w
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(_ntp_info)^080h
	line	623
;main.c: 623: ntp_info.test_mode2 = copy_rx_udata[i];
	bcf	status, 5	;RP0=0, select bank2
	bsf	status, 6	;RP1=1, select bank2
	movf	(main@i)^0100h,w
	addlw	_copy_rx_udata&0ffh
	movwf	fsr0
	movf	indf,w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_main+0)+0
	movf	(??_main+0)+0,w
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	0+(_ntp_info)^080h+01h
	line	624
;main.c: 624: }
	goto	l14684
	line	625
	
l4336:	
	line	627
	
l14682:	
;main.c: 625: else
;main.c: 626: {
;main.c: 627: flag_temp++;
	movlw	(01h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_main+0)+0
	movf	(??_main+0)+0,w
	bcf	status, 5	;RP0=0, select bank2
	bsf	status, 6	;RP1=1, select bank2
	addwf	(main@flag_temp)^0100h,f
	goto	l14684
	line	628
	
l4337:	
	goto	l14684
	line	629
	
l4335:	
	goto	l14684
	line	632
	
l4334:	
	goto	l14684
	
l4330:	
	
l14684:	
;main.c: 628: }
;main.c: 629: }
;main.c: 632: if(copy_rx_udata[0x04]==my_id_code)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	0+(_copy_rx_udata)^080h+04h,w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	xorwf	(_my_id_code),w
	skipz
	goto	u7001
	goto	u7000
u7001:
	goto	l14692
u7000:
	line	634
	
l14686:	
;main.c: 633: {
;main.c: 634: flag_send_data=1;
	bcf	status, 5	;RP0=0, select bank2
	bsf	status, 6	;RP1=1, select bank2
	clrf	(main@flag_send_data)^0100h
	bsf	status,0
	rlf	(main@flag_send_data)^0100h,f
	goto	l14692
	line	635
	
l4338:	
	line	637
;main.c: 635: }
;main.c: 637: break;
	goto	l14692
	line	790
	
l14688:	
;main.c: 638: }
;main.c: 790: }
	goto	l14692
	line	173
	
l4311:	
	
l14690:	
	; Switch on 2 bytes has been partitioned into a top level switch of size 1, and 1 sub-switches
; Switch size 1, requested type "space"
; Number of cases is 1, Range of values is 9 to 9
; switch strategies available:
; Name         Bytes Cycles
; simple_byte     4     3 (average)
; direct_byte    21    19 (fixed)
;	Chosen strategy is simple_byte

	movf (main@func+1)^0100h,w
	xorlw	9^0	; case 9
	skipnz
	goto	l14950
	goto	l14692
	
l14950:	
; Switch size 1, requested type "space"
; Number of cases is 5, Range of values is 0 to 35
; switch strategies available:
; Name         Bytes Cycles
; simple_byte    16     9 (average)
; direct_byte    88    16 (fixed)
;	Chosen strategy is simple_byte

	movf (main@func)^0100h,w
	xorlw	0^0	; case 0
	skipnz
	goto	l14564
	xorlw	1^0	; case 1
	skipnz
	goto	l14624
	xorlw	9^1	; case 9
	skipnz
	goto	l14634
	xorlw	29^9	; case 29
	skipnz
	goto	l14648
	xorlw	35^29	; case 35
	skipnz
	goto	l14632
	goto	l14692

	line	790
	
l4314:	
	goto	l14692
	line	793
	
l4310:	
	line	794
	
l14692:	
;main.c: 793: }
;main.c: 794: flag_data_process=FALSE;
	clrc
	movlw	0
	btfsc	status,0
	movlw	1
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(_flag_data_process)^080h
	goto	l14694
	line	795
	
l4309:	
	line	800
	
l14694:	
;main.c: 795: }
;main.c: 800: if(flag_send_data)
	bcf	status, 5	;RP0=0, select bank2
	bsf	status, 6	;RP1=1, select bank2
	movf	(main@flag_send_data)^0100h,w
	skipz
	goto	u7010
	goto	l14802
u7010:
	line	802
	
l14696:	
;main.c: 801: {
;main.c: 802: i = 0;
	clrc
	movlw	0
	btfsc	status,0
	movlw	1
	movwf	(main@i)^0100h
	line	803
	
l14698:	
;main.c: 803: tx_udata[i++] = 0xD3;
	movlw	(0D3h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_main+0)+0
	bcf	status, 5	;RP0=0, select bank2
	bsf	status, 6	;RP1=1, select bank2
	movf	(main@i)^0100h,w
	addlw	_tx_udata&0ffh
	movwf	fsr0
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(??_main+0)+0,w
	bcf	status, 7	;select IRP bank1
	movwf	indf
	
l14700:	
	movlw	(01h)
	movwf	(??_main+0)+0
	movf	(??_main+0)+0,w
	bcf	status, 5	;RP0=0, select bank2
	bsf	status, 6	;RP1=1, select bank2
	addwf	(main@i)^0100h,f
	line	804
	
l14702:	
;main.c: 804: len_cnt = i;
	movf	(main@i)^0100h,w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_main+0)+0
	movf	(??_main+0)+0,w
	bcf	status, 5	;RP0=0, select bank2
	bsf	status, 6	;RP1=1, select bank2
	movwf	(main@len_cnt)^0100h
	line	805
	
l14704:	
;main.c: 805: i++;
	movlw	(01h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_main+0)+0
	movf	(??_main+0)+0,w
	bcf	status, 5	;RP0=0, select bank2
	bsf	status, 6	;RP1=1, select bank2
	addwf	(main@i)^0100h,f
	line	806
	
l14706:	
;main.c: 806: copy_func = func+1;
	movf	(main@func)^0100h,w
	addlw	low(01h)
	movwf	(main@copy_func)^0100h
	movf	(main@func+1)^0100h,w
	skipnc
	addlw	1
	addlw	high(01h)
	movwf	1+(main@copy_func)^0100h
	line	807
	
l14708:	
;main.c: 807: tx_udata[i++] = copy_func>>8;
	movf	(main@copy_func+1)^0100h,w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_main+0)+0
	bcf	status, 5	;RP0=0, select bank2
	bsf	status, 6	;RP1=1, select bank2
	movf	(main@i)^0100h,w
	addlw	_tx_udata&0ffh
	movwf	fsr0
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(??_main+0)+0,w
	movwf	indf
	
l14710:	
	movlw	(01h)
	movwf	(??_main+0)+0
	movf	(??_main+0)+0,w
	bcf	status, 5	;RP0=0, select bank2
	bsf	status, 6	;RP1=1, select bank2
	addwf	(main@i)^0100h,f
	line	808
	
l14712:	
;main.c: 808: tx_udata[i++] = copy_func&0x00ff;
	movf	(main@copy_func)^0100h,w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_main+0)+0
	bcf	status, 5	;RP0=0, select bank2
	bsf	status, 6	;RP1=1, select bank2
	movf	(main@i)^0100h,w
	addlw	_tx_udata&0ffh
	movwf	fsr0
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(??_main+0)+0,w
	movwf	indf
	
l14714:	
	movlw	(01h)
	movwf	(??_main+0)+0
	movf	(??_main+0)+0,w
	bcf	status, 5	;RP0=0, select bank2
	bsf	status, 6	;RP1=1, select bank2
	addwf	(main@i)^0100h,f
	line	809
	
l14716:	
;main.c: 809: tx_udata[i++] = my_id_code;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(_my_id_code),w
	movwf	(??_main+0)+0
	bcf	status, 5	;RP0=0, select bank2
	bsf	status, 6	;RP1=1, select bank2
	movf	(main@i)^0100h,w
	addlw	_tx_udata&0ffh
	movwf	fsr0
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(??_main+0)+0,w
	movwf	indf
	
l14718:	
	movlw	(01h)
	movwf	(??_main+0)+0
	movf	(??_main+0)+0,w
	bcf	status, 5	;RP0=0, select bank2
	bsf	status, 6	;RP1=1, select bank2
	addwf	(main@i)^0100h,f
	line	810
;main.c: 810: switch(func)
	goto	l14764
	line	812
;main.c: 811: {
;main.c: 812: case 0x0901:
	
l4341:	
	line	814
	
l14720:	
;main.c: 813: {
;main.c: 814: if(flag_jiaoshi)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(_flag_jiaoshi),w
	skipz
	goto	u7020
	goto	l14726
u7020:
	line	816
	
l14722:	
;main.c: 815: {
;main.c: 816: tx_udata[i++] = 0;
	clrc
	bcf	status, 5	;RP0=0, select bank2
	bsf	status, 6	;RP1=1, select bank2
	movf	(main@i)^0100h,w
	addlw	_tx_udata&0ffh
	movwf	fsr0
	movlw	0
	btfsc	status,0
	movlw	1
	movwf	indf
	
l14724:	
	movlw	(01h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_main+0)+0
	movf	(??_main+0)+0,w
	bcf	status, 5	;RP0=0, select bank2
	bsf	status, 6	;RP1=1, select bank2
	addwf	(main@i)^0100h,f
	line	817
;main.c: 817: }
	goto	l14730
	line	818
	
l4342:	
	line	820
	
l14726:	
;main.c: 818: else
;main.c: 819: {
;main.c: 820: tx_udata[i++] = 0x08;
	movlw	(08h)
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_main+0)+0
	bcf	status, 5	;RP0=0, select bank2
	bsf	status, 6	;RP1=1, select bank2
	movf	(main@i)^0100h,w
	addlw	_tx_udata&0ffh
	movwf	fsr0
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(??_main+0)+0,w
	movwf	indf
	
l14728:	
	movlw	(01h)
	movwf	(??_main+0)+0
	movf	(??_main+0)+0,w
	bcf	status, 5	;RP0=0, select bank2
	bsf	status, 6	;RP1=1, select bank2
	addwf	(main@i)^0100h,f
	goto	l14730
	line	821
	
l4343:	
	line	823
	
l14730:	
;main.c: 821: }
;main.c: 823: tx_udata[i]=0x00 | 0x20;
	movlw	(020h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_main+0)+0
	bcf	status, 5	;RP0=0, select bank2
	bsf	status, 6	;RP1=1, select bank2
	movf	(main@i)^0100h,w
	addlw	_tx_udata&0ffh
	movwf	fsr0
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(??_main+0)+0,w
	movwf	indf
	line	833
	
l14732:	
;main.c: 832: {
;main.c: 833: tx_udata[i++] |= 0x10;
	bcf	status, 5	;RP0=0, select bank2
	bsf	status, 6	;RP1=1, select bank2
	movf	(main@i)^0100h,w
	addlw	_tx_udata&0ffh
	movwf	fsr0
	bsf	indf+(4/8),(4)&7
	
l14734:	
	movlw	(01h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_main+0)+0
	movf	(??_main+0)+0,w
	bcf	status, 5	;RP0=0, select bank2
	bsf	status, 6	;RP1=1, select bank2
	addwf	(main@i)^0100h,f
	line	843
;main.c: 834: }
;main.c: 843: break;
	goto	l14766
	line	845
;main.c: 844: }
;main.c: 845: case 0x0923:
	
l4345:	
	line	848
	
l14736:	
;main.c: 846: {
;main.c: 848: tx_udata[i++] = 0x0008>>8;
	clrc
	movf	(main@i)^0100h,w
	addlw	_tx_udata&0ffh
	movwf	fsr0
	movlw	0
	btfsc	status,0
	movlw	1
	movwf	indf
	
l14738:	
	movlw	(01h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_main+0)+0
	movf	(??_main+0)+0,w
	bcf	status, 5	;RP0=0, select bank2
	bsf	status, 6	;RP1=1, select bank2
	addwf	(main@i)^0100h,f
	line	849
	
l14740:	
;main.c: 849: tx_udata[i++] = 0x0008&0x00ff;
	movlw	(08h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_main+0)+0
	bcf	status, 5	;RP0=0, select bank2
	bsf	status, 6	;RP1=1, select bank2
	movf	(main@i)^0100h,w
	addlw	_tx_udata&0ffh
	movwf	fsr0
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(??_main+0)+0,w
	movwf	indf
	movlw	(01h)
	movwf	(??_main+0)+0
	movf	(??_main+0)+0,w
	bcf	status, 5	;RP0=0, select bank2
	bsf	status, 6	;RP1=1, select bank2
	addwf	(main@i)^0100h,f
	line	850
;main.c: 850: break;
	goto	l14766
	line	852
;main.c: 851: }
;main.c: 852: case 0x0909:
	
l4346:	
	line	854
	
l14742:	
;main.c: 853: {
;main.c: 854: tx_udata[i++] = 1;
	movf	(main@i)^0100h,w
	addlw	_tx_udata&0ffh
	movwf	fsr0
	clrf	indf
	bsf	status,0
	rlf	indf,f
	
l14744:	
	movlw	(01h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_main+0)+0
	movf	(??_main+0)+0,w
	bcf	status, 5	;RP0=0, select bank2
	bsf	status, 6	;RP1=1, select bank2
	addwf	(main@i)^0100h,f
	line	855
	
l14746:	
;main.c: 855: TMR1ON = 0;GIE = 0;PEIE = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(128/8),(128)&7
	
l14748:	
	bcf	(95/8),(95)&7
	
l14750:	
	bcf	(94/8),(94)&7
	line	856
;main.c: 856: break;
	goto	l14766
	line	861
;main.c: 857: }
;main.c: 861: case 0x0919:
	
l4347:	
	goto	l14752
	line	866
	
l4348:	
	line	872
	
l14752:	
;main.c: 866: case 0x091D:
;main.c: 871: {
;main.c: 872: if(flag_temp)
	bcf	status, 5	;RP0=0, select bank2
	bsf	status, 6	;RP1=1, select bank2
	movf	(main@flag_temp)^0100h,w
	skipz
	goto	u7030
	goto	l14758
u7030:
	line	874
	
l14754:	
;main.c: 873: {
;main.c: 874: tx_udata[i++]=0;
	clrc
	movf	(main@i)^0100h,w
	addlw	_tx_udata&0ffh
	movwf	fsr0
	movlw	0
	btfsc	status,0
	movlw	1
	movwf	indf
	
l14756:	
	movlw	(01h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_main+0)+0
	movf	(??_main+0)+0,w
	bcf	status, 5	;RP0=0, select bank2
	bsf	status, 6	;RP1=1, select bank2
	addwf	(main@i)^0100h,f
	line	875
;main.c: 875: }
	goto	l14766
	line	876
	
l4349:	
	line	878
	
l14758:	
;main.c: 876: else
;main.c: 877: {
;main.c: 878: tx_udata[i++]=1;
	movf	(main@i)^0100h,w
	addlw	_tx_udata&0ffh
	movwf	fsr0
	clrf	indf
	bsf	status,0
	rlf	indf,f
	
l14760:	
	movlw	(01h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_main+0)+0
	movf	(??_main+0)+0,w
	bcf	status, 5	;RP0=0, select bank2
	bsf	status, 6	;RP1=1, select bank2
	addwf	(main@i)^0100h,f
	goto	l14766
	line	879
	
l4350:	
	line	880
;main.c: 879: }
;main.c: 880: break;
	goto	l14766
	line	884
	
l14762:	
;main.c: 881: }
;main.c: 884: }
	goto	l14766
	line	810
	
l4340:	
	
l14764:	
	; Switch on 2 bytes has been partitioned into a top level switch of size 1, and 1 sub-switches
; Switch size 1, requested type "space"
; Number of cases is 1, Range of values is 9 to 9
; switch strategies available:
; Name         Bytes Cycles
; simple_byte     4     3 (average)
; direct_byte    21    19 (fixed)
;	Chosen strategy is simple_byte

	movf (main@func+1)^0100h,w
	xorlw	9^0	; case 9
	skipnz
	goto	l14952
	goto	l14766
	
l14952:	
; Switch size 1, requested type "space"
; Number of cases is 5, Range of values is 1 to 35
; switch strategies available:
; Name         Bytes Cycles
; simple_byte    16     9 (average)
; direct_byte    89    19 (fixed)
;	Chosen strategy is simple_byte

	movf (main@func)^0100h,w
	xorlw	1^0	; case 1
	skipnz
	goto	l14720
	xorlw	9^1	; case 9
	skipnz
	goto	l14742
	xorlw	25^9	; case 25
	skipnz
	goto	l14752
	xorlw	29^25	; case 29
	skipnz
	goto	l14752
	xorlw	35^29	; case 35
	skipnz
	goto	l14736
	goto	l14766

	line	884
	
l4344:	
	line	885
	
l14766:	
;main.c: 885: tx_udata[len_cnt] = i-len_cnt -1;
	bcf	status, 5	;RP0=0, select bank2
	bsf	status, 6	;RP1=1, select bank2
	decf	(main@len_cnt)^0100h,w
	xorlw	0ffh
	addwf	(main@i)^0100h,w
	addlw	0FFh
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_main+0)+0
	bcf	status, 5	;RP0=0, select bank2
	bsf	status, 6	;RP1=1, select bank2
	movf	(main@len_cnt)^0100h,w
	addlw	_tx_udata&0ffh
	movwf	fsr0
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(??_main+0)+0,w
	movwf	indf
	line	886
	
l14768:	
;main.c: 886: chk_value = MakeCRC16(&tx_udata[0],i);
	bcf	status, 5	;RP0=0, select bank2
	bsf	status, 6	;RP1=1, select bank2
	movf	(main@i)^0100h,w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_main+0)+0
	movf	(??_main+0)+0,w
	movwf	(?_MakeCRC16)
	movlw	(_tx_udata)&0ffh
	fcall	_MakeCRC16
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(1+(?_MakeCRC16)),w
	bcf	status, 5	;RP0=0, select bank2
	bsf	status, 6	;RP1=1, select bank2
	clrf	(main@chk_value+1)^0100h
	addwf	(main@chk_value+1)^0100h
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(0+(?_MakeCRC16)),w
	bcf	status, 5	;RP0=0, select bank2
	bsf	status, 6	;RP1=1, select bank2
	clrf	(main@chk_value)^0100h
	addwf	(main@chk_value)^0100h

	line	887
	
l14770:	
;main.c: 887: tx_udata[i++] = chk_value / 256;
	movf	(main@chk_value+1)^0100h,w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_main+0)+0
	bcf	status, 5	;RP0=0, select bank2
	bsf	status, 6	;RP1=1, select bank2
	movf	(main@i)^0100h,w
	addlw	_tx_udata&0ffh
	movwf	fsr0
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(??_main+0)+0,w
	bcf	status, 7	;select IRP bank1
	movwf	indf
	
l14772:	
	movlw	(01h)
	movwf	(??_main+0)+0
	movf	(??_main+0)+0,w
	bcf	status, 5	;RP0=0, select bank2
	bsf	status, 6	;RP1=1, select bank2
	addwf	(main@i)^0100h,f
	line	888
	
l14774:	
;main.c: 888: tx_udata[i++] = chk_value % 256;
	movf	(main@chk_value)^0100h,w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_main+0)+0
	bcf	status, 5	;RP0=0, select bank2
	bsf	status, 6	;RP1=1, select bank2
	movf	(main@i)^0100h,w
	addlw	_tx_udata&0ffh
	movwf	fsr0
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(??_main+0)+0,w
	movwf	indf
	
l14776:	
	movlw	(01h)
	movwf	(??_main+0)+0
	movf	(??_main+0)+0,w
	bcf	status, 5	;RP0=0, select bank2
	bsf	status, 6	;RP1=1, select bank2
	addwf	(main@i)^0100h,f
	line	889
	
l14778:	
;main.c: 889: tx_udata[i++] = 0xD8;
	movlw	(0D8h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_main+0)+0
	bcf	status, 5	;RP0=0, select bank2
	bsf	status, 6	;RP1=1, select bank2
	movf	(main@i)^0100h,w
	addlw	_tx_udata&0ffh
	movwf	fsr0
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(??_main+0)+0,w
	movwf	indf
	
l14780:	
	movlw	(01h)
	movwf	(??_main+0)+0
	movf	(??_main+0)+0,w
	bcf	status, 5	;RP0=0, select bank2
	bsf	status, 6	;RP1=1, select bank2
	addwf	(main@i)^0100h,f
	line	890
	
l14782:	
;main.c: 890: RB0 = 1;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(48/8),(48)&7
	line	891
	
l14784:	
# 891 "E:\Projects\COLOCK\Master_sub_slock\yzj\programe_updata\SZZ485_V1.4\source\main.c"
nop ;#
psect	maintext
	
l14786:	
# 891 "E:\Projects\COLOCK\Master_sub_slock\yzj\programe_updata\SZZ485_V1.4\source\main.c"
nop ;#
psect	maintext
	line	892
	
l14788:	
;main.c: 892: for(j = 0;j<i;j++)
	clrc
	movlw	0
	btfsc	status,0
	movlw	1
	bcf	status, 5	;RP0=0, select bank2
	bsf	status, 6	;RP1=1, select bank2
	movwf	(main@j)^0100h
	goto	l14794
	line	893
	
l4352:	
	line	894
	
l14790:	
;main.c: 893: {
;main.c: 894: putch(tx_udata[j]);
	movf	(main@j)^0100h,w
	addlw	_tx_udata&0ffh
	movwf	fsr0
	bcf	status, 7	;select IRP bank1
	movf	indf,w
	fcall	_putch
	line	892
	
l14792:	
	movlw	(01h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_main+0)+0
	movf	(??_main+0)+0,w
	bcf	status, 5	;RP0=0, select bank2
	bsf	status, 6	;RP1=1, select bank2
	addwf	(main@j)^0100h,f
	goto	l14794
	
l4351:	
	
l14794:	
	movf	(main@i)^0100h,w
	subwf	(main@j)^0100h,w
	skipc
	goto	u7041
	goto	u7040
u7041:
	goto	l14790
u7040:
	
l4353:	
	line	896
# 896 "E:\Projects\COLOCK\Master_sub_slock\yzj\programe_updata\SZZ485_V1.4\source\main.c"
nop ;#
# 896 "E:\Projects\COLOCK\Master_sub_slock\yzj\programe_updata\SZZ485_V1.4\source\main.c"
nop ;#
psect	maintext
	line	897
;main.c: 897: while(!TRMT);RB0 = 0;
	goto	l4354
	
l4355:	
	
l4354:	
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	btfss	(1217/8)^080h,(1217)&7
	goto	u7051
	goto	u7050
u7051:
	goto	l4354
u7050:
	
l4356:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(48/8),(48)&7
	goto	l14802
	line	898
	
l4339:	
	line	900
;main.c: 898: }
;main.c: 900: switch(flag_save_data)
	goto	l14802
	line	902
;main.c: 901: {
;main.c: 902: case 1:
	
l4358:	
	line	904
	
l14796:	
;main.c: 903: {
;main.c: 904: settime();
	fcall	_settime
	line	905
	
l14798:	
;main.c: 905: calc_zone();
	fcall	_calc_zone
	line	906
;main.c: 906: break;
	goto	l14804
	line	1005
	
l14800:	
;main.c: 907: }
;main.c: 1005: }
	goto	l14804
	line	900
	
l4357:	
	
l14802:	
	bcf	status, 5	;RP0=0, select bank2
	bsf	status, 6	;RP1=1, select bank2
	movf	(main@flag_save_data)^0100h,w
	; Switch size 1, requested type "space"
; Number of cases is 1, Range of values is 1 to 1
; switch strategies available:
; Name         Bytes Cycles
; simple_byte     4     3 (average)
; direct_byte    21    19 (fixed)
;	Chosen strategy is simple_byte

	xorlw	1^0	; case 1
	skipnz
	goto	l14796
	goto	l14804

	line	1005
	
l4359:	
	line	1011
	
l14804:	
;main.c: 1011: if(up_time_flag)
	movf	(_up_time_flag),w
	skipz
	goto	u7060
	goto	l14838
u7060:
	line	1013
	
l14806:	
;main.c: 1012: {
;main.c: 1013: up_time_flag--;
	movlw	low(01h)
	subwf	(_up_time_flag),f
	line	1014
	
l14808:	
;main.c: 1014: up_led_display=1;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	clrf	(_up_led_display)^080h
	bsf	status,0
	rlf	(_up_led_display)^080h,f
	line	1015
;main.c: 1015: if(jiaoshi_cnt >= 120)
	movlw	(078h)
	subwf	(_jiaoshi_cnt)^080h,w
	skipc
	goto	u7071
	goto	u7070
u7071:
	goto	l14812
u7070:
	line	1017
	
l14810:	
;main.c: 1016: {
;main.c: 1017: flag_jiaoshi = FALSE;
	clrc
	movlw	0
	btfsc	status,0
	movlw	1
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(_flag_jiaoshi)
	line	1018
;main.c: 1018: }
	goto	l14814
	line	1019
	
l4361:	
	line	1021
	
l14812:	
;main.c: 1019: else
;main.c: 1020: {
;main.c: 1021: jiaoshi_cnt++;
	movlw	(01h)
	bcf	status, 5	;RP0=0, select bank0
	movwf	(??_main+0)+0
	movf	(??_main+0)+0,w
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	addwf	(_jiaoshi_cnt)^080h,f
	goto	l14814
	line	1022
	
l4362:	
	line	1027
	
l14814:	
;main.c: 1022: }
;main.c: 1027: if(up_date_flag==2)
	bcf	status, 5	;RP0=0, select bank0
	movf	(_up_date_flag),w
	xorlw	02h
	skipz
	goto	u7081
	goto	u7080
u7081:
	goto	l14818
u7080:
	line	1030
	
l14816:	
;main.c: 1028: {
;main.c: 1030: date_dec(&old_date);
	movlw	(_old_date)&0ffh
	fcall	_date_dec
	line	1031
;main.c: 1031: }
	goto	l4364
	line	1032
	
l4363:	
	
l14818:	
;main.c: 1032: else if(up_date_flag==1)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(_up_date_flag),w
	xorlw	01h
	skipz
	goto	u7091
	goto	u7090
u7091:
	goto	l4364
u7090:
	line	1034
	
l14820:	
;main.c: 1033: {
;main.c: 1034: date_add(&old_date);
	movlw	(_old_date)&0ffh
	fcall	_date_add
	goto	l4364
	line	1035
	
l4365:	
	line	1036
	
l4364:	
;main.c: 1035: }
;main.c: 1036: up_date_flag=time_add(&old_time);
	movlw	(_old_time)&0ffh
	fcall	_time_add
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_main+0)+0
	movf	(??_main+0)+0,w
	movwf	(_up_date_flag)
	line	1044
	
l14822:	
;main.c: 1044: if((old_time.hour == 3) && (old_time.min == 26) && (old_time.sec == 13))
	movf	(_old_time),w
	xorlw	03h
	skipz
	goto	u7101
	goto	u7100
u7101:
	goto	l14830
u7100:
	
l14824:	
	movf	0+(_old_time)+01h,w
	xorlw	01Ah
	skipz
	goto	u7111
	goto	u7110
u7111:
	goto	l14830
u7110:
	
l14826:	
	movf	0+(_old_time)+02h,w
	xorlw	0Dh
	skipz
	goto	u7121
	goto	u7120
u7121:
	goto	l14830
u7120:
	line	1046
	
l14828:	
;main.c: 1045: {
;main.c: 1046: TMR1ON = 0;GIE = 0;PEIE = 0;
	bcf	(128/8),(128)&7
	bcf	(95/8),(95)&7
	bcf	(94/8),(94)&7
	goto	l14830
	line	1047
	
l4366:	
	line	1048
	
l14830:	
;main.c: 1047: }
;main.c: 1048: if((old_time.sec == 10) && (old_time.min == 10))
	movf	0+(_old_time)+02h,w
	xorlw	0Ah
	skipz
	goto	u7131
	goto	u7130
u7131:
	goto	l14836
u7130:
	
l14832:	
	movf	0+(_old_time)+01h,w
	xorlw	0Ah
	skipz
	goto	u7141
	goto	u7140
u7141:
	goto	l14836
u7140:
	line	1050
	
l14834:	
;main.c: 1049: {
;main.c: 1050: get_time();
	fcall	_get_time
	goto	l14836
	line	1051
	
l4367:	
	line	1053
	
l14836:	
# 1053 "E:\Projects\COLOCK\Master_sub_slock\yzj\programe_updata\SZZ485_V1.4\source\main.c"
clrwdt ;#
psect	maintext
	goto	l14838
	line	1081
	
l4360:	
	line	1083
	
l14838:	
;main.c: 1081: }
;main.c: 1083: if(up_led_display==1)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(_up_led_display)^080h,w
	xorlw	01h
	skipz
	goto	u7151
	goto	u7150
u7151:
	goto	l14512
u7150:
	line	1085
	
l14840:	
;main.c: 1084: {
;main.c: 1085: up_led_display=0;
	clrc
	movlw	0
	btfsc	status,0
	movlw	1
	movwf	(_up_led_display)^080h
	line	1106
	
l14842:	
;main.c: 1105: {
;main.c: 1106: if(flag_jiaoshi == TRUE)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(_flag_jiaoshi),w
	xorlw	01h
	skipz
	goto	u7161
	goto	u7160
u7161:
	goto	l14850
u7160:
	line	1108
	
l14844:	
;main.c: 1107: {
;main.c: 1108: if((old_time.sec % 2 ) == 0)
	btfsc	0+(_old_time)+02h,(0)&7
	goto	u7171
	goto	u7170
u7171:
	goto	l14848
u7170:
	line	1110
	
l14846:	
;main.c: 1109: {
;main.c: 1110: flag_dian1 = FALSE;
	clrc
	movlw	0
	btfsc	status,0
	movlw	1
	movwf	(_flag_dian1)
	line	1111
;main.c: 1111: }
	goto	l14852
	line	1112
	
l4370:	
	line	1114
	
l14848:	
;main.c: 1112: else
;main.c: 1113: {
;main.c: 1114: flag_dian1 = TRUE;
	clrf	(_flag_dian1)
	bsf	status,0
	rlf	(_flag_dian1),f
	goto	l14852
	line	1115
	
l4371:	
	line	1116
;main.c: 1115: }
;main.c: 1116: }
	goto	l14852
	line	1117
	
l4369:	
	line	1119
	
l14850:	
;main.c: 1117: else
;main.c: 1118: {
;main.c: 1119: flag_dian1 = TRUE;
	clrf	(_flag_dian1)
	bsf	status,0
	rlf	(_flag_dian1),f
	goto	l14852
	line	1120
	
l4372:	
	line	1145
	
l14852:	
;main.c: 1120: }
;main.c: 1121: }
;main.c: 1144: {
;main.c: 1145: if(flag_jiaoshi == TRUE)
	movf	(_flag_jiaoshi),w
	xorlw	01h
	skipz
	goto	u7181
	goto	u7180
u7181:
	goto	l14860
u7180:
	line	1147
	
l14854:	
;main.c: 1146: {
;main.c: 1147: if((old_time.sec % 2 ) == 0)
	btfsc	0+(_old_time)+02h,(0)&7
	goto	u7191
	goto	u7190
u7191:
	goto	l14858
u7190:
	line	1149
	
l14856:	
;main.c: 1148: {
;main.c: 1149: flag_dian2 = FALSE;
	clrc
	movlw	0
	btfsc	status,0
	movlw	1
	movwf	(_flag_dian2)
	line	1150
;main.c: 1150: }
	goto	l14862
	line	1151
	
l4374:	
	line	1153
	
l14858:	
;main.c: 1151: else
;main.c: 1152: {
;main.c: 1153: flag_dian2 = TRUE;
	clrf	(_flag_dian2)
	bsf	status,0
	rlf	(_flag_dian2),f
	goto	l14862
	line	1154
	
l4375:	
	line	1155
;main.c: 1154: }
;main.c: 1155: }
	goto	l14862
	line	1156
	
l4373:	
	line	1158
	
l14860:	
;main.c: 1156: else
;main.c: 1157: {
;main.c: 1158: flag_dian2 = TRUE;
	clrf	(_flag_dian2)
	bsf	status,0
	rlf	(_flag_dian2),f
	goto	l14862
	line	1159
	
l4376:	
	line	1208
	
l14862:	
;main.c: 1159: }
;main.c: 1160: }
;main.c: 1208: disp_data_time[0]=(old_time.min%100)%10;
	movf	0+(_old_time)+01h,w
	movwf	(??_main+0)+0
	clrf	(??_main+0)+0+1
	movf	0+(??_main+0)+0,w
	movwf	0+(?___awmod)+02h
	movf	1+(??_main+0)+0,w
	movwf	1+(?___awmod)+02h
	movlw	low(064h)
	movwf	(?___awmod)
	movlw	high(064h)
	movwf	((?___awmod))+1
	fcall	___awmod
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(1+(?___awmod)),w
	bcf	status, 5	;RP0=0, select bank2
	bsf	status, 6	;RP1=1, select bank2
	clrf	(_main$5113+1)^0100h
	addwf	(_main$5113+1)^0100h
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(0+(?___awmod)),w
	bcf	status, 5	;RP0=0, select bank2
	bsf	status, 6	;RP1=1, select bank2
	clrf	(_main$5113)^0100h
	addwf	(_main$5113)^0100h

	
l14864:	
;main.c: 1159: }
;main.c: 1160: }
;main.c: 1208: disp_data_time[0]=(old_time.min%100)%10;
	movlw	low(0Ah)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(?___awmod)
	movlw	high(0Ah)
	movwf	((?___awmod))+1
	bcf	status, 5	;RP0=0, select bank2
	bsf	status, 6	;RP1=1, select bank2
	movf	(_main$5113+1)^0100h,w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	1+(?___awmod)+02h
	addwf	1+(?___awmod)+02h
	bcf	status, 5	;RP0=0, select bank2
	bsf	status, 6	;RP1=1, select bank2
	movf	(_main$5113)^0100h,w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	0+(?___awmod)+02h
	addwf	0+(?___awmod)+02h

	fcall	___awmod
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(0+(?___awmod)),w
	movwf	(??_main+0)+0
	movf	(??_main+0)+0,w
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(_disp_data_time)^080h
	line	1209
	
l14866:	
;main.c: 1209: disp_data_time[1]=(old_time.min%100)/10;
	movlw	low(0Ah)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(?___awdiv)
	movlw	high(0Ah)
	movwf	((?___awdiv))+1
	movf	0+(_old_time)+01h,w
	movwf	(??_main+0)+0
	clrf	(??_main+0)+0+1
	movf	0+(??_main+0)+0,w
	movwf	0+(?___awmod)+02h
	movf	1+(??_main+0)+0,w
	movwf	1+(?___awmod)+02h
	movlw	low(064h)
	movwf	(?___awmod)
	movlw	high(064h)
	movwf	((?___awmod))+1
	fcall	___awmod
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(1+(?___awmod)),w
	clrf	1+(?___awdiv)+02h
	addwf	1+(?___awdiv)+02h
	movf	(0+(?___awmod)),w
	clrf	0+(?___awdiv)+02h
	addwf	0+(?___awdiv)+02h

	fcall	___awdiv
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(0+(?___awdiv)),w
	movwf	(??_main+2)+0
	movf	(??_main+2)+0,w
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	0+(_disp_data_time)^080h+01h
	line	1210
	
l14868:	
;main.c: 1210: disp_data_time[2]=(old_time.hour%100)%10;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(_old_time),w
	movwf	(??_main+0)+0
	clrf	(??_main+0)+0+1
	movf	0+(??_main+0)+0,w
	movwf	0+(?___awmod)+02h
	movf	1+(??_main+0)+0,w
	movwf	1+(?___awmod)+02h
	movlw	low(064h)
	movwf	(?___awmod)
	movlw	high(064h)
	movwf	((?___awmod))+1
	fcall	___awmod
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(1+(?___awmod)),w
	bcf	status, 5	;RP0=0, select bank2
	bsf	status, 6	;RP1=1, select bank2
	clrf	(_main$5113+1)^0100h
	addwf	(_main$5113+1)^0100h
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(0+(?___awmod)),w
	bcf	status, 5	;RP0=0, select bank2
	bsf	status, 6	;RP1=1, select bank2
	clrf	(_main$5113)^0100h
	addwf	(_main$5113)^0100h

	
l14870:	
;main.c: 1210: disp_data_time[2]=(old_time.hour%100)%10;
	movlw	low(0Ah)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(?___awmod)
	movlw	high(0Ah)
	movwf	((?___awmod))+1
	bcf	status, 5	;RP0=0, select bank2
	bsf	status, 6	;RP1=1, select bank2
	movf	(_main$5113+1)^0100h,w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	1+(?___awmod)+02h
	addwf	1+(?___awmod)+02h
	bcf	status, 5	;RP0=0, select bank2
	bsf	status, 6	;RP1=1, select bank2
	movf	(_main$5113)^0100h,w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	0+(?___awmod)+02h
	addwf	0+(?___awmod)+02h

	fcall	___awmod
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(0+(?___awmod)),w
	movwf	(??_main+0)+0
	movf	(??_main+0)+0,w
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	0+(_disp_data_time)^080h+02h
	line	1211
	
l14872:	
;main.c: 1211: disp_data_time[3]=(old_time.hour%100)/10;
	movlw	low(0Ah)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(?___awdiv)
	movlw	high(0Ah)
	movwf	((?___awdiv))+1
	movf	(_old_time),w
	movwf	(??_main+0)+0
	clrf	(??_main+0)+0+1
	movf	0+(??_main+0)+0,w
	movwf	0+(?___awmod)+02h
	movf	1+(??_main+0)+0,w
	movwf	1+(?___awmod)+02h
	movlw	low(064h)
	movwf	(?___awmod)
	movlw	high(064h)
	movwf	((?___awmod))+1
	fcall	___awmod
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(1+(?___awmod)),w
	clrf	1+(?___awdiv)+02h
	addwf	1+(?___awdiv)+02h
	movf	(0+(?___awmod)),w
	clrf	0+(?___awdiv)+02h
	addwf	0+(?___awdiv)+02h

	fcall	___awdiv
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(0+(?___awdiv)),w
	movwf	(??_main+2)+0
	movf	(??_main+2)+0,w
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	0+(_disp_data_time)^080h+03h
	line	1224
	
l14874:	
;main.c: 1224: up_time1(disp_data_time);
	movlw	(_disp_data_time)&0ffh
	fcall	_up_time1
	line	1227
	
l14876:	
;main.c: 1227: up_time2(disp_data_time);
	movlw	(_disp_data_time)&0ffh
	fcall	_up_time2
	goto	l14512
	line	1229
	
l4368:	
	goto	l14512
	line	1247
	
l4377:	
	line	125
	goto	l14512
	
l4378:	
	line	1248
	
l4326:	
	global	start
	ljmp	start
	opt stack 0
GLOBAL	__end_of_main
	__end_of_main:
;; =============== function _main ends ============

	signat	_main,88
	global	_lcd_init
psect	text1426,local,class=CODE,delta=2
global __ptext1426
__ptext1426:

;; *************** function _lcd_init *****************
;; Defined at:
;;		line 195 in file "E:\Projects\COLOCK\Master_sub_slock\yzj\programe_updata\SZZ485_V1.4\source\led.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK2
;;      Params:         0       0       0       0
;;      Locals:         0       2       0       0
;;      Temps:          0       3       0       0
;;      Totals:         0       5       0       0
;;Total ram usage:        5 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    6
;; This function calls:
;;		___awmod
;;		___awdiv
;;		_up_time1
;;		_up_time2
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text1426
	file	"E:\Projects\COLOCK\Master_sub_slock\yzj\programe_updata\SZZ485_V1.4\source\led.c"
	line	195
	global	__size_of_lcd_init
	__size_of_lcd_init	equ	__end_of_lcd_init-_lcd_init
	
_lcd_init:	
	opt	stack 1
; Regs used in _lcd_init: [wreg-fsr0h+status,2+status,0+pclath+cstack]
	line	196
	
l14478:	
;led.c: 196: TRISC0 = 0;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	bcf	(1080/8)^080h,(1080)&7
	line	197
;led.c: 197: TRISC5 = 0;
	bcf	(1085/8)^080h,(1085)&7
	line	198
;led.c: 198: TRISA5 = 0;
	bcf	(1069/8)^080h,(1069)&7
	line	199
;led.c: 199: TRISC2 = 0;
	bcf	(1082/8)^080h,(1082)&7
	line	200
;led.c: 200: RC2 = 1;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(58/8),(58)&7
	line	201
;led.c: 201: TRISA2 = 0;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	bcf	(1066/8)^080h,(1066)&7
	line	202
;led.c: 202: TRISA3 = 0;
	bcf	(1067/8)^080h,(1067)&7
	line	203
;led.c: 203: TRISA4 = 0;
	bcf	(1068/8)^080h,(1068)&7
	line	204
;led.c: 204: TRISC1 = 0;
	bcf	(1081/8)^080h,(1081)&7
	line	205
;led.c: 205: RC1 = 1;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(57/8),(57)&7
	line	206
	
l14480:	
;led.c: 206: ntp_info.test_mode1 = 0;
	clrc
	movlw	0
	btfsc	status,0
	movlw	1
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(_ntp_info)^080h
	line	207
;led.c: 207: ntp_info.test_mode2 = 0;
	clrc
	movlw	0
	btfsc	status,0
	movlw	1
	movwf	0+(_ntp_info)^080h+01h
	line	208
	
l14482:	
;led.c: 208: disp_data_time[0]=(old_time.min%100)%10;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	0+(_old_time)+01h,w
	movwf	(??_lcd_init+0)+0
	clrf	(??_lcd_init+0)+0+1
	movf	0+(??_lcd_init+0)+0,w
	movwf	0+(?___awmod)+02h
	movf	1+(??_lcd_init+0)+0,w
	movwf	1+(?___awmod)+02h
	movlw	low(064h)
	movwf	(?___awmod)
	movlw	high(064h)
	movwf	((?___awmod))+1
	fcall	___awmod
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(1+(?___awmod)),w
	clrf	(_lcd_init$5112+1)
	addwf	(_lcd_init$5112+1)
	movf	(0+(?___awmod)),w
	clrf	(_lcd_init$5112)
	addwf	(_lcd_init$5112)

	
l14484:	
;led.c: 208: disp_data_time[0]=(old_time.min%100)%10;
	movlw	low(0Ah)
	movwf	(?___awmod)
	movlw	high(0Ah)
	movwf	((?___awmod))+1
	movf	(_lcd_init$5112+1),w
	clrf	1+(?___awmod)+02h
	addwf	1+(?___awmod)+02h
	movf	(_lcd_init$5112),w
	clrf	0+(?___awmod)+02h
	addwf	0+(?___awmod)+02h

	fcall	___awmod
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(0+(?___awmod)),w
	movwf	(??_lcd_init+0)+0
	movf	(??_lcd_init+0)+0,w
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(_disp_data_time)^080h
	line	209
	
l14486:	
;led.c: 209: disp_data_time[1]=(old_time.min%100)/10;
	movlw	low(0Ah)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(?___awdiv)
	movlw	high(0Ah)
	movwf	((?___awdiv))+1
	movf	0+(_old_time)+01h,w
	movwf	(??_lcd_init+0)+0
	clrf	(??_lcd_init+0)+0+1
	movf	0+(??_lcd_init+0)+0,w
	movwf	0+(?___awmod)+02h
	movf	1+(??_lcd_init+0)+0,w
	movwf	1+(?___awmod)+02h
	movlw	low(064h)
	movwf	(?___awmod)
	movlw	high(064h)
	movwf	((?___awmod))+1
	fcall	___awmod
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(1+(?___awmod)),w
	clrf	1+(?___awdiv)+02h
	addwf	1+(?___awdiv)+02h
	movf	(0+(?___awmod)),w
	clrf	0+(?___awdiv)+02h
	addwf	0+(?___awdiv)+02h

	fcall	___awdiv
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(0+(?___awdiv)),w
	movwf	(??_lcd_init+2)+0
	movf	(??_lcd_init+2)+0,w
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	0+(_disp_data_time)^080h+01h
	line	210
	
l14488:	
;led.c: 210: disp_data_time[2]=(old_time.hour%100)%10;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(_old_time),w
	movwf	(??_lcd_init+0)+0
	clrf	(??_lcd_init+0)+0+1
	movf	0+(??_lcd_init+0)+0,w
	movwf	0+(?___awmod)+02h
	movf	1+(??_lcd_init+0)+0,w
	movwf	1+(?___awmod)+02h
	movlw	low(064h)
	movwf	(?___awmod)
	movlw	high(064h)
	movwf	((?___awmod))+1
	fcall	___awmod
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(1+(?___awmod)),w
	clrf	(_lcd_init$5112+1)
	addwf	(_lcd_init$5112+1)
	movf	(0+(?___awmod)),w
	clrf	(_lcd_init$5112)
	addwf	(_lcd_init$5112)

	
l14490:	
;led.c: 210: disp_data_time[2]=(old_time.hour%100)%10;
	movlw	low(0Ah)
	movwf	(?___awmod)
	movlw	high(0Ah)
	movwf	((?___awmod))+1
	movf	(_lcd_init$5112+1),w
	clrf	1+(?___awmod)+02h
	addwf	1+(?___awmod)+02h
	movf	(_lcd_init$5112),w
	clrf	0+(?___awmod)+02h
	addwf	0+(?___awmod)+02h

	fcall	___awmod
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(0+(?___awmod)),w
	movwf	(??_lcd_init+0)+0
	movf	(??_lcd_init+0)+0,w
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	0+(_disp_data_time)^080h+02h
	line	211
	
l14492:	
;led.c: 211: disp_data_time[3]=(old_time.hour%100)/10;
	movlw	low(0Ah)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(?___awdiv)
	movlw	high(0Ah)
	movwf	((?___awdiv))+1
	movf	(_old_time),w
	movwf	(??_lcd_init+0)+0
	clrf	(??_lcd_init+0)+0+1
	movf	0+(??_lcd_init+0)+0,w
	movwf	0+(?___awmod)+02h
	movf	1+(??_lcd_init+0)+0,w
	movwf	1+(?___awmod)+02h
	movlw	low(064h)
	movwf	(?___awmod)
	movlw	high(064h)
	movwf	((?___awmod))+1
	fcall	___awmod
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(1+(?___awmod)),w
	clrf	1+(?___awdiv)+02h
	addwf	1+(?___awdiv)+02h
	movf	(0+(?___awmod)),w
	clrf	0+(?___awdiv)+02h
	addwf	0+(?___awdiv)+02h

	fcall	___awdiv
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(0+(?___awdiv)),w
	movwf	(??_lcd_init+2)+0
	movf	(??_lcd_init+2)+0,w
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	0+(_disp_data_time)^080h+03h
	line	212
	
l14494:	
;led.c: 212: up_time1(disp_data_time);
	movlw	(_disp_data_time)&0ffh
	fcall	_up_time1
	line	215
	
l14496:	
;led.c: 215: up_time2(disp_data_time);
	movlw	(_disp_data_time)&0ffh
	fcall	_up_time2
	line	217
	
l14498:	
;led.c: 217: RC2 = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(58/8),(58)&7
	line	218
	
l14500:	
;led.c: 218: RC1 = 0;
	bcf	(57/8),(57)&7
	line	221
	
l3335:	
	return
	opt stack 0
GLOBAL	__end_of_lcd_init
	__end_of_lcd_init:
;; =============== function _lcd_init ends ============

	signat	_lcd_init,88
	global	_up_time2
psect	text1427,local,class=CODE,delta=2
global __ptext1427
__ptext1427:

;; *************** function _up_time2 *****************
;; Defined at:
;;		line 667 in file "E:\Projects\COLOCK\Master_sub_slock\yzj\programe_updata\SZZ485_V1.4\source\led.c"
;; Parameters:    Size  Location     Type
;;  udata_time      1    wreg     PTR unsigned char 
;;		 -> disp_data_time(4), 
;; Auto vars:     Size  Location     Type
;;  udata_time      1   38[BANK0 ] PTR unsigned char 
;;		 -> disp_data_time(4), 
;;  date            4   34[BANK0 ] unsigned char [4]
;;  i               1   39[BANK0 ] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK2
;;      Params:         0       0       0       0
;;      Locals:         0       6       0       0
;;      Temps:          0       3       0       0
;;      Totals:         0       9       0       0
;;Total ram usage:        9 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    5
;; This function calls:
;;		_up_date
;;		_settime
;;		_seg_disp
;; This function is called by:
;;		_lcd_init
;;		_main
;; This function uses a non-reentrant model
;;
psect	text1427
	file	"E:\Projects\COLOCK\Master_sub_slock\yzj\programe_updata\SZZ485_V1.4\source\led.c"
	line	667
	global	__size_of_up_time2
	__size_of_up_time2	equ	__end_of_up_time2-_up_time2
	
_up_time2:	
	opt	stack 2
; Regs used in _up_time2: [wreg-fsr0h+status,2+status,0+pclath+cstack]
;up_time2@udata_time stored from wreg
	line	690
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(up_time2@udata_time)
	
l14370:	
;led.c: 668: UINT8 date[4],i;
;led.c: 669: static UINT8 copy_flag_dian=0,count;
;led.c: 670: static enum
;led.c: 671: {
;led.c: 672: display_normal=0,
;led.c: 676: START_TEST00
;led.c: 678: ,
;led.c: 679: display_stop,
;led.c: 680: display_close,
;led.c: 682: display_open,
;led.c: 683: display_reset
;led.c: 686: }display_mode_state=display_normal;
;led.c: 688: static UINT8 copy_display_mode_state;
;led.c: 690: copy_flag_dian ^=1;
	movlw	(01h)
	movwf	(??_up_time2+0)+0
	movf	(??_up_time2+0)+0,w
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	xorwf	(up_time2@copy_flag_dian)^080h,f
	line	692
	
l14372:	
;led.c: 692: copy_display_mode_state=display_mode_state;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(up_time2@display_mode_state),w
	movwf	(??_up_time2+0)+0
	movf	(??_up_time2+0)+0,w
	movwf	(up_time2@copy_display_mode_state)
	line	694
;led.c: 694: switch(ntp_info.test_mode2)
	goto	l14390
	line	696
;led.c: 695: {
;led.c: 696: case DIGITAL_TEST:
	
l3396:	
	line	698
	
l14374:	
;led.c: 697: {
;led.c: 698: count=0;
	clrc
	movlw	0
	btfsc	status,0
	movlw	1
	bcf	status, 5	;RP0=0, select bank0
	movwf	(up_time2@count)
	line	699
	
l14376:	
;led.c: 699: display_mode_state=START_TEST00;
	clrf	(up_time2@display_mode_state)
	bsf	status,0
	rlf	(up_time2@display_mode_state),f
	line	700
;led.c: 700: break;
	goto	l14392
	line	703
;led.c: 701: }
;led.c: 703: case DIGITAL_NORMAL:
	
l3398:	
	goto	l14378
	line	704
	
l3399:	
	goto	l14378
	line	705
	
l3400:	
	goto	l14378
	line	706
	
l3401:	
	line	708
	
l14378:	
;led.c: 704: case DIGITAL_JIAOSHI:
;led.c: 705: case DIGITAL_CHASE_TIME:
;led.c: 706: case DIGITAL_DUISHI:
;led.c: 707: {
;led.c: 708: display_mode_state=display_normal;
	clrc
	movlw	0
	btfsc	status,0
	movlw	1
	bcf	status, 5	;RP0=0, select bank0
	movwf	(up_time2@display_mode_state)
	line	709
;led.c: 709: break;
	goto	l14392
	line	711
;led.c: 710: }
;led.c: 711: case DIGITAL_STOP:
	
l3402:	
	line	713
	
l14380:	
;led.c: 712: {
;led.c: 713: display_mode_state=display_stop;
	movlw	(02h)
	bcf	status, 5	;RP0=0, select bank0
	movwf	(??_up_time2+0)+0
	movf	(??_up_time2+0)+0,w
	movwf	(up_time2@display_mode_state)
	line	714
;led.c: 714: break;
	goto	l14392
	line	716
;led.c: 715: }
;led.c: 716: case DIGITAL_CLOSE:
	
l3403:	
	line	718
	
l14382:	
;led.c: 717: {
;led.c: 718: display_mode_state=display_close;
	movlw	(03h)
	bcf	status, 5	;RP0=0, select bank0
	movwf	(??_up_time2+0)+0
	movf	(??_up_time2+0)+0,w
	movwf	(up_time2@display_mode_state)
	line	719
;led.c: 719: break;
	goto	l14392
	line	721
;led.c: 720: }
;led.c: 721: case DIGITAL_OPEN:
	
l3404:	
	line	723
	
l14384:	
;led.c: 722: {
;led.c: 723: display_mode_state=display_open;
	movlw	(04h)
	bcf	status, 5	;RP0=0, select bank0
	movwf	(??_up_time2+0)+0
	movf	(??_up_time2+0)+0,w
	movwf	(up_time2@display_mode_state)
	line	724
;led.c: 724: break;
	goto	l14392
	line	726
;led.c: 725: }
;led.c: 726: case DIGITAL_RESET:
	
l3405:	
	line	728
	
l14386:	
;led.c: 727: {
;led.c: 728: display_mode_state=display_reset;
	movlw	(05h)
	bcf	status, 5	;RP0=0, select bank0
	movwf	(??_up_time2+0)+0
	movf	(??_up_time2+0)+0,w
	movwf	(up_time2@display_mode_state)
	line	729
;led.c: 729: break;
	goto	l14392
	line	735
	
l14388:	
;led.c: 730: }
;led.c: 735: }
	goto	l14392
	line	694
	
l3395:	
	
l14390:	
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	0+(_ntp_info)^080h+01h,w
	; Switch size 1, requested type "space"
; Number of cases is 9, Range of values is 0 to 8
; switch strategies available:
; Name         Bytes Cycles
; simple_byte    28    15 (average)
; direct_byte    34    16 (fixed)
;	Chosen strategy is simple_byte

	xorlw	0^0	; case 0
	skipnz
	goto	l14378
	xorlw	1^0	; case 1
	skipnz
	goto	l14378
	xorlw	2^1	; case 2
	skipnz
	goto	l14380
	xorlw	3^2	; case 3
	skipnz
	goto	l14378
	xorlw	4^3	; case 4
	skipnz
	goto	l14378
	xorlw	5^4	; case 5
	skipnz
	goto	l14382
	xorlw	6^5	; case 6
	skipnz
	goto	l14384
	xorlw	7^6	; case 7
	skipnz
	goto	l14374
	xorlw	8^7	; case 8
	skipnz
	goto	l14386
	goto	l14392

	line	735
	
l3397:	
	line	754
	
l14392:	
;led.c: 754: if(old_time.sec<=59 && old_time.min<=59 && old_time.hour<=23)
	movlw	(03Ch)
	bcf	status, 5	;RP0=0, select bank0
	subwf	0+(_old_time)+02h,w
	skipnc
	goto	u6581
	goto	u6580
u6581:
	goto	l14454
u6580:
	
l14394:	
	movlw	(03Ch)
	subwf	0+(_old_time)+01h,w
	skipnc
	goto	u6591
	goto	u6590
u6591:
	goto	l14454
u6590:
	
l14396:	
	movlw	(018h)
	subwf	(_old_time),w
	skipnc
	goto	u6601
	goto	u6600
u6601:
	goto	l14454
u6600:
	goto	l14452
	line	854
	
l14398:	
;led.c: 755: {
;led.c: 854: switch(display_mode_state)
	goto	l14452
	line	856
;led.c: 855: {
;led.c: 856: case display_normal:
	
l3408:	
	line	858
	
l14400:	
;led.c: 857: {
;led.c: 858: i=0;
	clrc
	movlw	0
	btfsc	status,0
	movlw	1
	movwf	(up_time2@i)
	line	859
	
l14402:	
;led.c: 859: date[i++] = udata_time[0];
	movf	(up_time2@udata_time),w
	movwf	fsr0
	bcf	status, 7	;select IRP bank0
	movf	indf,w
	movwf	(??_up_time2+0)+0
	movf	(up_time2@i),w
	addlw	up_time2@date&0ffh
	movwf	fsr0
	movf	(??_up_time2+0)+0,w
	movwf	indf
	
l14404:	
	movlw	(01h)
	movwf	(??_up_time2+0)+0
	movf	(??_up_time2+0)+0,w
	addwf	(up_time2@i),f
	line	860
;led.c: 860: date[i++] = udata_time[1];
	movf	(up_time2@udata_time),w
	addlw	01h
	movwf	fsr0
	movf	indf,w
	movwf	(??_up_time2+0)+0
	movf	(up_time2@i),w
	addlw	up_time2@date&0ffh
	movwf	fsr0
	movf	(??_up_time2+0)+0,w
	movwf	indf
	
l14406:	
	movlw	(01h)
	movwf	(??_up_time2+0)+0
	movf	(??_up_time2+0)+0,w
	addwf	(up_time2@i),f
	line	861
	
l14408:	
;led.c: 861: date[i++] = udata_time[2];
	movf	(up_time2@udata_time),w
	addlw	02h
	movwf	fsr0
	movf	indf,w
	movwf	(??_up_time2+0)+0
	movf	(up_time2@i),w
	addlw	up_time2@date&0ffh
	movwf	fsr0
	movf	(??_up_time2+0)+0,w
	movwf	indf
	movlw	(01h)
	movwf	(??_up_time2+0)+0
	movf	(??_up_time2+0)+0,w
	addwf	(up_time2@i),f
	line	862
	
l14410:	
;led.c: 862: date[i++] = udata_time[3];
	movf	(up_time2@udata_time),w
	addlw	03h
	movwf	fsr0
	movf	indf,w
	movwf	(??_up_time2+0)+0
	movf	(up_time2@i),w
	addlw	up_time2@date&0ffh
	movwf	fsr0
	movf	(??_up_time2+0)+0,w
	movwf	indf
	
l14412:	
	movlw	(01h)
	movwf	(??_up_time2+0)+0
	movf	(??_up_time2+0)+0,w
	addwf	(up_time2@i),f
	line	863
	
l14414:	
;led.c: 863: up_date(date,i,flag_dian2,2);
	movf	(up_time2@i),w
	movwf	(??_up_time2+0)+0
	movf	(??_up_time2+0)+0,w
	movwf	(?_up_date)
	movf	(_flag_dian2),w
	movwf	(??_up_time2+1)+0
	movf	(??_up_time2+1)+0,w
	movwf	0+(?_up_date)+01h
	movlw	(02h)
	movwf	(??_up_time2+2)+0
	movf	(??_up_time2+2)+0,w
	movwf	0+(?_up_date)+02h
	movlw	(up_time2@date)&0ffh
	fcall	_up_date
	line	865
;led.c: 865: break;
	goto	l14466
	line	888
;led.c: 866: }
;led.c: 888: case START_TEST00:
	
l3410:	
	line	890
	
l14416:	
;led.c: 889: {
;led.c: 890: for(i=0;i<4;i++)
	clrc
	movlw	0
	btfsc	status,0
	movlw	1
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(up_time2@i)
	
l14418:	
	movlw	(04h)
	subwf	(up_time2@i),w
	skipc
	goto	u6611
	goto	u6610
u6611:
	goto	l14422
u6610:
	goto	l14428
	
l14420:	
	goto	l14428
	line	891
	
l3411:	
	line	892
	
l14422:	
;led.c: 891: {
;led.c: 892: date[i]=count;
	movf	(up_time2@count),w
	movwf	(??_up_time2+0)+0
	movf	(up_time2@i),w
	addlw	up_time2@date&0ffh
	movwf	fsr0
	movf	(??_up_time2+0)+0,w
	bcf	status, 7	;select IRP bank0
	movwf	indf
	line	890
	
l14424:	
	movlw	(01h)
	movwf	(??_up_time2+0)+0
	movf	(??_up_time2+0)+0,w
	addwf	(up_time2@i),f
	
l14426:	
	movlw	(04h)
	subwf	(up_time2@i),w
	skipc
	goto	u6621
	goto	u6620
u6621:
	goto	l14422
u6620:
	goto	l14428
	
l3412:	
	line	894
	
l14428:	
;led.c: 893: }
;led.c: 894: if(count>=9)
	movlw	(09h)
	subwf	(up_time2@count),w
	skipc
	goto	u6631
	goto	u6630
u6631:
	goto	l14432
u6630:
	line	896
	
l14430:	
;led.c: 895: {
;led.c: 896: count=0;
	clrc
	movlw	0
	btfsc	status,0
	movlw	1
	movwf	(up_time2@count)
	line	897
;led.c: 897: display_mode_state=display_normal;
	clrc
	movlw	0
	btfsc	status,0
	movlw	1
	movwf	(up_time2@display_mode_state)
	line	898
;led.c: 898: }
	goto	l14434
	line	899
	
l3413:	
	line	901
	
l14432:	
;led.c: 899: else
;led.c: 900: {
;led.c: 901: count++;
	movlw	(01h)
	movwf	(??_up_time2+0)+0
	movf	(??_up_time2+0)+0,w
	addwf	(up_time2@count),f
	goto	l14434
	line	902
	
l3414:	
	line	903
	
l14434:	
;led.c: 902: }
;led.c: 903: up_date(date,i,copy_flag_dian,2);
	movf	(up_time2@i),w
	movwf	(??_up_time2+0)+0
	movf	(??_up_time2+0)+0,w
	movwf	(?_up_date)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(up_time2@copy_flag_dian)^080h,w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_up_time2+1)+0
	movf	(??_up_time2+1)+0,w
	movwf	0+(?_up_date)+01h
	movlw	(02h)
	movwf	(??_up_time2+2)+0
	movf	(??_up_time2+2)+0,w
	movwf	0+(?_up_date)+02h
	movlw	(up_time2@date)&0ffh
	fcall	_up_date
	line	905
;led.c: 905: break;
	goto	l14466
	line	908
;led.c: 906: }
;led.c: 908: case display_stop:
	
l3415:	
	line	910
;led.c: 909: {
;led.c: 910: break;
	goto	l14466
	line	912
;led.c: 911: }
;led.c: 912: case display_close:
	
l3416:	
	line	914
	
l14436:	
;led.c: 913: {
;led.c: 914: CCP1CON =0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(23)	;volatile
	line	915
	
l14438:	
;led.c: 915: RC1=1;
	bsf	(57/8),(57)&7
	line	916
;led.c: 916: break;
	goto	l14466
	line	918
;led.c: 917: }
;led.c: 918: case display_open:
	
l3417:	
	line	920
	
l14440:	
;led.c: 919: {
;led.c: 920: CCP2CON |= 0b00001100;
	movlw	(0Ch)
	movwf	(??_up_time2+0)+0
	movf	(??_up_time2+0)+0,w
	iorwf	(29),f	;volatile
	line	921
	
l14442:	
;led.c: 921: RC1=0;
	bcf	(57/8),(57)&7
	line	922
	
l14444:	
;led.c: 922: if(copy_display_mode_state==display_close)
	movf	(up_time2@copy_display_mode_state),w
	xorlw	03h
	skipz
	goto	u6641
	goto	u6640
u6641:
	goto	l14448
u6640:
	line	926
	
l14446:	
;led.c: 923: {
;led.c: 926: display_mode_state=display_normal;
	clrc
	movlw	0
	btfsc	status,0
	movlw	1
	movwf	(up_time2@display_mode_state)
	line	927
;led.c: 927: }
	goto	l14466
	line	928
	
l3418:	
	line	930
	
l14448:	
;led.c: 928: else
;led.c: 929: {
;led.c: 930: display_mode_state=copy_display_mode_state;
	movf	(up_time2@copy_display_mode_state),w
	movwf	(??_up_time2+0)+0
	movf	(??_up_time2+0)+0,w
	movwf	(up_time2@display_mode_state)
	goto	l14466
	line	931
	
l3419:	
	line	932
;led.c: 931: }
;led.c: 932: break;
	goto	l14466
	line	934
;led.c: 933: }
;led.c: 934: case display_reset:
	
l3420:	
	line	936
;led.c: 935: {
;led.c: 936: TMR1ON = 0;GIE = 0;PEIE = 0;
	bcf	(128/8),(128)&7
	bcf	(95/8),(95)&7
	bcf	(94/8),(94)&7
	line	937
;led.c: 937: break;
	goto	l14466
	line	940
;led.c: 938: }
;led.c: 940: default:display_mode_state=display_normal;
	
l3421:	
	
l14450:	
	clrc
	movlw	0
	btfsc	status,0
	movlw	1
	movwf	(up_time2@display_mode_state)
	line	942
;led.c: 942: }
	goto	l14466
	line	854
	
l3407:	
	
l14452:	
	movf	(up_time2@display_mode_state),w
	; Switch size 1, requested type "space"
; Number of cases is 6, Range of values is 0 to 5
; switch strategies available:
; Name         Bytes Cycles
; simple_byte    19    10 (average)
; direct_byte    28    16 (fixed)
;	Chosen strategy is simple_byte

	xorlw	0^0	; case 0
	skipnz
	goto	l14400
	xorlw	1^0	; case 1
	skipnz
	goto	l14416
	xorlw	2^1	; case 2
	skipnz
	goto	l14466
	xorlw	3^2	; case 3
	skipnz
	goto	l14436
	xorlw	4^3	; case 4
	skipnz
	goto	l14440
	xorlw	5^4	; case 5
	skipnz
	goto	l3420
	goto	l14450

	line	942
	
l3409:	
	line	1153
;led.c: 1153: }
	goto	l14466
	line	1154
	
l3406:	
	line	1156
	
l14454:	
;led.c: 1154: else
;led.c: 1155: {
;led.c: 1156: old_date.year = 1;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	clrf	0+(_old_date)^080h+03h
	bsf	status,0
	rlf	0+(_old_date)^080h+03h,f
	line	1157
;led.c: 1157: old_date.month = 1;
	clrf	0+(_old_date)^080h+02h
	bsf	status,0
	rlf	0+(_old_date)^080h+02h,f
	line	1158
;led.c: 1158: old_date.date = 1;
	clrf	0+(_old_date)^080h+01h
	bsf	status,0
	rlf	0+(_old_date)^080h+01h,f
	line	1159
	
l14456:	
;led.c: 1159: old_date.day = 0;
	clrc
	movlw	0
	btfsc	status,0
	movlw	1
	movwf	(_old_date)^080h
	line	1160
	
l14458:	
;led.c: 1160: old_time.hour = 0;
	clrc
	movlw	0
	btfsc	status,0
	movlw	1
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(_old_time)
	line	1161
	
l14460:	
;led.c: 1161: old_time.min = 0;
	clrc
	movlw	0
	btfsc	status,0
	movlw	1
	movwf	0+(_old_time)+01h
	line	1162
	
l14462:	
;led.c: 1162: old_time.sec = 0;
	clrc
	movlw	0
	btfsc	status,0
	movlw	1
	movwf	0+(_old_time)+02h
	line	1163
	
l14464:	
;led.c: 1163: settime();
	fcall	_settime
	goto	l14466
	line	1164
	
l3422:	
	line	1166
	
l14466:	
;led.c: 1164: }
;led.c: 1166: for(i=0;i<4;i++)
	clrc
	movlw	0
	btfsc	status,0
	movlw	1
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(up_time2@i)
	
l14468:	
	movlw	(04h)
	subwf	(up_time2@i),w
	skipc
	goto	u6651
	goto	u6650
u6651:
	goto	l14472
u6650:
	goto	l3425
	
l14470:	
	goto	l3425
	line	1167
	
l3423:	
	line	1168
	
l14472:	
;led.c: 1167: {
;led.c: 1168: seg_disp(10,0,2);
	clrc
	movlw	0
	btfsc	status,0
	movlw	1
	movwf	(?_seg_disp)
	movlw	(02h)
	movwf	(??_up_time2+0)+0
	movf	(??_up_time2+0)+0,w
	movwf	0+(?_seg_disp)+01h
	movlw	(0Ah)
	fcall	_seg_disp
	line	1166
	
l14474:	
	movlw	(01h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_up_time2+0)+0
	movf	(??_up_time2+0)+0,w
	addwf	(up_time2@i),f
	
l14476:	
	movlw	(04h)
	subwf	(up_time2@i),w
	skipc
	goto	u6661
	goto	u6660
u6661:
	goto	l14472
u6660:
	goto	l3425
	
l3424:	
	line	1170
	
l3425:	
	return
	opt stack 0
GLOBAL	__end_of_up_time2
	__end_of_up_time2:
;; =============== function _up_time2 ends ============

	signat	_up_time2,4216
	global	_up_time1
psect	text1428,local,class=CODE,delta=2
global __ptext1428
__ptext1428:

;; *************** function _up_time1 *****************
;; Defined at:
;;		line 224 in file "E:\Projects\COLOCK\Master_sub_slock\yzj\programe_updata\SZZ485_V1.4\source\led.c"
;; Parameters:    Size  Location     Type
;;  udata_time      1    wreg     PTR unsigned char 
;;		 -> disp_data_time(4), 
;; Auto vars:     Size  Location     Type
;;  udata_time      1   37[BANK0 ] PTR unsigned char 
;;		 -> disp_data_time(4), 
;;  date            4   33[BANK0 ] unsigned char [4]
;;  i               1   38[BANK0 ] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK2
;;      Params:         0       0       0       0
;;      Locals:         0       6       0       0
;;      Temps:          0       2       0       0
;;      Totals:         0       8       0       0
;;Total ram usage:        8 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    5
;; This function calls:
;;		_up_date
;;		_settime
;;		_seg_disp
;; This function is called by:
;;		_lcd_init
;;		_main
;; This function uses a non-reentrant model
;;
psect	text1428
	file	"E:\Projects\COLOCK\Master_sub_slock\yzj\programe_updata\SZZ485_V1.4\source\led.c"
	line	224
	global	__size_of_up_time1
	__size_of_up_time1	equ	__end_of_up_time1-_up_time1
	
_up_time1:	
	opt	stack 2
; Regs used in _up_time1: [wreg-fsr0h+status,2+status,0+pclath+cstack]
;up_time1@udata_time stored from wreg
	line	249
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(up_time1@udata_time)
	
l14258:	
;led.c: 225: UINT8 date[4],i;
;led.c: 226: static UINT8 copy_flag_dian=0,count=0;
;led.c: 229: static enum
;led.c: 230: {
;led.c: 231: display_normal=0,
;led.c: 235: START_TEST00
;led.c: 237: ,
;led.c: 238: display_stop,
;led.c: 239: display_close,
;led.c: 241: display_open,
;led.c: 242: display_reset
;led.c: 245: }display_mode_state=display_normal;
;led.c: 247: static UINT8 copy_display_mode_state;
;led.c: 249: copy_flag_dian ^=1;
	movlw	(01h)
	movwf	(??_up_time1+0)+0
	movf	(??_up_time1+0)+0,w
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	xorwf	(up_time1@copy_flag_dian)^080h,f
	line	251
	
l14260:	
;led.c: 251: copy_display_mode_state=display_mode_state;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(up_time1@display_mode_state),w
	movwf	(??_up_time1+0)+0
	movf	(??_up_time1+0)+0,w
	movwf	(up_time1@copy_display_mode_state)
	line	252
;led.c: 252: switch(ntp_info.test_mode1)
	goto	l14276
	line	254
;led.c: 253: {
;led.c: 254: case DIGITAL_TEST:
	
l3347:	
	line	256
	
l14262:	
;led.c: 255: {
;led.c: 256: display_mode_state=START_TEST00;
	bcf	status, 5	;RP0=0, select bank0
	clrf	(up_time1@display_mode_state)
	bsf	status,0
	rlf	(up_time1@display_mode_state),f
	line	257
;led.c: 257: break;
	goto	l14278
	line	260
;led.c: 258: }
;led.c: 260: case DIGITAL_NORMAL:
	
l3349:	
	goto	l14264
	line	261
	
l3350:	
	goto	l14264
	line	262
	
l3351:	
	goto	l14264
	line	263
	
l3352:	
	line	265
	
l14264:	
;led.c: 261: case DIGITAL_JIAOSHI:
;led.c: 262: case DIGITAL_CHASE_TIME:
;led.c: 263: case DIGITAL_DUISHI:
;led.c: 264: {
;led.c: 265: display_mode_state=display_normal;
	clrc
	movlw	0
	btfsc	status,0
	movlw	1
	bcf	status, 5	;RP0=0, select bank0
	movwf	(up_time1@display_mode_state)
	line	266
;led.c: 266: break;
	goto	l14278
	line	268
;led.c: 267: }
;led.c: 268: case DIGITAL_STOP:
	
l3353:	
	line	270
	
l14266:	
;led.c: 269: {
;led.c: 270: display_mode_state=display_stop;
	movlw	(02h)
	bcf	status, 5	;RP0=0, select bank0
	movwf	(??_up_time1+0)+0
	movf	(??_up_time1+0)+0,w
	movwf	(up_time1@display_mode_state)
	line	271
;led.c: 271: break;
	goto	l14278
	line	273
;led.c: 272: }
;led.c: 273: case DIGITAL_CLOSE:
	
l3354:	
	line	275
	
l14268:	
;led.c: 274: {
;led.c: 275: display_mode_state=display_close;
	movlw	(03h)
	bcf	status, 5	;RP0=0, select bank0
	movwf	(??_up_time1+0)+0
	movf	(??_up_time1+0)+0,w
	movwf	(up_time1@display_mode_state)
	line	276
;led.c: 276: break;
	goto	l14278
	line	278
;led.c: 277: }
;led.c: 278: case DIGITAL_OPEN:
	
l3355:	
	line	280
	
l14270:	
;led.c: 279: {
;led.c: 280: display_mode_state=display_open;
	movlw	(04h)
	bcf	status, 5	;RP0=0, select bank0
	movwf	(??_up_time1+0)+0
	movf	(??_up_time1+0)+0,w
	movwf	(up_time1@display_mode_state)
	line	281
;led.c: 281: break;
	goto	l14278
	line	283
;led.c: 282: }
;led.c: 283: case DIGITAL_RESET:
	
l3356:	
	line	285
	
l14272:	
;led.c: 284: {
;led.c: 285: display_mode_state=display_reset;
	movlw	(05h)
	bcf	status, 5	;RP0=0, select bank0
	movwf	(??_up_time1+0)+0
	movf	(??_up_time1+0)+0,w
	movwf	(up_time1@display_mode_state)
	line	286
;led.c: 286: break;
	goto	l14278
	line	292
	
l14274:	
;led.c: 287: }
;led.c: 292: }
	goto	l14278
	line	252
	
l3346:	
	
l14276:	
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(_ntp_info)^080h,w
	; Switch size 1, requested type "space"
; Number of cases is 9, Range of values is 0 to 8
; switch strategies available:
; Name         Bytes Cycles
; simple_byte    28    15 (average)
; direct_byte    34    16 (fixed)
;	Chosen strategy is simple_byte

	xorlw	0^0	; case 0
	skipnz
	goto	l14264
	xorlw	1^0	; case 1
	skipnz
	goto	l14264
	xorlw	2^1	; case 2
	skipnz
	goto	l14266
	xorlw	3^2	; case 3
	skipnz
	goto	l14264
	xorlw	4^3	; case 4
	skipnz
	goto	l14264
	xorlw	5^4	; case 5
	skipnz
	goto	l14268
	xorlw	6^5	; case 6
	skipnz
	goto	l14270
	xorlw	7^6	; case 7
	skipnz
	goto	l14262
	xorlw	8^7	; case 8
	skipnz
	goto	l14272
	goto	l14278

	line	292
	
l3348:	
	line	309
	
l14278:	
;led.c: 309: if(old_time.sec<=59 && old_time.min<=59 && old_time.hour<=23)
	movlw	(03Ch)
	bcf	status, 5	;RP0=0, select bank0
	subwf	0+(_old_time)+02h,w
	skipnc
	goto	u6481
	goto	u6480
u6481:
	goto	l14346
u6480:
	
l14280:	
	movlw	(03Ch)
	subwf	0+(_old_time)+01h,w
	skipnc
	goto	u6491
	goto	u6490
u6491:
	goto	l14346
u6490:
	
l14282:	
	movlw	(018h)
	subwf	(_old_time),w
	skipnc
	goto	u6501
	goto	u6500
u6501:
	goto	l14346
u6500:
	goto	l14344
	line	409
	
l14284:	
;led.c: 310: {
;led.c: 409: switch(display_mode_state)
	goto	l14344
	line	411
;led.c: 410: {
;led.c: 411: case display_normal:
	
l3359:	
	line	414
	
l14286:	
;led.c: 412: {
;led.c: 414: i=0;
	clrc
	movlw	0
	btfsc	status,0
	movlw	1
	movwf	(up_time1@i)
	line	415
	
l14288:	
;led.c: 415: date[i++] = udata_time[0];
	movf	(up_time1@udata_time),w
	movwf	fsr0
	bcf	status, 7	;select IRP bank0
	movf	indf,w
	movwf	(??_up_time1+0)+0
	movf	(up_time1@i),w
	addlw	up_time1@date&0ffh
	movwf	fsr0
	movf	(??_up_time1+0)+0,w
	movwf	indf
	
l14290:	
	movlw	(01h)
	movwf	(??_up_time1+0)+0
	movf	(??_up_time1+0)+0,w
	addwf	(up_time1@i),f
	line	417
;led.c: 417: date[i++] = udata_time[1];
	movf	(up_time1@udata_time),w
	addlw	01h
	movwf	fsr0
	movf	indf,w
	movwf	(??_up_time1+0)+0
	movf	(up_time1@i),w
	addlw	up_time1@date&0ffh
	movwf	fsr0
	movf	(??_up_time1+0)+0,w
	movwf	indf
	
l14292:	
	movlw	(01h)
	movwf	(??_up_time1+0)+0
	movf	(??_up_time1+0)+0,w
	addwf	(up_time1@i),f
	line	418
	
l14294:	
;led.c: 418: date[i++] = udata_time[2];
	movf	(up_time1@udata_time),w
	addlw	02h
	movwf	fsr0
	movf	indf,w
	movwf	(??_up_time1+0)+0
	movf	(up_time1@i),w
	addlw	up_time1@date&0ffh
	movwf	fsr0
	movf	(??_up_time1+0)+0,w
	movwf	indf
	movlw	(01h)
	movwf	(??_up_time1+0)+0
	movf	(??_up_time1+0)+0,w
	addwf	(up_time1@i),f
	line	419
	
l14296:	
;led.c: 419: if(udata_time[3]==0)
	movf	(up_time1@udata_time),w
	addlw	03h
	movwf	fsr0
	movf	indf,f
	skipz
	goto	u6511
	goto	u6510
u6511:
	goto	l14302
u6510:
	line	421
	
l14298:	
;led.c: 420: {
;led.c: 421: date[i++] = 10;
	movlw	(0Ah)
	movwf	(??_up_time1+0)+0
	movf	(up_time1@i),w
	addlw	up_time1@date&0ffh
	movwf	fsr0
	movf	(??_up_time1+0)+0,w
	movwf	indf
	
l14300:	
	movlw	(01h)
	movwf	(??_up_time1+0)+0
	movf	(??_up_time1+0)+0,w
	addwf	(up_time1@i),f
	line	422
;led.c: 422: }
	goto	l14306
	line	423
	
l3360:	
	line	425
	
l14302:	
;led.c: 423: else
;led.c: 424: {
;led.c: 425: date[i++] = udata_time[3];
	movf	(up_time1@udata_time),w
	addlw	03h
	movwf	fsr0
	movf	indf,w
	movwf	(??_up_time1+0)+0
	movf	(up_time1@i),w
	addlw	up_time1@date&0ffh
	movwf	fsr0
	movf	(??_up_time1+0)+0,w
	movwf	indf
	
l14304:	
	movlw	(01h)
	movwf	(??_up_time1+0)+0
	movf	(??_up_time1+0)+0,w
	addwf	(up_time1@i),f
	goto	l14306
	line	426
	
l3361:	
	line	435
	
l14306:	
;led.c: 426: }
;led.c: 435: up_date(date,i,flag_dian1,1);
	movf	(up_time1@i),w
	movwf	(??_up_time1+0)+0
	movf	(??_up_time1+0)+0,w
	movwf	(?_up_date)
	movf	(_flag_dian1),w
	movwf	(??_up_time1+1)+0
	movf	(??_up_time1+1)+0,w
	movwf	0+(?_up_date)+01h
	clrf	0+(?_up_date)+02h
	bsf	status,0
	rlf	0+(?_up_date)+02h,f
	movlw	(up_time1@date)&0ffh
	fcall	_up_date
	line	436
;led.c: 436: break;
	goto	l14358
	line	458
;led.c: 437: }
;led.c: 458: case START_TEST00:
	
l3363:	
	line	460
	
l14308:	
;led.c: 459: {
;led.c: 460: for(i=0;i<4;i++)
	clrc
	movlw	0
	btfsc	status,0
	movlw	1
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(up_time1@i)
	
l14310:	
	movlw	(04h)
	subwf	(up_time1@i),w
	skipc
	goto	u6521
	goto	u6520
u6521:
	goto	l14314
u6520:
	goto	l14320
	
l14312:	
	goto	l14320
	line	461
	
l3364:	
	line	462
	
l14314:	
;led.c: 461: {
;led.c: 462: date[i]=count;
	movf	(up_time1@count),w
	movwf	(??_up_time1+0)+0
	movf	(up_time1@i),w
	addlw	up_time1@date&0ffh
	movwf	fsr0
	movf	(??_up_time1+0)+0,w
	bcf	status, 7	;select IRP bank0
	movwf	indf
	line	460
	
l14316:	
	movlw	(01h)
	movwf	(??_up_time1+0)+0
	movf	(??_up_time1+0)+0,w
	addwf	(up_time1@i),f
	
l14318:	
	movlw	(04h)
	subwf	(up_time1@i),w
	skipc
	goto	u6531
	goto	u6530
u6531:
	goto	l14314
u6530:
	goto	l14320
	
l3365:	
	line	464
	
l14320:	
;led.c: 463: }
;led.c: 464: if(count>=9)
	movlw	(09h)
	subwf	(up_time1@count),w
	skipc
	goto	u6541
	goto	u6540
u6541:
	goto	l14324
u6540:
	line	466
	
l14322:	
;led.c: 465: {
;led.c: 466: count=0;
	clrc
	movlw	0
	btfsc	status,0
	movlw	1
	movwf	(up_time1@count)
	line	467
;led.c: 467: display_mode_state=display_normal;
	clrc
	movlw	0
	btfsc	status,0
	movlw	1
	movwf	(up_time1@display_mode_state)
	line	469
;led.c: 469: }
	goto	l14326
	line	470
	
l3366:	
	line	472
	
l14324:	
;led.c: 470: else
;led.c: 471: {
;led.c: 472: count++;
	movlw	(01h)
	movwf	(??_up_time1+0)+0
	movf	(??_up_time1+0)+0,w
	addwf	(up_time1@count),f
	goto	l14326
	line	473
	
l3367:	
	line	474
	
l14326:	
;led.c: 473: }
;led.c: 474: up_date(date,i,copy_flag_dian,1);
	movf	(up_time1@i),w
	movwf	(??_up_time1+0)+0
	movf	(??_up_time1+0)+0,w
	movwf	(?_up_date)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(up_time1@copy_flag_dian)^080h,w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_up_time1+1)+0
	movf	(??_up_time1+1)+0,w
	movwf	0+(?_up_date)+01h
	clrf	0+(?_up_date)+02h
	bsf	status,0
	rlf	0+(?_up_date)+02h,f
	movlw	(up_time1@date)&0ffh
	fcall	_up_date
	line	476
;led.c: 476: break;
	goto	l14358
	line	479
;led.c: 477: }
;led.c: 479: case display_stop:
	
l3368:	
	line	481
;led.c: 480: {
;led.c: 481: break;
	goto	l14358
	line	483
;led.c: 482: }
;led.c: 483: case display_close:
	
l3369:	
	line	485
	
l14328:	
;led.c: 484: {
;led.c: 485: CCP1CON =0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(23)	;volatile
	line	486
	
l14330:	
;led.c: 486: RC2=1;
	bsf	(58/8),(58)&7
	line	487
;led.c: 487: break;
	goto	l14358
	line	489
;led.c: 488: }
;led.c: 489: case display_open:
	
l3370:	
	line	491
	
l14332:	
;led.c: 490: {
;led.c: 491: CCP1CON |= 0b00001100;
	movlw	(0Ch)
	movwf	(??_up_time1+0)+0
	movf	(??_up_time1+0)+0,w
	iorwf	(23),f	;volatile
	line	492
	
l14334:	
;led.c: 492: RC2=0;
	bcf	(58/8),(58)&7
	line	493
	
l14336:	
;led.c: 493: if(copy_display_mode_state==display_close)
	movf	(up_time1@copy_display_mode_state),w
	xorlw	03h
	skipz
	goto	u6551
	goto	u6550
u6551:
	goto	l14340
u6550:
	line	497
	
l14338:	
;led.c: 494: {
;led.c: 497: display_mode_state=display_normal;
	clrc
	movlw	0
	btfsc	status,0
	movlw	1
	movwf	(up_time1@display_mode_state)
	line	498
;led.c: 498: }
	goto	l14358
	line	499
	
l3371:	
	line	501
	
l14340:	
;led.c: 499: else
;led.c: 500: {
;led.c: 501: display_mode_state=copy_display_mode_state;
	movf	(up_time1@copy_display_mode_state),w
	movwf	(??_up_time1+0)+0
	movf	(??_up_time1+0)+0,w
	movwf	(up_time1@display_mode_state)
	goto	l14358
	line	502
	
l3372:	
	line	503
;led.c: 502: }
;led.c: 503: break;
	goto	l14358
	line	505
;led.c: 504: }
;led.c: 505: case display_reset:
	
l3373:	
	line	507
;led.c: 506: {
;led.c: 507: TMR1ON = 0;GIE = 0;PEIE = 0;
	bcf	(128/8),(128)&7
	bcf	(95/8),(95)&7
	bcf	(94/8),(94)&7
	line	508
;led.c: 508: break;
	goto	l14358
	line	511
;led.c: 509: }
;led.c: 511: default:display_mode_state=display_normal;
	
l3374:	
	
l14342:	
	clrc
	movlw	0
	btfsc	status,0
	movlw	1
	movwf	(up_time1@display_mode_state)
	line	513
;led.c: 513: }
	goto	l14358
	line	409
	
l3358:	
	
l14344:	
	movf	(up_time1@display_mode_state),w
	; Switch size 1, requested type "space"
; Number of cases is 6, Range of values is 0 to 5
; switch strategies available:
; Name         Bytes Cycles
; simple_byte    19    10 (average)
; direct_byte    28    16 (fixed)
;	Chosen strategy is simple_byte

	xorlw	0^0	; case 0
	skipnz
	goto	l14286
	xorlw	1^0	; case 1
	skipnz
	goto	l14308
	xorlw	2^1	; case 2
	skipnz
	goto	l14358
	xorlw	3^2	; case 3
	skipnz
	goto	l14328
	xorlw	4^3	; case 4
	skipnz
	goto	l14332
	xorlw	5^4	; case 5
	skipnz
	goto	l3373
	goto	l14342

	line	513
	
l3362:	
	line	628
;led.c: 628: }
	goto	l14358
	line	629
	
l3357:	
	line	631
	
l14346:	
;led.c: 629: else
;led.c: 630: {
;led.c: 631: old_date.year = 1;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	clrf	0+(_old_date)^080h+03h
	bsf	status,0
	rlf	0+(_old_date)^080h+03h,f
	line	632
;led.c: 632: old_date.month = 1;
	clrf	0+(_old_date)^080h+02h
	bsf	status,0
	rlf	0+(_old_date)^080h+02h,f
	line	633
;led.c: 633: old_date.date = 1;
	clrf	0+(_old_date)^080h+01h
	bsf	status,0
	rlf	0+(_old_date)^080h+01h,f
	line	634
	
l14348:	
;led.c: 634: old_date.day = 0;
	clrc
	movlw	0
	btfsc	status,0
	movlw	1
	movwf	(_old_date)^080h
	line	635
	
l14350:	
;led.c: 635: old_time.hour = 0;
	clrc
	movlw	0
	btfsc	status,0
	movlw	1
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(_old_time)
	line	636
	
l14352:	
;led.c: 636: old_time.min = 0;
	clrc
	movlw	0
	btfsc	status,0
	movlw	1
	movwf	0+(_old_time)+01h
	line	637
	
l14354:	
;led.c: 637: old_time.sec = 0;
	clrc
	movlw	0
	btfsc	status,0
	movlw	1
	movwf	0+(_old_time)+02h
	line	638
	
l14356:	
;led.c: 638: settime();
	fcall	_settime
	goto	l14358
	line	639
	
l3375:	
	line	643
	
l14358:	
;led.c: 639: }
;led.c: 643: for(i=0;i<4;i++)
	clrc
	movlw	0
	btfsc	status,0
	movlw	1
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(up_time1@i)
	
l14360:	
	movlw	(04h)
	subwf	(up_time1@i),w
	skipc
	goto	u6561
	goto	u6560
u6561:
	goto	l14364
u6560:
	goto	l3378
	
l14362:	
	goto	l3378
	line	644
	
l3376:	
	line	645
	
l14364:	
;led.c: 644: {
;led.c: 645: seg_disp(10,0,1);
	clrc
	movlw	0
	btfsc	status,0
	movlw	1
	movwf	(?_seg_disp)
	clrf	0+(?_seg_disp)+01h
	bsf	status,0
	rlf	0+(?_seg_disp)+01h,f
	movlw	(0Ah)
	fcall	_seg_disp
	line	643
	
l14366:	
	movlw	(01h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_up_time1+0)+0
	movf	(??_up_time1+0)+0,w
	addwf	(up_time1@i),f
	
l14368:	
	movlw	(04h)
	subwf	(up_time1@i),w
	skipc
	goto	u6571
	goto	u6570
u6571:
	goto	l14364
u6570:
	goto	l3378
	
l3377:	
	line	647
	
l3378:	
	return
	opt stack 0
GLOBAL	__end_of_up_time1
	__end_of_up_time1:
;; =============== function _up_time1 ends ============

	signat	_up_time1,4216
	global	_up_date
psect	text1429,local,class=CODE,delta=2
global __ptext1429
__ptext1429:

;; *************** function _up_date *****************
;; Defined at:
;;		line 653 in file "E:\Projects\COLOCK\Master_sub_slock\yzj\programe_updata\SZZ485_V1.4\source\led.c"
;; Parameters:    Size  Location     Type
;;  date            1    wreg     PTR unsigned char 
;;		 -> up_time2@date(4), up_time1@date(4), 
;;  length          1    7[BANK0 ] unsigned char 
;;  dian            1    8[BANK0 ] unsigned char 
;;  flag            1    9[BANK0 ] unsigned char 
;; Auto vars:     Size  Location     Type
;;  date            1   13[BANK0 ] PTR unsigned char 
;;		 -> up_time2@date(4), up_time1@date(4), 
;;  i               1   14[BANK0 ] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK2
;;      Params:         0       3       0       0
;;      Locals:         0       2       0       0
;;      Temps:          0       3       0       0
;;      Totals:         0       8       0       0
;;Total ram usage:        8 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    4
;; This function calls:
;;		_seg_disp
;;		_latch_rclk
;; This function is called by:
;;		_up_time1
;;		_up_time2
;; This function uses a non-reentrant model
;;
psect	text1429
	file	"E:\Projects\COLOCK\Master_sub_slock\yzj\programe_updata\SZZ485_V1.4\source\led.c"
	line	653
	global	__size_of_up_date
	__size_of_up_date	equ	__end_of_up_date-_up_date
	
_up_date:	
	opt	stack 2
; Regs used in _up_date: [wreg-fsr0h+status,2+status,0+pclath+cstack]
;up_date@date stored from wreg
	line	655
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(up_date@date)
	
l14248:	
;led.c: 654: UINT8 i;
;led.c: 655: for(i=0;i<length;i++)
	clrc
	movlw	0
	btfsc	status,0
	movlw	1
	movwf	(up_date@i)
	goto	l14254
	line	656
	
l3382:	
	line	657
	
l14250:	
;led.c: 656: {
;led.c: 657: seg_disp(date[i],dian,flag);
	movf	(up_date@dian),w
	movwf	(??_up_date+0)+0
	movf	(??_up_date+0)+0,w
	movwf	(?_seg_disp)
	movf	(up_date@flag),w
	movwf	(??_up_date+1)+0
	movf	(??_up_date+1)+0,w
	movwf	0+(?_seg_disp)+01h
	movf	(up_date@i),w
	addwf	(up_date@date),w
	movwf	(??_up_date+2)+0
	movf	0+(??_up_date+2)+0,w
	movwf	fsr0
	bcf	status, 7	;select IRP bank0
	movf	indf,w
	fcall	_seg_disp
	line	655
	
l14252:	
	movlw	(01h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_up_date+0)+0
	movf	(??_up_date+0)+0,w
	addwf	(up_date@i),f
	goto	l14254
	
l3381:	
	
l14254:	
	movf	(up_date@length),w
	subwf	(up_date@i),w
	skipc
	goto	u6471
	goto	u6470
u6471:
	goto	l14250
u6470:
	goto	l14256
	
l3383:	
	line	662
	
l14256:	
;led.c: 658: }
;led.c: 662: latch_rclk(flag);
	movf	(up_date@flag),w
	fcall	_latch_rclk
	line	663
	
l3384:	
	return
	opt stack 0
GLOBAL	__end_of_up_date
	__end_of_up_date:
;; =============== function _up_date ends ============

	signat	_up_date,16504
	global	_settime
psect	text1430,local,class=CODE,delta=2
global __ptext1430
__ptext1430:

;; *************** function _settime *****************
;; Defined at:
;;		line 93 in file "E:\Projects\COLOCK\Master_sub_slock\yzj\programe_updata\SZZ485_V1.4\source\DS3231.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  write_time      7   23[BANK0 ] unsigned char [7]
;;  i               1   30[BANK0 ] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK2
;;      Params:         0       0       0       0
;;      Locals:         0       8       0       0
;;      Temps:          0       1       0       0
;;      Totals:         0       9       0       0
;;Total ram usage:        9 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    4
;; This function calls:
;;		_dec_hex
;;		_writebyte
;; This function is called by:
;;		_up_time1
;;		_up_time2
;;		_main
;; This function uses a non-reentrant model
;;
psect	text1430
	file	"E:\Projects\COLOCK\Master_sub_slock\yzj\programe_updata\SZZ485_V1.4\source\DS3231.c"
	line	93
	global	__size_of_settime
	__size_of_settime	equ	__end_of_settime-_settime
	
_settime:	
	opt	stack 2
; Regs used in _settime: [wreg-fsr0h+status,2+status,0+pclath+cstack]
	line	97
	
l14226:	
;DS3231.c: 95: UINT8 write_time[7],i;
;DS3231.c: 97: write_time[0] = dec_hex(old_time.sec);
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	0+(_old_time)+02h,w
	fcall	_dec_hex
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_settime+0)+0
	movf	(??_settime+0)+0,w
	movwf	(settime@write_time)
	line	98
;DS3231.c: 98: write_time[1] = dec_hex(old_time.min);
	movf	0+(_old_time)+01h,w
	fcall	_dec_hex
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_settime+0)+0
	movf	(??_settime+0)+0,w
	movwf	0+(settime@write_time)+01h
	line	99
;DS3231.c: 99: write_time[2] = dec_hex(old_time.hour);
	movf	(_old_time),w
	fcall	_dec_hex
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_settime+0)+0
	movf	(??_settime+0)+0,w
	movwf	0+(settime@write_time)+02h
	line	100
	
l14228:	
;DS3231.c: 100: write_time[3] = old_date.day;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(_old_date)^080h,w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_settime+0)+0
	movf	(??_settime+0)+0,w
	movwf	0+(settime@write_time)+03h
	line	101
	
l14230:	
;DS3231.c: 101: write_time[4] = dec_hex(old_date.date);
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	0+(_old_date)^080h+01h,w
	fcall	_dec_hex
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_settime+0)+0
	movf	(??_settime+0)+0,w
	movwf	0+(settime@write_time)+04h
	line	102
	
l14232:	
;DS3231.c: 102: write_time[5] = dec_hex(old_date.month);
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	0+(_old_date)^080h+02h,w
	fcall	_dec_hex
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_settime+0)+0
	movf	(??_settime+0)+0,w
	movwf	0+(settime@write_time)+05h
	line	103
	
l14234:	
;DS3231.c: 103: write_time[6] = dec_hex(old_date.year);
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	0+(_old_date)^080h+03h,w
	fcall	_dec_hex
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_settime+0)+0
	movf	(??_settime+0)+0,w
	movwf	0+(settime@write_time)+06h
	line	104
	
l14236:	
;DS3231.c: 104: for(i=0;i<7;i++)
	clrc
	movlw	0
	btfsc	status,0
	movlw	1
	movwf	(settime@i)
	
l14238:	
	movlw	(07h)
	subwf	(settime@i),w
	skipc
	goto	u6451
	goto	u6450
u6451:
	goto	l14242
u6450:
	goto	l2474
	
l14240:	
	goto	l2474
	line	105
	
l2472:	
	line	106
	
l14242:	
;DS3231.c: 105: {
;DS3231.c: 106: writebyte(0x00+i,write_time[i]);
	movf	(settime@i),w
	addlw	settime@write_time&0ffh
	movwf	fsr0
	bcf	status, 7	;select IRP bank0
	movf	indf,w
	movwf	(??_settime+0)+0
	movf	(??_settime+0)+0,w
	movwf	(?_writebyte)
	movf	(settime@i),w
	fcall	_writebyte
	line	104
	
l14244:	
	movlw	(01h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_settime+0)+0
	movf	(??_settime+0)+0,w
	addwf	(settime@i),f
	
l14246:	
	movlw	(07h)
	subwf	(settime@i),w
	skipc
	goto	u6461
	goto	u6460
u6461:
	goto	l14242
u6460:
	goto	l2474
	
l2473:	
	line	117
	
l2474:	
	return
	opt stack 0
GLOBAL	__end_of_settime
	__end_of_settime:
;; =============== function _settime ends ============

	signat	_settime,88
	global	_get_time
psect	text1431,local,class=CODE,delta=2
global __ptext1431
__ptext1431:

;; *************** function _get_time *****************
;; Defined at:
;;		line 47 in file "E:\Projects\COLOCK\Master_sub_slock\yzj\programe_updata\SZZ485_V1.4\source\DS3231.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  ds3231_time     7   40[BANK0 ] unsigned char [7]
;;  ds3231_time3    7   33[BANK0 ] unsigned char [7]
;;  ds3231_time2    7   26[BANK0 ] unsigned char [7]
;;  i               1   48[BANK0 ] unsigned char 
;;  ds3231_state    1   47[BANK0 ] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK2
;;      Params:         0       0       0       0
;;      Locals:         0      23       0       0
;;      Temps:          0       1       0       0
;;      Totals:         0      24       0       0
;;Total ram usage:       24 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    4
;; This function calls:
;;		_readbyte
;;		_writebyte
;;		_hex_dec
;;		_calc_zone
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text1431
	file	"E:\Projects\COLOCK\Master_sub_slock\yzj\programe_updata\SZZ485_V1.4\source\DS3231.c"
	line	47
	global	__size_of_get_time
	__size_of_get_time	equ	__end_of_get_time-_get_time
	
_get_time:	
	opt	stack 3
; Regs used in _get_time: [wreg-fsr0h+status,2+status,0+pclath+cstack]
	line	50
	
l14162:	
;DS3231.c: 49: UINT8 ds3231_state,ds3231_time[7],ds3231_time2[7],ds3231_time3[7],i;
;DS3231.c: 50: ds3231_state = readbyte(0x0F);
	movlw	(0Fh)
	fcall	_readbyte
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_get_time+0)+0
	movf	(??_get_time+0)+0,w
	movwf	(get_time@ds3231_state)
	line	51
	
l14164:	
;DS3231.c: 51: if(ds3231_state & 0x80)
	btfss	(get_time@ds3231_state),(7)&7
	goto	u6321
	goto	u6320
u6321:
	goto	l14170
u6320:
	line	53
	
l14166:	
;DS3231.c: 52: {
;DS3231.c: 53: ds3231_state = ds3231_state & 0x7f;
	movf	(get_time@ds3231_state),w
	andlw	07Fh
	movwf	(??_get_time+0)+0
	movf	(??_get_time+0)+0,w
	movwf	(get_time@ds3231_state)
	line	54
	
l14168:	
;DS3231.c: 54: writebyte(0x0F,ds3231_state);
	movf	(get_time@ds3231_state),w
	movwf	(??_get_time+0)+0
	movf	(??_get_time+0)+0,w
	movwf	(?_writebyte)
	movlw	(0Fh)
	fcall	_writebyte
	goto	l14170
	line	55
	
l2460:	
	line	57
	
l14170:	
;DS3231.c: 55: }
;DS3231.c: 57: for(i=0;i<7;i++)
	clrc
	movlw	0
	btfsc	status,0
	movlw	1
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(get_time@i)
	
l14172:	
	movlw	(07h)
	subwf	(get_time@i),w
	skipc
	goto	u6331
	goto	u6330
u6331:
	goto	l14176
u6330:
	goto	l14182
	
l14174:	
	goto	l14182
	line	58
	
l2461:	
	line	59
	
l14176:	
;DS3231.c: 58: {
;DS3231.c: 59: ds3231_time[i] = readbyte(0x00+i);
	movf	(get_time@i),w
	fcall	_readbyte
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_get_time+0)+0
	movf	(get_time@i),w
	addlw	get_time@ds3231_time&0ffh
	movwf	fsr0
	movf	(??_get_time+0)+0,w
	bcf	status, 7	;select IRP bank0
	movwf	indf
	line	60
;DS3231.c: 60: ds3231_time2[i] = readbyte(0x00+i);
	movf	(get_time@i),w
	fcall	_readbyte
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_get_time+0)+0
	movf	(get_time@i),w
	addlw	get_time@ds3231_time2&0ffh
	movwf	fsr0
	movf	(??_get_time+0)+0,w
	bcf	status, 7	;select IRP bank0
	movwf	indf
	line	61
;DS3231.c: 61: ds3231_time3[i] = readbyte(0x00+i);
	movf	(get_time@i),w
	fcall	_readbyte
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_get_time+0)+0
	movf	(get_time@i),w
	addlw	get_time@ds3231_time3&0ffh
	movwf	fsr0
	movf	(??_get_time+0)+0,w
	bcf	status, 7	;select IRP bank0
	movwf	indf
	line	63
;DS3231.c: 63: ds3231_time[i] = hex_dec(ds3231_time[i]);
	movf	(get_time@i),w
	addlw	get_time@ds3231_time&0ffh
	movwf	fsr0
	movf	indf,w
	fcall	_hex_dec
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_get_time+0)+0
	movf	(get_time@i),w
	addlw	get_time@ds3231_time&0ffh
	movwf	fsr0
	movf	(??_get_time+0)+0,w
	bcf	status, 7	;select IRP bank0
	movwf	indf
	line	64
;DS3231.c: 64: ds3231_time2[i] = hex_dec(ds3231_time2[i]);
	movf	(get_time@i),w
	addlw	get_time@ds3231_time2&0ffh
	movwf	fsr0
	movf	indf,w
	fcall	_hex_dec
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_get_time+0)+0
	movf	(get_time@i),w
	addlw	get_time@ds3231_time2&0ffh
	movwf	fsr0
	movf	(??_get_time+0)+0,w
	bcf	status, 7	;select IRP bank0
	movwf	indf
	line	65
;DS3231.c: 65: ds3231_time3[i] = hex_dec(ds3231_time3[i]);
	movf	(get_time@i),w
	addlw	get_time@ds3231_time3&0ffh
	movwf	fsr0
	movf	indf,w
	fcall	_hex_dec
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_get_time+0)+0
	movf	(get_time@i),w
	addlw	get_time@ds3231_time3&0ffh
	movwf	fsr0
	movf	(??_get_time+0)+0,w
	bcf	status, 7	;select IRP bank0
	movwf	indf
	line	57
	
l14178:	
	movlw	(01h)
	movwf	(??_get_time+0)+0
	movf	(??_get_time+0)+0,w
	addwf	(get_time@i),f
	
l14180:	
	movlw	(07h)
	subwf	(get_time@i),w
	skipc
	goto	u6341
	goto	u6340
u6341:
	goto	l14176
u6340:
	goto	l14182
	
l2462:	
	line	68
	
l14182:	
;DS3231.c: 67: }
;DS3231.c: 68: for(i=0;i<7;i++)
	clrc
	movlw	0
	btfsc	status,0
	movlw	1
	movwf	(get_time@i)
	
l14184:	
	movlw	(07h)
	subwf	(get_time@i),w
	skipc
	goto	u6351
	goto	u6350
u6351:
	goto	l14188
u6350:
	goto	l14196
	
l14186:	
	goto	l14196
	line	69
	
l2463:	
	line	70
	
l14188:	
;DS3231.c: 69: {
;DS3231.c: 70: if((ds3231_time[i] !=ds3231_time2[i]) || (ds3231_time[i] !=ds3231_time3[i]))
	movf	(get_time@i),w
	addlw	get_time@ds3231_time2&0ffh
	movwf	fsr
	bcf	status, 7	;select IRP bank0
	movf	indf,w
	movwf	(??_get_time+0)+0
	movf	(get_time@i),w
	addlw	get_time@ds3231_time&0ffh
	movwf	fsr0
	movf	indf,w
	xorwf	(??_get_time+0)+0,w
	skipz
	goto	u6361
	goto	u6360
u6361:
	goto	l2467
u6360:
	
l14190:	
	movf	(get_time@i),w
	addlw	get_time@ds3231_time3&0ffh
	movwf	fsr
	movf	indf,w
	movwf	(??_get_time+0)+0
	movf	(get_time@i),w
	addlw	get_time@ds3231_time&0ffh
	movwf	fsr0
	movf	indf,w
	xorwf	(??_get_time+0)+0,w
	skipnz
	goto	u6371
	goto	u6370
u6371:
	goto	l14192
u6370:
	
l2467:	
	line	72
;DS3231.c: 71: {
;DS3231.c: 72: TMR1ON = 0;GIE = 0;PEIE = 0;
	bcf	(128/8),(128)&7
	bcf	(95/8),(95)&7
	bcf	(94/8),(94)&7
	goto	l14192
	line	73
	
l2465:	
	line	68
	
l14192:	
	movlw	(01h)
	movwf	(??_get_time+0)+0
	movf	(??_get_time+0)+0,w
	addwf	(get_time@i),f
	
l14194:	
	movlw	(07h)
	subwf	(get_time@i),w
	skipc
	goto	u6381
	goto	u6380
u6381:
	goto	l14188
u6380:
	goto	l14196
	
l2464:	
	line	76
	
l14196:	
;DS3231.c: 73: }
;DS3231.c: 74: }
;DS3231.c: 76: TMR1H=0x00;
	clrf	(15)	;volatile
	line	77
;DS3231.c: 77: TMR1L=0x00;
	clrf	(14)	;volatile
	line	78
	
l14198:	
;DS3231.c: 78: old_time.sec = ds3231_time[0] ;
	movf	(get_time@ds3231_time),w
	movwf	(??_get_time+0)+0
	movf	(??_get_time+0)+0,w
	movwf	0+(_old_time)+02h
	line	79
	
l14200:	
;DS3231.c: 79: old_time.min = ds3231_time[1] ;
	movf	0+(get_time@ds3231_time)+01h,w
	movwf	(??_get_time+0)+0
	movf	(??_get_time+0)+0,w
	movwf	0+(_old_time)+01h
	line	80
	
l14202:	
;DS3231.c: 80: old_time.hour = ds3231_time[2] ;
	movf	0+(get_time@ds3231_time)+02h,w
	movwf	(??_get_time+0)+0
	movf	(??_get_time+0)+0,w
	movwf	(_old_time)
	line	81
	
l14204:	
;DS3231.c: 81: old_date.day = ds3231_time[3];
	movf	0+(get_time@ds3231_time)+03h,w
	movwf	(??_get_time+0)+0
	movf	(??_get_time+0)+0,w
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(_old_date)^080h
	line	82
	
l14206:	
;DS3231.c: 82: old_date.date = ds3231_time[4];
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	0+(get_time@ds3231_time)+04h,w
	movwf	(??_get_time+0)+0
	movf	(??_get_time+0)+0,w
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	0+(_old_date)^080h+01h
	line	83
	
l14208:	
;DS3231.c: 83: old_date.month = ds3231_time[5];
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	0+(get_time@ds3231_time)+05h,w
	movwf	(??_get_time+0)+0
	movf	(??_get_time+0)+0,w
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	0+(_old_date)^080h+02h
	line	84
	
l14210:	
;DS3231.c: 84: old_date.year = ds3231_time[6];
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	0+(get_time@ds3231_time)+06h,w
	movwf	(??_get_time+0)+0
	movf	(??_get_time+0)+0,w
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	0+(_old_date)^080h+03h
	line	85
	
l14212:	
;DS3231.c: 85: if(old_time.sec<=59 && old_time.min<=59 && old_time.hour<=23 && old_date.date<=31 && old_date.month<=12 && old_date.year<=99)
	movlw	(03Ch)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	subwf	0+(_old_time)+02h,w
	skipnc
	goto	u6391
	goto	u6390
u6391:
	goto	l2469
u6390:
	
l14214:	
	movlw	(03Ch)
	subwf	0+(_old_time)+01h,w
	skipnc
	goto	u6401
	goto	u6400
u6401:
	goto	l2469
u6400:
	
l14216:	
	movlw	(018h)
	subwf	(_old_time),w
	skipnc
	goto	u6411
	goto	u6410
u6411:
	goto	l2469
u6410:
	
l14218:	
	movlw	(020h)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	subwf	0+(_old_date)^080h+01h,w
	skipnc
	goto	u6421
	goto	u6420
u6421:
	goto	l2469
u6420:
	
l14220:	
	movlw	(0Dh)
	subwf	0+(_old_date)^080h+02h,w
	skipnc
	goto	u6431
	goto	u6430
u6431:
	goto	l2469
u6430:
	
l14222:	
	movlw	(064h)
	subwf	0+(_old_date)^080h+03h,w
	skipnc
	goto	u6441
	goto	u6440
u6441:
	goto	l2469
u6440:
	line	89
	
l14224:	
;DS3231.c: 88: {
;DS3231.c: 89: calc_zone();
	fcall	_calc_zone
	goto	l2469
	line	90
	
l2468:	
	line	91
	
l2469:	
	return
	opt stack 0
GLOBAL	__end_of_get_time
	__end_of_get_time:
;; =============== function _get_time ends ============

	signat	_get_time,88
	global	_ds3231_init
psect	text1432,local,class=CODE,delta=2
global __ptext1432
__ptext1432:

;; *************** function _ds3231_init *****************
;; Defined at:
;;		line 15 in file "E:\Projects\COLOCK\Master_sub_slock\yzj\programe_updata\SZZ485_V1.4\source\DS3231.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  ds3231_state    1    7[BANK0 ] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK2
;;      Params:         0       0       0       0
;;      Locals:         0       1       0       0
;;      Temps:          0       1       0       0
;;      Totals:         0       2       0       0
;;Total ram usage:        2 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    4
;; This function calls:
;;		_readbyte
;;		_writebyte
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text1432
	file	"E:\Projects\COLOCK\Master_sub_slock\yzj\programe_updata\SZZ485_V1.4\source\DS3231.c"
	line	15
	global	__size_of_ds3231_init
	__size_of_ds3231_init	equ	__end_of_ds3231_init-_ds3231_init
	
_ds3231_init:	
	opt	stack 3
; Regs used in _ds3231_init: [wreg+status,2+status,0+pclath+cstack]
	line	20
	
l14154:	
;DS3231.c: 19: UINT8 ds3231_state;
;DS3231.c: 20: TRISC3 = 0;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	bcf	(1083/8)^080h,(1083)&7
	line	37
	
l14156:	
;DS3231.c: 37: ntp_info.time_zone = 0x88;
	movlw	(088h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_ds3231_init+0)+0
	movf	(??_ds3231_init+0)+0,w
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	0+(_ntp_info)^080h+02h
	line	41
	
l14158:	
;DS3231.c: 41: ds3231_state = readbyte(0x0E);
	movlw	(0Eh)
	fcall	_readbyte
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_ds3231_init+0)+0
	movf	(??_ds3231_init+0)+0,w
	movwf	(ds3231_init@ds3231_state)
	line	42
	
l14160:	
;DS3231.c: 42: writebyte(0x0E,ds3231_state & 0x7f);
	movf	(ds3231_init@ds3231_state),w
	andlw	07Fh
	movwf	(??_ds3231_init+0)+0
	movf	(??_ds3231_init+0)+0,w
	movwf	(?_writebyte)
	movlw	(0Eh)
	fcall	_writebyte
	line	44
	
l2457:	
	return
	opt stack 0
GLOBAL	__end_of_ds3231_init
	__end_of_ds3231_init:
;; =============== function _ds3231_init ends ============

	signat	_ds3231_init,88
	global	_date_dec
psect	text1433,local,class=CODE,delta=2
global __ptext1433
__ptext1433:

;; *************** function _date_dec *****************
;; Defined at:
;;		line 172 in file "E:\Projects\COLOCK\Master_sub_slock\yzj\programe_updata\SZZ485_V1.4\source\timer1.c"
;; Parameters:    Size  Location     Type
;;  t               1    wreg     PTR struct _DATE
;;		 -> old_date(4), 
;; Auto vars:     Size  Location     Type
;;  t               1   11[BANK0 ] PTR struct _DATE
;;		 -> old_date(4), 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK2
;;      Params:         0       0       0       0
;;      Locals:         0       1       0       0
;;      Temps:          0       1       0       0
;;      Totals:         0       2       0       0
;;Total ram usage:        2 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    4
;; This function calls:
;;		_isleap
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text1433
	file	"E:\Projects\COLOCK\Master_sub_slock\yzj\programe_updata\SZZ485_V1.4\source\timer1.c"
	line	172
	global	__size_of_date_dec
	__size_of_date_dec	equ	__end_of_date_dec-_date_dec
	
_date_dec:	
	opt	stack 3
; Regs used in _date_dec: [wreg-fsr0h+status,2+status,0+pclath+cstack]
;date_dec@t stored from wreg
	line	174
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(date_dec@t)
	
l14136:	
;timer1.c: 174: if(t->month == 2)
	movf	(date_dec@t),w
	addlw	02h
	movwf	fsr0
	bcf	status, 7	;select IRP bank0
	movf	indf,w
	xorlw	02h
	skipz
	goto	u6281
	goto	u6280
u6281:
	goto	l14142
u6280:
	line	176
	
l14138:	
;timer1.c: 175: {
;timer1.c: 176: if(isleap(t->year+2000))
	movf	(date_dec@t),w
	addlw	03h
	movwf	fsr0
	movf	indf,w
	addlw	low(07D0h)
	movwf	(?_isleap)
	movlw	high(07D0h)
	skipnc
	movlw	(high(07D0h)+1)&0ffh
	movwf	((?_isleap))+1
	fcall	_isleap
	xorlw	0
	skipnz
	goto	u6291
	goto	u6290
u6291:
	goto	l14142
u6290:
	line	178
	
l14140:	
;timer1.c: 177: {
;timer1.c: 178: months[2] = 29;
	movlw	(01Dh)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_date_dec+0)+0
	movf	(??_date_dec+0)+0,w
	bcf	status, 5	;RP0=0, select bank2
	bsf	status, 6	;RP1=1, select bank2
	movwf	0+(_months)^0100h+02h
	goto	l14142
	line	179
	
l825:	
	goto	l14142
	line	180
	
l824:	
	line	181
	
l14142:	
;timer1.c: 179: }
;timer1.c: 180: }
;timer1.c: 181: if(t->date == 1)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(date_dec@t),w
	addlw	01h
	movwf	fsr0
	bcf	status, 7	;select IRP bank0
	movf	indf,w
	xorlw	01h
	skipz
	goto	u6301
	goto	u6300
u6301:
	goto	l14152
u6300:
	line	183
	
l14144:	
;timer1.c: 182: {
;timer1.c: 183: if(t->month == 1)
	movf	(date_dec@t),w
	addlw	02h
	movwf	fsr0
	movf	indf,w
	xorlw	01h
	skipz
	goto	u6311
	goto	u6310
u6311:
	goto	l14150
u6310:
	line	185
	
l14146:	
;timer1.c: 184: {
;timer1.c: 185: t->month = 12;
	movlw	(0Ch)
	movwf	(??_date_dec+0)+0
	movf	(date_dec@t),w
	addlw	02h
	movwf	fsr0
	movf	(??_date_dec+0)+0,w
	movwf	indf
	line	186
	
l14148:	
;timer1.c: 186: t->year--;
	movf	(date_dec@t),w
	addlw	03h
	movwf	fsr0
	movlw	low(01h)
	subwf	indf,f
	line	188
;timer1.c: 188: }
	goto	l828
	line	189
	
l827:	
	line	191
	
l14150:	
;timer1.c: 189: else
;timer1.c: 190: {
;timer1.c: 191: t->month--;
	movf	(date_dec@t),w
	addlw	02h
	movwf	fsr0
	movlw	low(01h)
	subwf	indf,f
	line	192
	
l828:	
	line	193
;timer1.c: 192: }
;timer1.c: 193: t->date = months[t->month];
	movf	(date_dec@t),w
	addlw	02h
	movwf	fsr0
	movf	indf,w
	addlw	_months&0ffh
	movwf	fsr0
	bsf	status, 7	;select IRP bank2
	movf	indf,w
	movwf	(??_date_dec+0)+0
	movf	(date_dec@t),w
	addlw	01h
	movwf	fsr0
	movf	(??_date_dec+0)+0,w
	bcf	status, 7	;select IRP bank0
	movwf	indf
	line	194
;timer1.c: 194: }
	goto	l830
	line	195
	
l826:	
	line	197
	
l14152:	
;timer1.c: 195: else
;timer1.c: 196: {
;timer1.c: 197: t->date--;
	movf	(date_dec@t),w
	addlw	01h
	movwf	fsr0
	movlw	low(01h)
	subwf	indf,f
	goto	l830
	line	198
	
l829:	
	line	203
	
l830:	
	return
	opt stack 0
GLOBAL	__end_of_date_dec
	__end_of_date_dec:
;; =============== function _date_dec ends ============

	signat	_date_dec,4216
	global	_date_add
psect	text1434,local,class=CODE,delta=2
global __ptext1434
__ptext1434:

;; *************** function _date_add *****************
;; Defined at:
;;		line 139 in file "E:\Projects\COLOCK\Master_sub_slock\yzj\programe_updata\SZZ485_V1.4\source\timer1.c"
;; Parameters:    Size  Location     Type
;;  t               1    wreg     PTR struct _DATE
;;		 -> old_date(4), 
;; Auto vars:     Size  Location     Type
;;  t               1   12[BANK0 ] PTR struct _DATE
;;		 -> old_date(4), 
;;  month_day       1   11[BANK0 ] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK2
;;      Params:         0       0       0       0
;;      Locals:         0       2       0       0
;;      Temps:          0       1       0       0
;;      Totals:         0       3       0       0
;;Total ram usage:        3 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    4
;; This function calls:
;;		_isleap
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text1434
	file	"E:\Projects\COLOCK\Master_sub_slock\yzj\programe_updata\SZZ485_V1.4\source\timer1.c"
	line	139
	global	__size_of_date_add
	__size_of_date_add	equ	__end_of_date_add-_date_add
	
_date_add:	
	opt	stack 3
; Regs used in _date_add: [wreg-fsr0h+status,2+status,0+pclath+cstack]
;date_add@t stored from wreg
	line	141
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(date_add@t)
	
l14116:	
;timer1.c: 140: UINT8 month_day;
;timer1.c: 141: if(t->month == 2)
	movf	(date_add@t),w
	addlw	02h
	movwf	fsr0
	bcf	status, 7	;select IRP bank0
	movf	indf,w
	xorlw	02h
	skipz
	goto	u6241
	goto	u6240
u6241:
	goto	l14122
u6240:
	line	143
	
l14118:	
;timer1.c: 142: {
;timer1.c: 143: if(isleap(t->year+2000))
	movf	(date_add@t),w
	addlw	03h
	movwf	fsr0
	movf	indf,w
	addlw	low(07D0h)
	movwf	(?_isleap)
	movlw	high(07D0h)
	skipnc
	movlw	(high(07D0h)+1)&0ffh
	movwf	((?_isleap))+1
	fcall	_isleap
	xorlw	0
	skipnz
	goto	u6251
	goto	u6250
u6251:
	goto	l14122
u6250:
	line	145
	
l14120:	
;timer1.c: 144: {
;timer1.c: 145: months[2] = 29;
	movlw	(01Dh)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_date_add+0)+0
	movf	(??_date_add+0)+0,w
	bcf	status, 5	;RP0=0, select bank2
	bsf	status, 6	;RP1=1, select bank2
	movwf	0+(_months)^0100h+02h
	goto	l14122
	line	146
	
l816:	
	goto	l14122
	line	147
	
l815:	
	line	148
	
l14122:	
;timer1.c: 146: }
;timer1.c: 147: }
;timer1.c: 148: month_day = months[t->month];
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(date_add@t),w
	addlw	02h
	movwf	fsr0
	bcf	status, 7	;select IRP bank0
	movf	indf,w
	addlw	_months&0ffh
	movwf	fsr0
	bsf	status, 7	;select IRP bank2
	movf	indf,w
	movwf	(??_date_add+0)+0
	movf	(??_date_add+0)+0,w
	movwf	(date_add@month_day)
	line	149
	
l14124:	
;timer1.c: 149: if(t->day >= month_day)
	movf	(date_add@t),w
	movwf	fsr0
	movf	(date_add@month_day),w
	bcf	status, 7	;select IRP bank0
	subwf	indf,w
	skipc
	goto	u6261
	goto	u6260
u6261:
	goto	l14134
u6260:
	line	151
	
l14126:	
;timer1.c: 150: {
;timer1.c: 151: t->day = 1;
	movf	(date_add@t),w
	movwf	fsr0
	clrf	indf
	bsf	status,0
	rlf	indf,f
	line	152
	
l14128:	
;timer1.c: 152: if(t->month >=12)
	movf	(date_add@t),w
	addlw	02h
	movwf	fsr0
	movlw	(0Ch)
	subwf	indf,w
	skipc
	goto	u6271
	goto	u6270
u6271:
	goto	l14132
u6270:
	line	154
	
l14130:	
;timer1.c: 153: {
;timer1.c: 154: t->month = 1;
	movf	(date_add@t),w
	addlw	02h
	movwf	fsr0
	clrf	indf
	bsf	status,0
	rlf	indf,f
	line	155
;timer1.c: 155: t->year++;
	movlw	(01h)
	movwf	(??_date_add+0)+0
	movf	(date_add@t),w
	addlw	03h
	movwf	fsr0
	movf	(??_date_add+0)+0,w
	addwf	indf,f
	line	156
;timer1.c: 156: }
	goto	l821
	line	157
	
l818:	
	line	159
	
l14132:	
;timer1.c: 157: else
;timer1.c: 158: {
;timer1.c: 159: t->month++;
	movlw	(01h)
	movwf	(??_date_add+0)+0
	movf	(date_add@t),w
	addlw	02h
	movwf	fsr0
	movf	(??_date_add+0)+0,w
	addwf	indf,f
	goto	l821
	line	160
	
l819:	
	line	161
;timer1.c: 160: }
;timer1.c: 161: }
	goto	l821
	line	162
	
l817:	
	line	164
	
l14134:	
;timer1.c: 162: else
;timer1.c: 163: {
;timer1.c: 164: t->day++;
	movlw	(01h)
	movwf	(??_date_add+0)+0
	movf	(date_add@t),w
	movwf	fsr0
	movf	(??_date_add+0)+0,w
	addwf	indf,f
	goto	l821
	line	165
	
l820:	
	line	167
	
l821:	
	return
	opt stack 0
GLOBAL	__end_of_date_add
	__end_of_date_add:
;; =============== function _date_add ends ============

	signat	_date_add,4216
	global	_MakeCRC16
psect	text1435,local,class=CODE,delta=2
global __ptext1435
__ptext1435:

;; *************** function _MakeCRC16 *****************
;; Defined at:
;;		line 24 in file "E:\Projects\COLOCK\Master_sub_slock\yzj\programe_updata\SZZ485_V1.4\source\CRC.c"
;; Parameters:    Size  Location     Type
;;  buf             1    wreg     PTR unsigned char 
;;		 -> tx_udata(20), copy_rx_udata(17), 
;;  len             1    7[BANK0 ] unsigned char 
;; Auto vars:     Size  Location     Type
;;  buf             1   11[BANK0 ] PTR unsigned char 
;;		 -> tx_udata(20), copy_rx_udata(17), 
;;  crc             2   16[BANK0 ] unsigned short 
;;  i               2   14[BANK0 ] unsigned short 
;;  lo              1   13[BANK0 ] unsigned char 
;;  hi              1   12[BANK0 ] unsigned char 
;; Return value:  Size  Location     Type
;;                  2    7[BANK0 ] unsigned short 
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, btemp+1, pclath, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK2
;;      Params:         0       2       0       0
;;      Locals:         0       7       0       0
;;      Temps:          0       2       0       0
;;      Totals:         0      11       0       0
;;Total ram usage:       11 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    3
;; This function calls:
;;		_calccrc
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text1435
	file	"E:\Projects\COLOCK\Master_sub_slock\yzj\programe_updata\SZZ485_V1.4\source\CRC.c"
	line	24
	global	__size_of_MakeCRC16
	__size_of_MakeCRC16	equ	__end_of_MakeCRC16-_MakeCRC16
	
_MakeCRC16:	
	opt	stack 4
; Regs used in _MakeCRC16: [wreg-fsr0h+status,2+status,0+btemp+1+pclath+cstack]
;MakeCRC16@buf stored from wreg
	line	28
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(MakeCRC16@buf)
	
l14096:	
;CRC.c: 25: unsigned char hi,lo;
;CRC.c: 26: unsigned short int i;
;CRC.c: 27: unsigned short int crc;
;CRC.c: 28: crc=0xFFFF;
	movlw	low(0FFFFh)
	movwf	(MakeCRC16@crc)
	movlw	high(0FFFFh)
	movwf	((MakeCRC16@crc))+1
	line	29
;CRC.c: 29: for (i=0;i<len;i++)
	movlw	low(0)
	movwf	(MakeCRC16@i)
	movlw	high(0)
	movwf	((MakeCRC16@i))+1
	goto	l14104
	line	30
	
l5218:	
	line	31
	
l14098:	
;CRC.c: 30: {
;CRC.c: 31: crc=calccrc(*buf,crc);
	movf	(MakeCRC16@crc+1),w
	clrf	(?_calccrc+1)
	addwf	(?_calccrc+1)
	movf	(MakeCRC16@crc),w
	clrf	(?_calccrc)
	addwf	(?_calccrc)

	movf	(MakeCRC16@buf),w
	movwf	fsr0
	bcf	status, 7	;select IRP bank0
	movf	indf,w
	fcall	_calccrc
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(1+(?_calccrc)),w
	clrf	(MakeCRC16@crc+1)
	addwf	(MakeCRC16@crc+1)
	movf	(0+(?_calccrc)),w
	clrf	(MakeCRC16@crc)
	addwf	(MakeCRC16@crc)

	line	32
	
l14100:	
;CRC.c: 32: buf++;
	movlw	(01h)
	movwf	(??_MakeCRC16+0)+0
	movf	(??_MakeCRC16+0)+0,w
	addwf	(MakeCRC16@buf),f
	line	29
	
l14102:	
	movlw	low(01h)
	addwf	(MakeCRC16@i),f
	skipnc
	incf	(MakeCRC16@i+1),f
	movlw	high(01h)
	addwf	(MakeCRC16@i+1),f
	goto	l14104
	
l5217:	
	
l14104:	
	movf	(MakeCRC16@len),w
	movwf	(??_MakeCRC16+0)+0
	clrf	(??_MakeCRC16+0)+0+1
	movf	1+(??_MakeCRC16+0)+0,w
	subwf	(MakeCRC16@i+1),w
	skipz
	goto	u6225
	movf	0+(??_MakeCRC16+0)+0,w
	subwf	(MakeCRC16@i),w
u6225:
	skipc
	goto	u6221
	goto	u6220
u6221:
	goto	l14098
u6220:
	goto	l14106
	
l5219:	
	line	34
	
l14106:	
;CRC.c: 33: }
;CRC.c: 34: hi=crc%256;
	movf	(MakeCRC16@crc),w
	movwf	(??_MakeCRC16+0)+0
	movf	(??_MakeCRC16+0)+0,w
	movwf	(MakeCRC16@hi)
	line	35
	
l14108:	
;CRC.c: 35: lo=crc/256;
	movf	(MakeCRC16@crc+1),w
	movwf	(??_MakeCRC16+0)+0
	movf	(??_MakeCRC16+0)+0,w
	movwf	(MakeCRC16@lo)
	line	36
	
l14110:	
;CRC.c: 36: crc=((unsigned short int)hi<<8)|lo;
	movf	(MakeCRC16@hi),w
	movwf	(??_MakeCRC16+0)+0
	clrf	(??_MakeCRC16+0)+0+1
	movlw	08h
	movwf	btemp+1
u6235:
	clrc
	rlf	(??_MakeCRC16+0)+0,f
	rlf	(??_MakeCRC16+0)+1,f
	decfsz	btemp+1,f
	goto	u6235
	movf	(MakeCRC16@lo),w
	iorwf	0+(??_MakeCRC16+0)+0,w
	movwf	(MakeCRC16@crc)
	movf	1+(??_MakeCRC16+0)+0,w
	movwf	1+(MakeCRC16@crc)
	line	37
	
l14112:	
;CRC.c: 37: return crc;
	movf	(MakeCRC16@crc+1),w
	clrf	(?_MakeCRC16+1)
	addwf	(?_MakeCRC16+1)
	movf	(MakeCRC16@crc),w
	clrf	(?_MakeCRC16)
	addwf	(?_MakeCRC16)

	goto	l5220
	
l14114:	
	line	38
	
l5220:	
	return
	opt stack 0
GLOBAL	__end_of_MakeCRC16
	__end_of_MakeCRC16:
;; =============== function _MakeCRC16 ends ============

	signat	_MakeCRC16,8314
	global	_seg_disp
psect	text1436,local,class=CODE,delta=2
global __ptext1436
__ptext1436:

;; *************** function _seg_disp *****************
;; Defined at:
;;		line 135 in file "E:\Projects\COLOCK\Master_sub_slock\yzj\programe_updata\SZZ485_V1.4\source\led.c"
;; Parameters:    Size  Location     Type
;;  num             1    wreg     unsigned char 
;;  dp              1    1[BANK0 ] unsigned char 
;;  flag            1    2[BANK0 ] unsigned char 
;; Auto vars:     Size  Location     Type
;;  num             1    4[BANK0 ] unsigned char 
;;  i               1    6[BANK0 ] unsigned char 
;;  date            1    5[BANK0 ] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK2
;;      Params:         0       2       0       0
;;      Locals:         0       3       0       0
;;      Temps:          0       1       0       0
;;      Totals:         0       6       0       0
;;Total ram usage:        6 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    3
;; This function calls:
;;		_shift_srclk
;; This function is called by:
;;		_up_time1
;;		_up_date
;;		_up_time2
;; This function uses a non-reentrant model
;;
psect	text1436
	file	"E:\Projects\COLOCK\Master_sub_slock\yzj\programe_updata\SZZ485_V1.4\source\led.c"
	line	135
	global	__size_of_seg_disp
	__size_of_seg_disp	equ	__end_of_seg_disp-_seg_disp
	
_seg_disp:	
	opt	stack 3
; Regs used in _seg_disp: [wreg-fsr0h+status,2+status,0+pclath+cstack]
;seg_disp@num stored from wreg
	line	138
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(seg_disp@num)
	
l14056:	
;led.c: 136: UINT8 i;
;led.c: 137: UINT8 date;
;led.c: 138: if(flag==1)
	movf	(seg_disp@flag),w
	xorlw	01h
	skipz
	goto	u6121
	goto	u6120
u6121:
	goto	l14060
u6120:
	line	140
	
l14058:	
;led.c: 139: {
;led.c: 140: date = SEG_CODE1[num];
	movf	(seg_disp@num),w
	addlw	low((_SEG_CODE1-__stringbase))
	movwf	fsr0
	fcall	stringdir
	movwf	(??_seg_disp+0)+0
	movf	(??_seg_disp+0)+0,w
	movwf	(seg_disp@date)
	line	141
;led.c: 141: }
	goto	l14062
	line	142
	
l3317:	
	line	144
	
l14060:	
;led.c: 142: else
;led.c: 143: {
;led.c: 144: date = SEG_CODE2[num];
	movf	(seg_disp@num),w
	addlw	low((_SEG_CODE2-__stringbase))
	movwf	fsr0
	fcall	stringdir
	movwf	(??_seg_disp+0)+0
	movf	(??_seg_disp+0)+0,w
	movwf	(seg_disp@date)
	goto	l14062
	line	145
	
l3318:	
	line	146
	
l14062:	
;led.c: 145: }
;led.c: 146: if(dp)
	movf	(seg_disp@dp),w
	skipz
	goto	u6130
	goto	l14070
u6130:
	line	148
	
l14064:	
;led.c: 147: {
;led.c: 148: if(flag==1)
	movf	(seg_disp@flag),w
	xorlw	01h
	skipz
	goto	u6141
	goto	u6140
u6141:
	goto	l14068
u6140:
	line	150
	
l14066:	
;led.c: 149: {
;led.c: 150: date |= ONE_DP;
	movlw	(_ONE_DP-__stringbase)
	movwf	fsr0
	fcall	stringdir
	movwf	(??_seg_disp+0)+0
	movf	(??_seg_disp+0)+0,w
	iorwf	(seg_disp@date),f
	line	151
;led.c: 151: }
	goto	l14070
	line	152
	
l3320:	
	line	154
	
l14068:	
;led.c: 152: else
;led.c: 153: {
;led.c: 154: date |= TWO_DP;
	movlw	(_TWO_DP-__stringbase)
	movwf	fsr0
	fcall	stringdir
	movwf	(??_seg_disp+0)+0
	movf	(??_seg_disp+0)+0,w
	iorwf	(seg_disp@date),f
	goto	l14070
	line	155
	
l3321:	
	goto	l14070
	line	156
	
l3319:	
	line	157
	
l14070:	
;led.c: 155: }
;led.c: 156: }
;led.c: 157: for(i=0; i<8; i++)
	clrc
	movlw	0
	btfsc	status,0
	movlw	1
	movwf	(seg_disp@i)
	
l14072:	
	movlw	(08h)
	subwf	(seg_disp@i),w
	skipc
	goto	u6151
	goto	u6150
u6151:
	goto	l14076
u6150:
	goto	l3332
	
l14074:	
	goto	l3332
	line	158
	
l3322:	
	line	159
	
l14076:	
;led.c: 158: {
;led.c: 159: if( date&(1<<i) )
	movlw	(01h)
	movwf	(??_seg_disp+0)+0
	incf	(seg_disp@i),w
	goto	u6164
u6165:
	clrc
	rlf	(??_seg_disp+0)+0,f
u6164:
	addlw	-1
	skipz
	goto	u6165
	movf	0+(??_seg_disp+0)+0,w
	andwf	(seg_disp@date),w
	btfsc	status,2
	goto	u6171
	goto	u6170
u6171:
	goto	l14082
u6170:
	line	161
	
l14078:	
;led.c: 160: {
;led.c: 161: if(flag==1)
	movf	(seg_disp@flag),w
	xorlw	01h
	skipz
	goto	u6181
	goto	u6180
u6181:
	goto	l3325
u6180:
	line	163
	
l14080:	
;led.c: 162: {
;led.c: 163: RC0 = 1;
	bsf	(56/8),(56)&7
	line	164
;led.c: 164: }
	goto	l3327
	line	165
	
l3325:	
	line	167
;led.c: 165: else
;led.c: 166: {
;led.c: 167: RA2 = 1;
	bsf	(42/8),(42)&7
	goto	l3327
	line	168
	
l3326:	
	line	169
;led.c: 168: }
;led.c: 169: }
	goto	l3327
	line	170
	
l3324:	
	line	172
	
l14082:	
;led.c: 170: else
;led.c: 171: {
;led.c: 172: if(flag==1)
	movf	(seg_disp@flag),w
	xorlw	01h
	skipz
	goto	u6191
	goto	u6190
u6191:
	goto	l3328
u6190:
	line	174
	
l14084:	
;led.c: 173: {
;led.c: 174: RC0 = 0;
	bcf	(56/8),(56)&7
	line	175
;led.c: 175: }
	goto	l3327
	line	176
	
l3328:	
	line	178
;led.c: 176: else
;led.c: 177: {
;led.c: 178: RA2 = 0;
	bcf	(42/8),(42)&7
	goto	l3327
	line	179
	
l3329:	
	line	180
	
l3327:	
	line	181
# 181 "E:\Projects\COLOCK\Master_sub_slock\yzj\programe_updata\SZZ485_V1.4\source\led.c"
nop ;#
# 181 "E:\Projects\COLOCK\Master_sub_slock\yzj\programe_updata\SZZ485_V1.4\source\led.c"
nop ;#
psect	text1436
	line	182
	
l14086:	
;led.c: 182: if(flag==1)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(seg_disp@flag),w
	xorlw	01h
	skipz
	goto	u6201
	goto	u6200
u6201:
	goto	l14090
u6200:
	line	184
	
l14088:	
;led.c: 183: {
;led.c: 184: shift_srclk(1);
	movlw	(01h)
	fcall	_shift_srclk
	line	185
;led.c: 185: }
	goto	l14092
	line	186
	
l3330:	
	line	188
	
l14090:	
;led.c: 186: else
;led.c: 187: {
;led.c: 188: shift_srclk(2);
	movlw	(02h)
	fcall	_shift_srclk
	goto	l14092
	line	189
	
l3331:	
	line	157
	
l14092:	
	movlw	(01h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_seg_disp+0)+0
	movf	(??_seg_disp+0)+0,w
	addwf	(seg_disp@i),f
	
l14094:	
	movlw	(08h)
	subwf	(seg_disp@i),w
	skipc
	goto	u6211
	goto	u6210
u6211:
	goto	l14076
u6210:
	goto	l3332
	
l3323:	
	line	192
	
l3332:	
	return
	opt stack 0
GLOBAL	__end_of_seg_disp
	__end_of_seg_disp:
;; =============== function _seg_disp ends ============

	signat	_seg_disp,12408
	global	_dec_hex
psect	text1437,local,class=CODE,delta=2
global __ptext1437
__ptext1437:

;; *************** function _dec_hex *****************
;; Defined at:
;;		line 124 in file "E:\Projects\COLOCK\Master_sub_slock\yzj\programe_updata\SZZ485_V1.4\source\DS3231.c"
;; Parameters:    Size  Location     Type
;;  dec16           1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  dec16           1   21[BANK0 ] unsigned char 
;; Return value:  Size  Location     Type
;;                  1    wreg      unsigned char 
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK2
;;      Params:         0       0       0       0
;;      Locals:         0       1       0       0
;;      Temps:          0       5       0       0
;;      Totals:         0       6       0       0
;;Total ram usage:        6 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    3
;; This function calls:
;;		___awmod
;;		___awdiv
;; This function is called by:
;;		_settime
;; This function uses a non-reentrant model
;;
psect	text1437
	file	"E:\Projects\COLOCK\Master_sub_slock\yzj\programe_updata\SZZ485_V1.4\source\DS3231.c"
	line	124
	global	__size_of_dec_hex
	__size_of_dec_hex	equ	__end_of_dec_hex-_dec_hex
	
_dec_hex:	
	opt	stack 2
; Regs used in _dec_hex: [wreg+status,2+status,0+pclath+cstack]
;dec_hex@dec16 stored from wreg
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(dec_hex@dec16)
	line	125
	
l14052:	
;DS3231.c: 125: return((dec16/10)*16+(dec16%10));
	movlw	low(0Ah)
	movwf	(?___awdiv)
	movlw	high(0Ah)
	movwf	((?___awdiv))+1
	movf	(dec_hex@dec16),w
	movwf	(??_dec_hex+0)+0
	clrf	(??_dec_hex+0)+0+1
	movf	0+(??_dec_hex+0)+0,w
	movwf	0+(?___awdiv)+02h
	movf	1+(??_dec_hex+0)+0,w
	movwf	1+(?___awdiv)+02h
	fcall	___awdiv
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(0+(?___awdiv)),w
	movwf	(??_dec_hex+2)+0
	movlw	04h
u6115:
	clrc
	rlf	(??_dec_hex+2)+0,f
	addlw	-1
	skipz
	goto	u6115
	movlw	low(0Ah)
	movwf	(?___awmod)
	movlw	high(0Ah)
	movwf	((?___awmod))+1
	movf	(dec_hex@dec16),w
	movwf	(??_dec_hex+3)+0
	clrf	(??_dec_hex+3)+0+1
	movf	0+(??_dec_hex+3)+0,w
	movwf	0+(?___awmod)+02h
	movf	1+(??_dec_hex+3)+0,w
	movwf	1+(?___awmod)+02h
	fcall	___awmod
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(0+(?___awmod)),w
	addwf	0+(??_dec_hex+2)+0,w
	goto	l2480
	
l14054:	
	line	126
	
l2480:	
	return
	opt stack 0
GLOBAL	__end_of_dec_hex
	__end_of_dec_hex:
;; =============== function _dec_hex ends ============

	signat	_dec_hex,4217
	global	_hex_dec
psect	text1438,local,class=CODE,delta=2
global __ptext1438
__ptext1438:

;; *************** function _hex_dec *****************
;; Defined at:
;;		line 119 in file "E:\Projects\COLOCK\Master_sub_slock\yzj\programe_updata\SZZ485_V1.4\source\DS3231.c"
;; Parameters:    Size  Location     Type
;;  hex16           1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  hex16           1   24[BANK0 ] unsigned char 
;; Return value:  Size  Location     Type
;;                  1    wreg      unsigned char 
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK2
;;      Params:         0       0       0       0
;;      Locals:         0       1       0       0
;;      Temps:          0       4       0       0
;;      Totals:         0       5       0       0
;;Total ram usage:        5 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    3
;; This function calls:
;;		___awdiv
;;		___bmul
;; This function is called by:
;;		_get_time
;; This function uses a non-reentrant model
;;
psect	text1438
	file	"E:\Projects\COLOCK\Master_sub_slock\yzj\programe_updata\SZZ485_V1.4\source\DS3231.c"
	line	119
	global	__size_of_hex_dec
	__size_of_hex_dec	equ	__end_of_hex_dec-_hex_dec
	
_hex_dec:	
	opt	stack 3
; Regs used in _hex_dec: [wreg+status,2+status,0+pclath+cstack]
;hex_dec@hex16 stored from wreg
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(hex_dec@hex16)
	line	120
	
l14048:	
;DS3231.c: 120: return ((hex16/16)*10+(hex16%16));
	movlw	(0Ah)
	movwf	(??_hex_dec+0)+0
	movf	(??_hex_dec+0)+0,w
	movwf	(?___bmul)
	movf	(hex_dec@hex16),w
	movwf	(??_hex_dec+1)+0
	clrf	(??_hex_dec+1)+0+1
	movf	0+(??_hex_dec+1)+0,w
	movwf	0+(?___awdiv)+02h
	movf	1+(??_hex_dec+1)+0,w
	movwf	1+(?___awdiv)+02h
	movlw	low(010h)
	movwf	(?___awdiv)
	movlw	high(010h)
	movwf	((?___awdiv))+1
	fcall	___awdiv
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(0+(?___awdiv)),w
	fcall	___bmul
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_hex_dec+3)+0
	movf	(hex_dec@hex16),w
	andlw	0Fh
	addwf	0+(??_hex_dec+3)+0,w
	goto	l2477
	
l14050:	
	line	121
	
l2477:	
	return
	opt stack 0
GLOBAL	__end_of_hex_dec
	__end_of_hex_dec:
;; =============== function _hex_dec ends ============

	signat	_hex_dec,4217
	global	_writebyte
psect	text1439,local,class=CODE,delta=2
global __ptext1439
__ptext1439:

;; *************** function _writebyte *****************
;; Defined at:
;;		line 120 in file "E:\Projects\COLOCK\Master_sub_slock\yzj\programe_updata\SZZ485_V1.4\source\rtc.c"
;; Parameters:    Size  Location     Type
;;  address         1    wreg     unsigned char 
;;  data            1    3[BANK0 ] unsigned char 
;; Auto vars:     Size  Location     Type
;;  address         1    4[BANK0 ] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK2
;;      Params:         0       1       0       0
;;      Locals:         0       1       0       0
;;      Temps:          0       0       0       0
;;      Totals:         0       2       0       0
;;Total ram usage:        2 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    3
;; This function calls:
;;		_start_i2c
;;		_i2c_send
;;		_waitack_i2c
;; This function is called by:
;;		_ds3231_init
;;		_get_time
;;		_settime
;; This function uses a non-reentrant model
;;
psect	text1439
	file	"E:\Projects\COLOCK\Master_sub_slock\yzj\programe_updata\SZZ485_V1.4\source\rtc.c"
	line	120
	global	__size_of_writebyte
	__size_of_writebyte	equ	__end_of_writebyte-_writebyte
	
_writebyte:	
	opt	stack 2
; Regs used in _writebyte: [wreg+status,2+status,0+pclath+cstack]
;writebyte@address stored from wreg
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(writebyte@address)
	line	121
	
l14020:	
;rtc.c: 121: start_i2c();
	fcall	_start_i2c
	line	122
	
l14022:	
;rtc.c: 122: i2c_send(0xD0);
	movlw	(0D0h)
	fcall	_i2c_send
	line	123
	
l14024:	
;rtc.c: 123: waitack_i2c();
	fcall	_waitack_i2c
	line	124
	
l14026:	
;rtc.c: 124: i2c_send(address);
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(writebyte@address),w
	fcall	_i2c_send
	line	125
	
l14028:	
;rtc.c: 125: waitack_i2c();
	fcall	_waitack_i2c
	line	126
	
l14030:	
;rtc.c: 126: i2c_send(data);
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(writebyte@data),w
	fcall	_i2c_send
	line	127
	
l14032:	
;rtc.c: 127: waitack_i2c();
	fcall	_waitack_i2c
	line	128
	
l14034:	
;rtc.c: 128: RC4=0; RC3=1; asm("nop");asm("nop");; RC4=1;asm("nop");asm("nop");;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(60/8),(60)&7
	
l14036:	
	bsf	(59/8),(59)&7
	
l14038:	
# 128 "E:\Projects\COLOCK\Master_sub_slock\yzj\programe_updata\SZZ485_V1.4\source\rtc.c"
nop ;#
psect	text1439
	
l14040:	
# 128 "E:\Projects\COLOCK\Master_sub_slock\yzj\programe_updata\SZZ485_V1.4\source\rtc.c"
nop ;#
psect	text1439
	
l14042:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(60/8),(60)&7
	
l14044:	
# 128 "E:\Projects\COLOCK\Master_sub_slock\yzj\programe_updata\SZZ485_V1.4\source\rtc.c"
nop ;#
psect	text1439
	
l14046:	
# 128 "E:\Projects\COLOCK\Master_sub_slock\yzj\programe_updata\SZZ485_V1.4\source\rtc.c"
nop ;#
psect	text1439
	line	129
	
l6031:	
	return
	opt stack 0
GLOBAL	__end_of_writebyte
	__end_of_writebyte:
;; =============== function _writebyte ends ============

	signat	_writebyte,8312
	global	_readbyte
psect	text1440,local,class=CODE,delta=2
global __ptext1440
__ptext1440:

;; *************** function _readbyte *****************
;; Defined at:
;;		line 133 in file "E:\Projects\COLOCK\Master_sub_slock\yzj\programe_updata\SZZ485_V1.4\source\rtc.c"
;; Parameters:    Size  Location     Type
;;  address         1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  address         1    4[BANK0 ] unsigned char 
;;  recv_data       1    5[BANK0 ] unsigned char 
;; Return value:  Size  Location     Type
;;                  1    wreg      unsigned char 
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK2
;;      Params:         0       0       0       0
;;      Locals:         0       2       0       0
;;      Temps:          0       1       0       0
;;      Totals:         0       3       0       0
;;Total ram usage:        3 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    3
;; This function calls:
;;		_start_i2c
;;		_i2c_send
;;		_waitack_i2c
;;		_i2c_read
;;		_sendnotack_i2c
;; This function is called by:
;;		_ds3231_init
;;		_get_time
;; This function uses a non-reentrant model
;;
psect	text1440
	file	"E:\Projects\COLOCK\Master_sub_slock\yzj\programe_updata\SZZ485_V1.4\source\rtc.c"
	line	133
	global	__size_of_readbyte
	__size_of_readbyte	equ	__end_of_readbyte-_readbyte
	
_readbyte:	
	opt	stack 3
; Regs used in _readbyte: [wreg+status,2+status,0+pclath+cstack]
;readbyte@address stored from wreg
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(readbyte@address)
	line	134
	
l13990:	
;rtc.c: 134: UINT8 recv_data=0xff;
	movlw	(0FFh)
	movwf	(??_readbyte+0)+0
	movf	(??_readbyte+0)+0,w
	movwf	(readbyte@recv_data)
	line	136
	
l13992:	
;rtc.c: 136: start_i2c();
	fcall	_start_i2c
	line	137
;rtc.c: 137: i2c_send(0xD0);
	movlw	(0D0h)
	fcall	_i2c_send
	line	138
;rtc.c: 138: waitack_i2c();
	fcall	_waitack_i2c
	line	140
;rtc.c: 140: i2c_send(address);
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(readbyte@address),w
	fcall	_i2c_send
	line	141
;rtc.c: 141: waitack_i2c();
	fcall	_waitack_i2c
	line	143
	
l13994:	
;rtc.c: 143: start_i2c();
	fcall	_start_i2c
	line	144
	
l13996:	
;rtc.c: 144: i2c_send(0xD0+0x01);
	movlw	(0D1h)
	fcall	_i2c_send
	line	145
	
l13998:	
;rtc.c: 145: waitack_i2c();
	fcall	_waitack_i2c
	line	147
	
l14000:	
;rtc.c: 147: recv_data=i2c_read();
	fcall	_i2c_read
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_readbyte+0)+0
	movf	(??_readbyte+0)+0,w
	movwf	(readbyte@recv_data)
	line	148
;rtc.c: 148: sendnotack_i2c();
	fcall	_sendnotack_i2c
	line	150
	
l14002:	
;rtc.c: 150: RC4=0; RC3=1; asm("nop");asm("nop");; RC4=1;asm("nop");asm("nop");;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(60/8),(60)&7
	
l14004:	
	bsf	(59/8),(59)&7
	
l14006:	
# 150 "E:\Projects\COLOCK\Master_sub_slock\yzj\programe_updata\SZZ485_V1.4\source\rtc.c"
nop ;#
psect	text1440
	
l14008:	
# 150 "E:\Projects\COLOCK\Master_sub_slock\yzj\programe_updata\SZZ485_V1.4\source\rtc.c"
nop ;#
psect	text1440
	
l14010:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(60/8),(60)&7
	
l14012:	
# 150 "E:\Projects\COLOCK\Master_sub_slock\yzj\programe_updata\SZZ485_V1.4\source\rtc.c"
nop ;#
psect	text1440
	
l14014:	
# 150 "E:\Projects\COLOCK\Master_sub_slock\yzj\programe_updata\SZZ485_V1.4\source\rtc.c"
nop ;#
psect	text1440
	line	151
	
l14016:	
;rtc.c: 151: return(recv_data);
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(readbyte@recv_data),w
	goto	l6034
	
l14018:	
	line	152
	
l6034:	
	return
	opt stack 0
GLOBAL	__end_of_readbyte
	__end_of_readbyte:
;; =============== function _readbyte ends ============

	signat	_readbyte,4217
	global	_usart_init
psect	text1441,local,class=CODE,delta=2
global __ptext1441
__ptext1441:

;; *************** function _usart_init *****************
;; Defined at:
;;		line 17 in file "E:\Projects\COLOCK\Master_sub_slock\yzj\programe_updata\SZZ485_V1.4\source\usart.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK2
;;      Params:         0       0       0       0
;;      Locals:         0       0       0       0
;;      Temps:          0       1       0       0
;;      Totals:         0       1       0       0
;;Total ram usage:        1 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    3
;; This function calls:
;;		_id_code
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text1441
	file	"E:\Projects\COLOCK\Master_sub_slock\yzj\programe_updata\SZZ485_V1.4\source\usart.c"
	line	17
	global	__size_of_usart_init
	__size_of_usart_init	equ	__end_of_usart_init-_usart_init
	
_usart_init:	
	opt	stack 4
; Regs used in _usart_init: [wreg+status,2+status,0+pclath+cstack]
	line	18
	
l13982:	
;usart.c: 18: TRISB0 = 0;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	bcf	(1072/8)^080h,(1072)&7
	line	19
;usart.c: 19: TRISB6 = 1;
	bsf	(1078/8)^080h,(1078)&7
	line	20
;usart.c: 20: TRISB7 = 1;
	bsf	(1079/8)^080h,(1079)&7
	line	21
;usart.c: 21: TRISB5 = 1;
	bsf	(1077/8)^080h,(1077)&7
	line	22
;usart.c: 22: TRISB4 = 1;
	bsf	(1076/8)^080h,(1076)&7
	line	23
;usart.c: 23: TRISB2 = 1;
	bsf	(1074/8)^080h,(1074)&7
	line	24
;usart.c: 24: TRISB1 = 1;
	bsf	(1073/8)^080h,(1073)&7
	line	25
;usart.c: 25: TRISA0 = 1;
	bsf	(1064/8)^080h,(1064)&7
	line	26
;usart.c: 26: TRISA1 = 1;
	bsf	(1065/8)^080h,(1065)&7
	line	28
;usart.c: 28: TRISC7 = 1; TRISC6 = 1; SPBRG = ((int)(8000000L/(16UL * 9600) -1)); RCSTA = (0|0x90); TXSTA = (0x4|0|0x20); RCIE = 1;;
	bsf	(1087/8)^080h,(1087)&7
	bsf	(1086/8)^080h,(1086)&7
	
l13984:	
	movlw	(033h)
	movwf	(153)^080h
	movlw	(090h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(24)	;volatile
	movlw	(024h)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(152)^080h	;volatile
	
l13986:	
	bsf	(1125/8)^080h,(1125)&7
	line	29
;usart.c: 29: while(!TRMT);RB0 = 0;
	goto	l1630
	
l1631:	
	
l1630:	
	btfss	(1217/8)^080h,(1217)&7
	goto	u6101
	goto	u6100
u6101:
	goto	l1630
u6100:
	
l1632:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(48/8),(48)&7
	line	30
	
l13988:	
;usart.c: 30: my_id_code=id_code();
	fcall	_id_code
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_usart_init+0)+0
	movf	(??_usart_init+0)+0,w
	movwf	(_my_id_code)
	line	31
	
l1633:	
	return
	opt stack 0
GLOBAL	__end_of_usart_init
	__end_of_usart_init:
;; =============== function _usart_init ends ============

	signat	_usart_init,88
	global	_isleap
psect	text1442,local,class=CODE,delta=2
global __ptext1442
__ptext1442:

;; *************** function _isleap *****************
;; Defined at:
;;		line 209 in file "E:\Projects\COLOCK\Master_sub_slock\yzj\programe_updata\SZZ485_V1.4\source\timer1.c"
;; Parameters:    Size  Location     Type
;;  year            2    6[BANK0 ] unsigned short 
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;                  1    wreg      unsigned char 
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK2
;;      Params:         0       2       0       0
;;      Locals:         0       0       0       0
;;      Temps:          0       2       0       0
;;      Totals:         0       4       0       0
;;Total ram usage:        4 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    3
;; This function calls:
;;		___lwmod
;; This function is called by:
;;		_date_add
;;		_date_dec
;; This function uses a non-reentrant model
;;
psect	text1442
	file	"E:\Projects\COLOCK\Master_sub_slock\yzj\programe_updata\SZZ485_V1.4\source\timer1.c"
	line	209
	global	__size_of_isleap
	__size_of_isleap	equ	__end_of_isleap-_isleap
	
_isleap:	
	opt	stack 3
; Regs used in _isleap: [wreg+status,2+status,0+pclath+cstack]
	line	210
	
l13966:	
;timer1.c: 210: if ((year%400==0) || ((year%100!=0) && (year%4==0)))
	movlw	low(0190h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(?___lwmod)
	movlw	high(0190h)
	movwf	((?___lwmod))+1
	movf	(isleap@year+1),w
	clrf	1+(?___lwmod)+02h
	addwf	1+(?___lwmod)+02h
	movf	(isleap@year),w
	clrf	0+(?___lwmod)+02h
	addwf	0+(?___lwmod)+02h

	fcall	___lwmod
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(1+(?___lwmod)),w
	iorwf	(0+(?___lwmod)),w
	skipnz
	goto	u6071
	goto	u6070
u6071:
	goto	l13972
u6070:
	
l13968:	
	movlw	low(064h)
	movwf	(?___lwmod)
	movlw	high(064h)
	movwf	((?___lwmod))+1
	movf	(isleap@year+1),w
	clrf	1+(?___lwmod)+02h
	addwf	1+(?___lwmod)+02h
	movf	(isleap@year),w
	clrf	0+(?___lwmod)+02h
	addwf	0+(?___lwmod)+02h

	fcall	___lwmod
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(1+(?___lwmod)),w
	iorwf	(0+(?___lwmod)),w
	skipnz
	goto	u6081
	goto	u6080
u6081:
	goto	l13978
u6080:
	
l13970:	
	movlw	low(03h)
	andwf	(isleap@year),w
	movwf	(??_isleap+0)+0
	movlw	high(03h)
	andwf	(isleap@year+1),w
	movwf	1+(??_isleap+0)+0
	movf	1+(??_isleap+0)+0,w
	iorwf	0+(??_isleap+0)+0,w
	skipz
	goto	u6091
	goto	u6090
u6091:
	goto	l13978
u6090:
	goto	l13972
	
l835:	
	line	212
	
l13972:	
;timer1.c: 211: {
;timer1.c: 212: return TRUE;
	movlw	(01h)
	goto	l836
	
l13974:	
	goto	l836
	line	213
	
l13976:	
;timer1.c: 213: }
	goto	l836
	line	214
	
l833:	
	line	216
	
l13978:	
;timer1.c: 214: else
;timer1.c: 215: {
;timer1.c: 216: return FALSE;
	movlw	(0)
	goto	l836
	
l13980:	
	goto	l836
	line	217
	
l837:	
	line	218
	
l836:	
	return
	opt stack 0
GLOBAL	__end_of_isleap
	__end_of_isleap:
;; =============== function _isleap ends ============

	signat	_isleap,4217
	global	___awmod
psect	text1443,local,class=CODE,delta=2
global __ptext1443
__ptext1443:

;; *************** function ___awmod *****************
;; Defined at:
;;		line 5 in file "C:\Program Files\HI-TECH Software\PICC\9.80\sources\awmod.c"
;; Parameters:    Size  Location     Type
;;  divisor         2    0[BANK0 ] int 
;;  dividend        2    2[BANK0 ] int 
;; Auto vars:     Size  Location     Type
;;  sign            1    6[BANK0 ] unsigned char 
;;  counter         1    5[BANK0 ] unsigned char 
;; Return value:  Size  Location     Type
;;                  2    0[BANK0 ] int 
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK2
;;      Params:         0       4       0       0
;;      Locals:         0       2       0       0
;;      Temps:          0       1       0       0
;;      Totals:         0       7       0       0
;;Total ram usage:        7 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    2
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_dec_hex
;;		_lcd_init
;;		_main
;; This function uses a non-reentrant model
;;
psect	text1443
	file	"C:\Program Files\HI-TECH Software\PICC\9.80\sources\awmod.c"
	line	5
	global	__size_of___awmod
	__size_of___awmod	equ	__end_of___awmod-___awmod
	
___awmod:	
	opt	stack 2
; Regs used in ___awmod: [wreg+status,2+status,0]
	line	8
	
l13930:	
	clrc
	movlw	0
	btfsc	status,0
	movlw	1
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(___awmod@sign)
	line	9
	
l13932:	
	btfss	(___awmod@dividend+1),7
	goto	u5981
	goto	u5980
u5981:
	goto	l13936
u5980:
	line	10
	
l13934:	
	comf	(___awmod@dividend),f
	comf	(___awmod@dividend+1),f
	incf	(___awmod@dividend),f
	skipnz
	incf	(___awmod@dividend+1),f
	line	11
	clrf	(___awmod@sign)
	bsf	status,0
	rlf	(___awmod@sign),f
	goto	l13936
	line	12
	
l9390:	
	line	13
	
l13936:	
	btfss	(___awmod@divisor+1),7
	goto	u5991
	goto	u5990
u5991:
	goto	l13940
u5990:
	line	14
	
l13938:	
	comf	(___awmod@divisor),f
	comf	(___awmod@divisor+1),f
	incf	(___awmod@divisor),f
	skipnz
	incf	(___awmod@divisor+1),f
	goto	l13940
	
l9391:	
	line	15
	
l13940:	
	movf	(___awmod@divisor+1),w
	iorwf	(___awmod@divisor),w
	skipnz
	goto	u6001
	goto	u6000
u6001:
	goto	l13958
u6000:
	line	16
	
l13942:	
	clrf	(___awmod@counter)
	bsf	status,0
	rlf	(___awmod@counter),f
	line	17
	goto	l13948
	
l9394:	
	line	18
	
l13944:	
	movlw	01h
	
u6015:
	clrc
	rlf	(___awmod@divisor),f
	rlf	(___awmod@divisor+1),f
	addlw	-1
	skipz
	goto	u6015
	line	19
	
l13946:	
	movlw	(01h)
	movwf	(??___awmod+0)+0
	movf	(??___awmod+0)+0,w
	addwf	(___awmod@counter),f
	goto	l13948
	line	20
	
l9393:	
	line	17
	
l13948:	
	btfss	(___awmod@divisor+1),(15)&7
	goto	u6021
	goto	u6020
u6021:
	goto	l13944
u6020:
	goto	l13950
	
l9395:	
	goto	l13950
	line	21
	
l9396:	
	line	22
	
l13950:	
	movf	(___awmod@divisor+1),w
	subwf	(___awmod@dividend+1),w
	skipz
	goto	u6035
	movf	(___awmod@divisor),w
	subwf	(___awmod@dividend),w
u6035:
	skipc
	goto	u6031
	goto	u6030
u6031:
	goto	l13954
u6030:
	line	23
	
l13952:	
	movf	(___awmod@divisor),w
	subwf	(___awmod@dividend),f
	movf	(___awmod@divisor+1),w
	skipc
	decf	(___awmod@dividend+1),f
	subwf	(___awmod@dividend+1),f
	goto	l13954
	
l9397:	
	line	24
	
l13954:	
	movlw	01h
	
u6045:
	clrc
	rrf	(___awmod@divisor+1),f
	rrf	(___awmod@divisor),f
	addlw	-1
	skipz
	goto	u6045
	line	25
	
l13956:	
	movlw	low(01h)
	subwf	(___awmod@counter),f
	btfss	status,2
	goto	u6051
	goto	u6050
u6051:
	goto	l13950
u6050:
	goto	l13958
	
l9398:	
	goto	l13958
	line	26
	
l9392:	
	line	27
	
l13958:	
	movf	(___awmod@sign),w
	skipz
	goto	u6060
	goto	l13962
u6060:
	line	28
	
l13960:	
	comf	(___awmod@dividend),f
	comf	(___awmod@dividend+1),f
	incf	(___awmod@dividend),f
	skipnz
	incf	(___awmod@dividend+1),f
	goto	l13962
	
l9399:	
	line	29
	
l13962:	
	movf	(___awmod@dividend+1),w
	clrf	(?___awmod+1)
	addwf	(?___awmod+1)
	movf	(___awmod@dividend),w
	clrf	(?___awmod)
	addwf	(?___awmod)

	goto	l9400
	
l13964:	
	line	30
	
l9400:	
	return
	opt stack 0
GLOBAL	__end_of___awmod
	__end_of___awmod:
;; =============== function ___awmod ends ============

	signat	___awmod,8314
	global	___awdiv
psect	text1444,local,class=CODE,delta=2
global __ptext1444
__ptext1444:

;; *************** function ___awdiv *****************
;; Defined at:
;;		line 5 in file "C:\Program Files\HI-TECH Software\PICC\9.80\sources\awdiv.c"
;; Parameters:    Size  Location     Type
;;  divisor         2    7[BANK0 ] int 
;;  dividend        2    9[BANK0 ] int 
;; Auto vars:     Size  Location     Type
;;  quotient        2   14[BANK0 ] int 
;;  sign            1   13[BANK0 ] unsigned char 
;;  counter         1   12[BANK0 ] unsigned char 
;; Return value:  Size  Location     Type
;;                  2    7[BANK0 ] int 
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK2
;;      Params:         0       4       0       0
;;      Locals:         0       4       0       0
;;      Temps:          0       1       0       0
;;      Totals:         0       9       0       0
;;Total ram usage:        9 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    2
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_hex_dec
;;		_dec_hex
;;		_lcd_init
;;		_main
;; This function uses a non-reentrant model
;;
psect	text1444
	file	"C:\Program Files\HI-TECH Software\PICC\9.80\sources\awdiv.c"
	line	5
	global	__size_of___awdiv
	__size_of___awdiv	equ	__end_of___awdiv-___awdiv
	
___awdiv:	
	opt	stack 2
; Regs used in ___awdiv: [wreg+status,2+status,0]
	line	9
	
l13892:	
	clrc
	movlw	0
	btfsc	status,0
	movlw	1
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(___awdiv@sign)
	line	10
	
l13894:	
	btfss	(___awdiv@divisor+1),7
	goto	u5881
	goto	u5880
u5881:
	goto	l13898
u5880:
	line	11
	
l13896:	
	comf	(___awdiv@divisor),f
	comf	(___awdiv@divisor+1),f
	incf	(___awdiv@divisor),f
	skipnz
	incf	(___awdiv@divisor+1),f
	line	12
	clrf	(___awdiv@sign)
	bsf	status,0
	rlf	(___awdiv@sign),f
	goto	l13898
	line	13
	
l9322:	
	line	14
	
l13898:	
	btfss	(___awdiv@dividend+1),7
	goto	u5891
	goto	u5890
u5891:
	goto	l9323
u5890:
	line	15
	
l13900:	
	comf	(___awdiv@dividend),f
	comf	(___awdiv@dividend+1),f
	incf	(___awdiv@dividend),f
	skipnz
	incf	(___awdiv@dividend+1),f
	line	16
	
l13902:	
	movlw	(01h)
	movwf	(??___awdiv+0)+0
	movf	(??___awdiv+0)+0,w
	xorwf	(___awdiv@sign),f
	line	17
	
l9323:	
	line	18
	movlw	low(0)
	movwf	(___awdiv@quotient)
	movlw	high(0)
	movwf	((___awdiv@quotient))+1
	line	19
	movf	(___awdiv@divisor+1),w
	iorwf	(___awdiv@divisor),w
	skipnz
	goto	u5901
	goto	u5900
u5901:
	goto	l13922
u5900:
	line	20
	
l13904:	
	clrf	(___awdiv@counter)
	bsf	status,0
	rlf	(___awdiv@counter),f
	line	21
	goto	l13910
	
l9326:	
	line	22
	
l13906:	
	movlw	01h
	
u5915:
	clrc
	rlf	(___awdiv@divisor),f
	rlf	(___awdiv@divisor+1),f
	addlw	-1
	skipz
	goto	u5915
	line	23
	
l13908:	
	movlw	(01h)
	movwf	(??___awdiv+0)+0
	movf	(??___awdiv+0)+0,w
	addwf	(___awdiv@counter),f
	goto	l13910
	line	24
	
l9325:	
	line	21
	
l13910:	
	btfss	(___awdiv@divisor+1),(15)&7
	goto	u5921
	goto	u5920
u5921:
	goto	l13906
u5920:
	goto	l13912
	
l9327:	
	goto	l13912
	line	25
	
l9328:	
	line	26
	
l13912:	
	movlw	01h
	
u5935:
	clrc
	rlf	(___awdiv@quotient),f
	rlf	(___awdiv@quotient+1),f
	addlw	-1
	skipz
	goto	u5935
	line	27
	movf	(___awdiv@divisor+1),w
	subwf	(___awdiv@dividend+1),w
	skipz
	goto	u5945
	movf	(___awdiv@divisor),w
	subwf	(___awdiv@dividend),w
u5945:
	skipc
	goto	u5941
	goto	u5940
u5941:
	goto	l13918
u5940:
	line	28
	
l13914:	
	movf	(___awdiv@divisor),w
	subwf	(___awdiv@dividend),f
	movf	(___awdiv@divisor+1),w
	skipc
	decf	(___awdiv@dividend+1),f
	subwf	(___awdiv@dividend+1),f
	line	29
	
l13916:	
	bsf	(___awdiv@quotient)+(0/8),(0)&7
	goto	l13918
	line	30
	
l9329:	
	line	31
	
l13918:	
	movlw	01h
	
u5955:
	clrc
	rrf	(___awdiv@divisor+1),f
	rrf	(___awdiv@divisor),f
	addlw	-1
	skipz
	goto	u5955
	line	32
	
l13920:	
	movlw	low(01h)
	subwf	(___awdiv@counter),f
	btfss	status,2
	goto	u5961
	goto	u5960
u5961:
	goto	l13912
u5960:
	goto	l13922
	
l9330:	
	goto	l13922
	line	33
	
l9324:	
	line	34
	
l13922:	
	movf	(___awdiv@sign),w
	skipz
	goto	u5970
	goto	l13926
u5970:
	line	35
	
l13924:	
	comf	(___awdiv@quotient),f
	comf	(___awdiv@quotient+1),f
	incf	(___awdiv@quotient),f
	skipnz
	incf	(___awdiv@quotient+1),f
	goto	l13926
	
l9331:	
	line	36
	
l13926:	
	movf	(___awdiv@quotient+1),w
	clrf	(?___awdiv+1)
	addwf	(?___awdiv+1)
	movf	(___awdiv@quotient),w
	clrf	(?___awdiv)
	addwf	(?___awdiv)

	goto	l9332
	
l13928:	
	line	37
	
l9332:	
	return
	opt stack 0
GLOBAL	__end_of___awdiv
	__end_of___awdiv:
;; =============== function ___awdiv ends ============

	signat	___awdiv,8314
	global	___lwmod
psect	text1445,local,class=CODE,delta=2
global __ptext1445
__ptext1445:

;; *************** function ___lwmod *****************
;; Defined at:
;;		line 5 in file "C:\Program Files\HI-TECH Software\PICC\9.80\sources\lwmod.c"
;; Parameters:    Size  Location     Type
;;  divisor         2    0[BANK0 ] unsigned int 
;;  dividend        2    2[BANK0 ] unsigned int 
;; Auto vars:     Size  Location     Type
;;  counter         1    5[BANK0 ] unsigned char 
;; Return value:  Size  Location     Type
;;                  2    0[BANK0 ] unsigned int 
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK2
;;      Params:         0       4       0       0
;;      Locals:         0       1       0       0
;;      Temps:          0       1       0       0
;;      Totals:         0       6       0       0
;;Total ram usage:        6 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    2
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_isleap
;;		_main
;; This function uses a non-reentrant model
;;
psect	text1445
	file	"C:\Program Files\HI-TECH Software\PICC\9.80\sources\lwmod.c"
	line	5
	global	__size_of___lwmod
	__size_of___lwmod	equ	__end_of___lwmod-___lwmod
	
___lwmod:	
	opt	stack 3
; Regs used in ___lwmod: [wreg+status,2+status,0]
	line	8
	
l13870:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(___lwmod@divisor+1),w
	iorwf	(___lwmod@divisor),w
	skipnz
	goto	u5821
	goto	u5820
u5821:
	goto	l13888
u5820:
	line	9
	
l13872:	
	clrf	(___lwmod@counter)
	bsf	status,0
	rlf	(___lwmod@counter),f
	line	10
	goto	l13878
	
l9200:	
	line	11
	
l13874:	
	movlw	01h
	
u5835:
	clrc
	rlf	(___lwmod@divisor),f
	rlf	(___lwmod@divisor+1),f
	addlw	-1
	skipz
	goto	u5835
	line	12
	
l13876:	
	movlw	(01h)
	movwf	(??___lwmod+0)+0
	movf	(??___lwmod+0)+0,w
	addwf	(___lwmod@counter),f
	goto	l13878
	line	13
	
l9199:	
	line	10
	
l13878:	
	btfss	(___lwmod@divisor+1),(15)&7
	goto	u5841
	goto	u5840
u5841:
	goto	l13874
u5840:
	goto	l13880
	
l9201:	
	goto	l13880
	line	14
	
l9202:	
	line	15
	
l13880:	
	movf	(___lwmod@divisor+1),w
	subwf	(___lwmod@dividend+1),w
	skipz
	goto	u5855
	movf	(___lwmod@divisor),w
	subwf	(___lwmod@dividend),w
u5855:
	skipc
	goto	u5851
	goto	u5850
u5851:
	goto	l13884
u5850:
	line	16
	
l13882:	
	movf	(___lwmod@divisor),w
	subwf	(___lwmod@dividend),f
	movf	(___lwmod@divisor+1),w
	skipc
	decf	(___lwmod@dividend+1),f
	subwf	(___lwmod@dividend+1),f
	goto	l13884
	
l9203:	
	line	17
	
l13884:	
	movlw	01h
	
u5865:
	clrc
	rrf	(___lwmod@divisor+1),f
	rrf	(___lwmod@divisor),f
	addlw	-1
	skipz
	goto	u5865
	line	18
	
l13886:	
	movlw	low(01h)
	subwf	(___lwmod@counter),f
	btfss	status,2
	goto	u5871
	goto	u5870
u5871:
	goto	l13880
u5870:
	goto	l13888
	
l9204:	
	goto	l13888
	line	19
	
l9198:	
	line	20
	
l13888:	
	movf	(___lwmod@dividend+1),w
	clrf	(?___lwmod+1)
	addwf	(?___lwmod+1)
	movf	(___lwmod@dividend),w
	clrf	(?___lwmod)
	addwf	(?___lwmod)

	goto	l9205
	
l13890:	
	line	21
	
l9205:	
	return
	opt stack 0
GLOBAL	__end_of___lwmod
	__end_of___lwmod:
;; =============== function ___lwmod ends ============

	signat	___lwmod,8314
	global	___bmul
psect	text1446,local,class=CODE,delta=2
global __ptext1446
__ptext1446:

;; *************** function ___bmul *****************
;; Defined at:
;;		line 3 in file "bmul.c"
;; Parameters:    Size  Location     Type
;;  multiplier      1    wreg     unsigned char 
;;  multiplicand    1   16[BANK0 ] unsigned char 
;; Auto vars:     Size  Location     Type
;;  multiplier      1   19[BANK0 ] unsigned char 
;;  product         1   18[BANK0 ] unsigned char 
;; Return value:  Size  Location     Type
;;                  1    wreg      unsigned char 
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK2
;;      Params:         0       1       0       0
;;      Locals:         0       2       0       0
;;      Temps:          0       1       0       0
;;      Totals:         0       4       0       0
;;Total ram usage:        4 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    2
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_hex_dec
;; This function uses a non-reentrant model
;;
psect	text1446
	file	"C:\Program Files\HI-TECH Software\PICC\9.80\sources\bmul.c"
	line	3
	global	__size_of___bmul
	__size_of___bmul	equ	__end_of___bmul-___bmul
	
___bmul:	
	opt	stack 3
; Regs used in ___bmul: [wreg+status,2+status,0]
;___bmul@multiplier stored from wreg
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(___bmul@multiplier)
	line	4
	
l13854:	
	clrc
	movlw	0
	btfsc	status,0
	movlw	1
	movwf	(___bmul@product)
	goto	l13856
	line	6
	
l9176:	
	line	7
	
l13856:	
	btfss	(___bmul@multiplier),(0)&7
	goto	u5801
	goto	u5800
u5801:
	goto	l13860
u5800:
	line	8
	
l13858:	
	movf	(___bmul@multiplicand),w
	movwf	(??___bmul+0)+0
	movf	(??___bmul+0)+0,w
	addwf	(___bmul@product),f
	goto	l13860
	
l9177:	
	line	9
	
l13860:	
	clrc
	rlf	(___bmul@multiplicand),f

	line	10
	
l13862:	
	clrc
	rrf	(___bmul@multiplier),f

	line	11
	
l13864:	
	movf	(___bmul@multiplier),f
	skipz
	goto	u5811
	goto	u5810
u5811:
	goto	l13856
u5810:
	goto	l13866
	
l9178:	
	line	12
	
l13866:	
	movf	(___bmul@product),w
	goto	l9179
	
l13868:	
	line	13
	
l9179:	
	return
	opt stack 0
GLOBAL	__end_of___bmul
	__end_of___bmul:
;; =============== function ___bmul ends ============

	signat	___bmul,8313
	global	_i2c_read
psect	text1447,local,class=CODE,delta=2
global __ptext1447
__ptext1447:

;; *************** function _i2c_read *****************
;; Defined at:
;;		line 91 in file "E:\Projects\COLOCK\Master_sub_slock\yzj\programe_updata\SZZ485_V1.4\source\rtc.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  count           1    2[BANK0 ] unsigned char 
;;  dat             1    1[BANK0 ] unsigned char 
;; Return value:  Size  Location     Type
;;                  1    wreg      unsigned char 
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK2
;;      Params:         0       0       0       0
;;      Locals:         0       2       0       0
;;      Temps:          0       1       0       0
;;      Totals:         0       3       0       0
;;Total ram usage:        3 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    2
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_readbyte
;; This function uses a non-reentrant model
;;
psect	text1447
	file	"E:\Projects\COLOCK\Master_sub_slock\yzj\programe_updata\SZZ485_V1.4\source\rtc.c"
	line	91
	global	__size_of_i2c_read
	__size_of_i2c_read	equ	__end_of_i2c_read-_i2c_read
	
_i2c_read:	
	opt	stack 3
; Regs used in _i2c_read: [wreg+status,2+status,0]
	line	93
	
l13814:	
;rtc.c: 92: UINT8 count;
;rtc.c: 93: UINT8 dat = 0xff;
	movlw	(0FFh)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_i2c_read+0)+0
	movf	(??_i2c_read+0)+0,w
	movwf	(i2c_read@dat)
	line	94
	
l13816:	
;rtc.c: 94: RC4=1;
	bsf	(60/8),(60)&7
	line	95
	
l13818:	
;rtc.c: 95: RC4=1;
	bsf	(60/8),(60)&7
	line	96
	
l13820:	
;rtc.c: 96: TRISC4 = 1;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	bsf	(1084/8)^080h,(1084)&7
	line	97
	
l13822:	
;rtc.c: 97: for(count=0;count<8;count++)
	clrc
	movlw	0
	btfsc	status,0
	movlw	1
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(i2c_read@count)
	
l13824:	
	movlw	(08h)
	subwf	(i2c_read@count),w
	skipc
	goto	u5771
	goto	u5770
u5771:
	goto	l13828
u5770:
	goto	l6025
	
l13826:	
	goto	l6025
	line	98
	
l6024:	
	line	99
	
l13828:	
;rtc.c: 98: {
;rtc.c: 99: dat <<= 1;
	clrc
	rlf	(i2c_read@dat),f

	line	100
	
l13830:	
;rtc.c: 100: RC3 = 0;
	bcf	(59/8),(59)&7
	line	101
	
l13832:	
# 101 "E:\Projects\COLOCK\Master_sub_slock\yzj\programe_updata\SZZ485_V1.4\source\rtc.c"
nop ;#
psect	text1447
	
l13834:	
# 101 "E:\Projects\COLOCK\Master_sub_slock\yzj\programe_updata\SZZ485_V1.4\source\rtc.c"
nop ;#
psect	text1447
	line	102
	
l13836:	
;rtc.c: 102: RC3 = 1;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(59/8),(59)&7
	line	103
	
l13838:	
# 103 "E:\Projects\COLOCK\Master_sub_slock\yzj\programe_updata\SZZ485_V1.4\source\rtc.c"
nop ;#
psect	text1447
	
l13840:	
# 103 "E:\Projects\COLOCK\Master_sub_slock\yzj\programe_updata\SZZ485_V1.4\source\rtc.c"
nop ;#
psect	text1447
	line	104
	
l13842:	
;rtc.c: 104: if(RC4)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	btfss	(60/8),(60)&7
	goto	u5781
	goto	u5780
u5781:
	goto	l13846
u5780:
	line	106
	
l13844:	
;rtc.c: 105: {
;rtc.c: 106: dat|=0x01;
	bsf	(i2c_read@dat)+(0/8),(0)&7
	line	107
;rtc.c: 107: }
	goto	l6027
	line	108
	
l6026:	
	line	110
	
l13846:	
;rtc.c: 108: else
;rtc.c: 109: {
;rtc.c: 110: dat&=0xFE;
	movlw	(0FEh)
	movwf	(??_i2c_read+0)+0
	movf	(??_i2c_read+0)+0,w
	andwf	(i2c_read@dat),f
	line	111
	
l6027:	
	line	97
	movlw	(01h)
	movwf	(??_i2c_read+0)+0
	movf	(??_i2c_read+0)+0,w
	addwf	(i2c_read@count),f
	
l13848:	
	movlw	(08h)
	subwf	(i2c_read@count),w
	skipc
	goto	u5791
	goto	u5790
u5791:
	goto	l13828
u5790:
	
l6025:	
	line	113
;rtc.c: 111: }
;rtc.c: 112: }
;rtc.c: 113: RC3 = 0;
	bcf	(59/8),(59)&7
	line	114
;rtc.c: 114: TRISC4 = 0;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	bcf	(1084/8)^080h,(1084)&7
	line	115
	
l13850:	
;rtc.c: 115: return(dat);
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(i2c_read@dat),w
	goto	l6028
	
l13852:	
	line	116
	
l6028:	
	return
	opt stack 0
GLOBAL	__end_of_i2c_read
	__end_of_i2c_read:
;; =============== function _i2c_read ends ============

	signat	_i2c_read,89
	global	_i2c_send
psect	text1448,local,class=CODE,delta=2
global __ptext1448
__ptext1448:

;; *************** function _i2c_send *****************
;; Defined at:
;;		line 68 in file "E:\Projects\COLOCK\Master_sub_slock\yzj\programe_updata\SZZ485_V1.4\source\rtc.c"
;; Parameters:    Size  Location     Type
;;  send_data       1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  send_data       1    1[BANK0 ] unsigned char 
;;  count           1    2[BANK0 ] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK2
;;      Params:         0       0       0       0
;;      Locals:         0       2       0       0
;;      Temps:          0       1       0       0
;;      Totals:         0       3       0       0
;;Total ram usage:        3 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    2
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_writebyte
;;		_readbyte
;; This function uses a non-reentrant model
;;
psect	text1448
	file	"E:\Projects\COLOCK\Master_sub_slock\yzj\programe_updata\SZZ485_V1.4\source\rtc.c"
	line	68
	global	__size_of_i2c_send
	__size_of_i2c_send	equ	__end_of_i2c_send-_i2c_send
	
_i2c_send:	
	opt	stack 2
; Regs used in _i2c_send: [wreg+status,2+status,0]
;i2c_send@send_data stored from wreg
	line	70
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(i2c_send@send_data)
	
l13790:	
;rtc.c: 69: UINT8 count;
;rtc.c: 70: for(count=0;count<8;count++)
	clrc
	movlw	0
	btfsc	status,0
	movlw	1
	movwf	(i2c_send@count)
	
l13792:	
	movlw	(08h)
	subwf	(i2c_send@count),w
	skipc
	goto	u5741
	goto	u5740
u5741:
	goto	l6017
u5740:
	goto	l6018
	
l13794:	
	goto	l6018
	line	71
	
l6017:	
	line	72
;rtc.c: 71: {
;rtc.c: 72: RC3 = 0;
	bcf	(59/8),(59)&7
	line	73
;rtc.c: 73: if((send_data&0x80)==0x80)
	btfss	(i2c_send@send_data),(7)&7
	goto	u5751
	goto	u5750
u5751:
	goto	l6019
u5750:
	line	75
	
l13796:	
;rtc.c: 74: {
;rtc.c: 75: RC4=1;
	bsf	(60/8),(60)&7
	line	76
;rtc.c: 76: }
	goto	l13798
	line	77
	
l6019:	
	line	79
;rtc.c: 77: else
;rtc.c: 78: {
;rtc.c: 79: RC4=0;
	bcf	(60/8),(60)&7
	goto	l13798
	line	80
	
l6020:	
	line	81
	
l13798:	
;rtc.c: 80: }
;rtc.c: 81: send_data<<=1;
	clrc
	rlf	(i2c_send@send_data),f

	line	82
	
l13800:	
# 82 "E:\Projects\COLOCK\Master_sub_slock\yzj\programe_updata\SZZ485_V1.4\source\rtc.c"
nop ;#
psect	text1448
	
l13802:	
# 82 "E:\Projects\COLOCK\Master_sub_slock\yzj\programe_updata\SZZ485_V1.4\source\rtc.c"
nop ;#
psect	text1448
	line	83
	
l13804:	
;rtc.c: 83: RC3 = 1;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(59/8),(59)&7
	line	84
	
l13806:	
# 84 "E:\Projects\COLOCK\Master_sub_slock\yzj\programe_updata\SZZ485_V1.4\source\rtc.c"
nop ;#
psect	text1448
	
l13808:	
# 84 "E:\Projects\COLOCK\Master_sub_slock\yzj\programe_updata\SZZ485_V1.4\source\rtc.c"
nop ;#
psect	text1448
	line	70
	
l13810:	
	movlw	(01h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_i2c_send+0)+0
	movf	(??_i2c_send+0)+0,w
	addwf	(i2c_send@count),f
	
l13812:	
	movlw	(08h)
	subwf	(i2c_send@count),w
	skipc
	goto	u5761
	goto	u5760
u5761:
	goto	l6017
u5760:
	
l6018:	
	line	86
;rtc.c: 85: }
;rtc.c: 86: RC3 = 0;
	bcf	(59/8),(59)&7
	line	87
	
l6021:	
	return
	opt stack 0
GLOBAL	__end_of_i2c_send
	__end_of_i2c_send:
;; =============== function _i2c_send ends ============

	signat	_i2c_send,4216
	global	_sendnotack_i2c
psect	text1449,local,class=CODE,delta=2
global __ptext1449
__ptext1449:

;; *************** function _sendnotack_i2c *****************
;; Defined at:
;;		line 58 in file "E:\Projects\COLOCK\Master_sub_slock\yzj\programe_updata\SZZ485_V1.4\source\rtc.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		None
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK2
;;      Params:         0       0       0       0
;;      Locals:         0       0       0       0
;;      Temps:          0       0       0       0
;;      Totals:         0       0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    2
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_readbyte
;; This function uses a non-reentrant model
;;
psect	text1449
	file	"E:\Projects\COLOCK\Master_sub_slock\yzj\programe_updata\SZZ485_V1.4\source\rtc.c"
	line	58
	global	__size_of_sendnotack_i2c
	__size_of_sendnotack_i2c	equ	__end_of_sendnotack_i2c-_sendnotack_i2c
	
_sendnotack_i2c:	
	opt	stack 3
; Regs used in _sendnotack_i2c: []
	line	59
	
l13788:	
;rtc.c: 59: RC4 =1 ;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(60/8),(60)&7
	line	60
# 60 "E:\Projects\COLOCK\Master_sub_slock\yzj\programe_updata\SZZ485_V1.4\source\rtc.c"
nop ;#
# 60 "E:\Projects\COLOCK\Master_sub_slock\yzj\programe_updata\SZZ485_V1.4\source\rtc.c"
nop ;#
psect	text1449
	line	61
;rtc.c: 61: RC3 = 1;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(59/8),(59)&7
	line	62
# 62 "E:\Projects\COLOCK\Master_sub_slock\yzj\programe_updata\SZZ485_V1.4\source\rtc.c"
nop ;#
# 62 "E:\Projects\COLOCK\Master_sub_slock\yzj\programe_updata\SZZ485_V1.4\source\rtc.c"
nop ;#
psect	text1449
	line	63
;rtc.c: 63: RC3 = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(59/8),(59)&7
	line	64
	
l6014:	
	return
	opt stack 0
GLOBAL	__end_of_sendnotack_i2c
	__end_of_sendnotack_i2c:
;; =============== function _sendnotack_i2c ends ============

	signat	_sendnotack_i2c,88
	global	_waitack_i2c
psect	text1450,local,class=CODE,delta=2
global __ptext1450
__ptext1450:

;; *************** function _waitack_i2c *****************
;; Defined at:
;;		line 24 in file "E:\Projects\COLOCK\Master_sub_slock\yzj\programe_updata\SZZ485_V1.4\source\rtc.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  errtime         1    1[BANK0 ] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK2
;;      Params:         0       0       0       0
;;      Locals:         0       1       0       0
;;      Temps:          0       1       0       0
;;      Totals:         0       2       0       0
;;Total ram usage:        2 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    2
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_writebyte
;;		_readbyte
;; This function uses a non-reentrant model
;;
psect	text1450
	file	"E:\Projects\COLOCK\Master_sub_slock\yzj\programe_updata\SZZ485_V1.4\source\rtc.c"
	line	24
	global	__size_of_waitack_i2c
	__size_of_waitack_i2c	equ	__end_of_waitack_i2c-_waitack_i2c
	
_waitack_i2c:	
	opt	stack 2
; Regs used in _waitack_i2c: [wreg+status,2+status,0]
	line	25
	
l13764:	
;rtc.c: 25: UINT8 errtime=200;
	movlw	(0C8h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_waitack_i2c+0)+0
	movf	(??_waitack_i2c+0)+0,w
	movwf	(waitack_i2c@errtime)
	line	26
	
l13766:	
;rtc.c: 26: RC3 = 0;
	bcf	(59/8),(59)&7
	line	27
	
l13768:	
;rtc.c: 27: RC4 = 1;
	bsf	(60/8),(60)&7
	line	28
	
l13770:	
;rtc.c: 28: TRISC4 = 1;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	bsf	(1084/8)^080h,(1084)&7
	line	29
	
l13772:	
# 29 "E:\Projects\COLOCK\Master_sub_slock\yzj\programe_updata\SZZ485_V1.4\source\rtc.c"
nop ;#
psect	text1450
	
l13774:	
# 29 "E:\Projects\COLOCK\Master_sub_slock\yzj\programe_updata\SZZ485_V1.4\source\rtc.c"
nop ;#
psect	text1450
	line	30
	
l13776:	
;rtc.c: 30: RC3 = 1;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(59/8),(59)&7
	line	31
	
l13778:	
# 31 "E:\Projects\COLOCK\Master_sub_slock\yzj\programe_updata\SZZ485_V1.4\source\rtc.c"
nop ;#
psect	text1450
	
l13780:	
# 31 "E:\Projects\COLOCK\Master_sub_slock\yzj\programe_updata\SZZ485_V1.4\source\rtc.c"
nop ;#
psect	text1450
	line	32
;rtc.c: 32: while(RC4)
	goto	l6004
	
l6005:	
	line	34
	
l13782:	
;rtc.c: 33: {
;rtc.c: 34: errtime--;
	movlw	low(01h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	subwf	(waitack_i2c@errtime),f
	line	35
	
l13784:	
;rtc.c: 35: if(errtime == 0)
	movf	(waitack_i2c@errtime),f
	skipz
	goto	u5721
	goto	u5720
u5721:
	goto	l6004
u5720:
	line	37
	
l13786:	
;rtc.c: 36: {
;rtc.c: 37: RC4=0; RC3=1; asm("nop");asm("nop");; RC4=1;asm("nop");asm("nop");;
	bcf	(60/8),(60)&7
	bsf	(59/8),(59)&7
# 37 "E:\Projects\COLOCK\Master_sub_slock\yzj\programe_updata\SZZ485_V1.4\source\rtc.c"
nop ;#
# 37 "E:\Projects\COLOCK\Master_sub_slock\yzj\programe_updata\SZZ485_V1.4\source\rtc.c"
nop ;#
psect	text1450
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(60/8),(60)&7
# 37 "E:\Projects\COLOCK\Master_sub_slock\yzj\programe_updata\SZZ485_V1.4\source\rtc.c"
nop ;#
# 37 "E:\Projects\COLOCK\Master_sub_slock\yzj\programe_updata\SZZ485_V1.4\source\rtc.c"
nop ;#
psect	text1450
	line	38
;rtc.c: 38: return;
	goto	l6007
	line	39
	
l6006:	
	line	40
	
l6004:	
	line	32
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	btfsc	(60/8),(60)&7
	goto	u5731
	goto	u5730
u5731:
	goto	l13782
u5730:
	
l6008:	
	line	42
;rtc.c: 39: }
;rtc.c: 40: }
;rtc.c: 42: TRISC4 = 0;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	bcf	(1084/8)^080h,(1084)&7
	line	43
;rtc.c: 43: RC3 = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(59/8),(59)&7
	line	44
	
l6007:	
	return
	opt stack 0
GLOBAL	__end_of_waitack_i2c
	__end_of_waitack_i2c:
;; =============== function _waitack_i2c ends ============

	signat	_waitack_i2c,88
	global	_start_i2c
psect	text1451,local,class=CODE,delta=2
global __ptext1451
__ptext1451:

;; *************** function _start_i2c *****************
;; Defined at:
;;		line 12 in file "E:\Projects\COLOCK\Master_sub_slock\yzj\programe_updata\SZZ485_V1.4\source\rtc.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		None
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK2
;;      Params:         0       0       0       0
;;      Locals:         0       0       0       0
;;      Temps:          0       0       0       0
;;      Totals:         0       0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    2
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_writebyte
;;		_readbyte
;; This function uses a non-reentrant model
;;
psect	text1451
	file	"E:\Projects\COLOCK\Master_sub_slock\yzj\programe_updata\SZZ485_V1.4\source\rtc.c"
	line	12
	global	__size_of_start_i2c
	__size_of_start_i2c	equ	__end_of_start_i2c-_start_i2c
	
_start_i2c:	
	opt	stack 2
; Regs used in _start_i2c: []
	line	13
	
l13762:	
;rtc.c: 13: RC4=1;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(60/8),(60)&7
	line	14
;rtc.c: 14: RC3=1;
	bsf	(59/8),(59)&7
	line	15
# 15 "E:\Projects\COLOCK\Master_sub_slock\yzj\programe_updata\SZZ485_V1.4\source\rtc.c"
nop ;#
# 15 "E:\Projects\COLOCK\Master_sub_slock\yzj\programe_updata\SZZ485_V1.4\source\rtc.c"
nop ;#
psect	text1451
	line	16
;rtc.c: 16: RC4=0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(60/8),(60)&7
	line	17
# 17 "E:\Projects\COLOCK\Master_sub_slock\yzj\programe_updata\SZZ485_V1.4\source\rtc.c"
nop ;#
# 17 "E:\Projects\COLOCK\Master_sub_slock\yzj\programe_updata\SZZ485_V1.4\source\rtc.c"
nop ;#
psect	text1451
	line	18
;rtc.c: 18: RC3=0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(59/8),(59)&7
	line	19
	
l6001:	
	return
	opt stack 0
GLOBAL	__end_of_start_i2c
	__end_of_start_i2c:
;; =============== function _start_i2c ends ============

	signat	_start_i2c,88
	global	_calccrc
psect	text1452,local,class=CODE,delta=2
global __ptext1452
__ptext1452:

;; *************** function _calccrc *****************
;; Defined at:
;;		line 5 in file "E:\Projects\COLOCK\Master_sub_slock\yzj\programe_updata\SZZ485_V1.4\source\CRC.c"
;; Parameters:    Size  Location     Type
;;  crcbuf          1    wreg     unsigned char 
;;  crc             2    0[BANK0 ] unsigned short 
;; Auto vars:     Size  Location     Type
;;  crcbuf          1    4[BANK0 ] unsigned char 
;;  i               1    6[BANK0 ] unsigned char 
;;  chk             1    5[BANK0 ] unsigned char 
;; Return value:  Size  Location     Type
;;                  2    0[BANK0 ] unsigned short 
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK2
;;      Params:         0       2       0       0
;;      Locals:         0       3       0       0
;;      Temps:          0       2       0       0
;;      Totals:         0       7       0       0
;;Total ram usage:        7 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    2
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_MakeCRC16
;; This function uses a non-reentrant model
;;
psect	text1452
	file	"E:\Projects\COLOCK\Master_sub_slock\yzj\programe_updata\SZZ485_V1.4\source\CRC.c"
	line	5
	global	__size_of_calccrc
	__size_of_calccrc	equ	__end_of_calccrc-_calccrc
	
_calccrc:	
	opt	stack 4
; Regs used in _calccrc: [wreg+status,2+status,0]
;calccrc@crcbuf stored from wreg
	line	7
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(calccrc@crcbuf)
	
l13740:	
;CRC.c: 6: unsigned char i,chk;
;CRC.c: 7: crc=crc ^ crcbuf;
	movf	(calccrc@crc),w
	xorwf	(calccrc@crcbuf),w
	movwf	(calccrc@crc)
	movf	(calccrc@crc+1),w
	movwf	1+(calccrc@crc)
	line	8
	
l13742:	
;CRC.c: 8: for(i=0;i<8;i++)
	clrc
	movlw	0
	btfsc	status,0
	movlw	1
	movwf	(calccrc@i)
	
l13744:	
	movlw	(08h)
	subwf	(calccrc@i),w
	skipc
	goto	u5681
	goto	u5680
u5681:
	goto	l13748
u5680:
	goto	l5212
	
l13746:	
	goto	l5212
	line	9
	
l5211:	
	line	10
	
l13748:	
;CRC.c: 9: {
;CRC.c: 10: chk=crc&1;
	movf	(calccrc@crc),w
	andlw	01h
	movwf	(??_calccrc+0)+0
	movf	(??_calccrc+0)+0,w
	movwf	(calccrc@chk)
	line	11
	
l13750:	
;CRC.c: 11: crc=crc>>1;
	movf	(calccrc@crc+1),w
	movwf	(??_calccrc+0)+0+1
	movf	(calccrc@crc),w
	movwf	(??_calccrc+0)+0
	movlw	01h
u5695:
	clrc
	rrf	(??_calccrc+0)+1,f
	rrf	(??_calccrc+0)+0,f
	addlw	-1
	skipz
	goto	u5695
	movf	0+(??_calccrc+0)+0,w
	movwf	(calccrc@crc)
	movf	1+(??_calccrc+0)+0,w
	movwf	(calccrc@crc+1)
	line	12
	
l13752:	
;CRC.c: 12: crc=crc&0x7fff;
	movlw	low(07FFFh)
	andwf	(calccrc@crc),w
	movwf	(calccrc@crc)
	movlw	high(07FFFh)
	andwf	(calccrc@crc+1),w
	movwf	1+(calccrc@crc)
	line	13
	
l13754:	
;CRC.c: 13: if (chk==1)
	movf	(calccrc@chk),w
	xorlw	01h
	skipz
	goto	u5701
	goto	u5700
u5701:
	goto	l13758
u5700:
	line	15
	
l13756:	
;CRC.c: 14: {
;CRC.c: 15: crc=crc^0xa001;
	movlw	low(0A001h)
	xorwf	(calccrc@crc),w
	movwf	(calccrc@crc)
	movlw	high(0A001h)
	xorwf	(calccrc@crc+1),w
	movwf	1+(calccrc@crc)
	goto	l13758
	line	16
	
l5213:	
	line	8
	
l13758:	
	movlw	(01h)
	movwf	(??_calccrc+0)+0
	movf	(??_calccrc+0)+0,w
	addwf	(calccrc@i),f
	
l13760:	
	movlw	(08h)
	subwf	(calccrc@i),w
	skipc
	goto	u5711
	goto	u5710
u5711:
	goto	l13748
u5710:
	
l5212:	
	line	20
;CRC.c: 18: }
;CRC.c: 20: return crc;
	line	21
	
l5214:	
	return
	opt stack 0
GLOBAL	__end_of_calccrc
	__end_of_calccrc:
;; =============== function _calccrc ends ============

	signat	_calccrc,8314
	global	_timer2_init
psect	text1453,local,class=CODE,delta=2
global __ptext1453
__ptext1453:

;; *************** function _timer2_init *****************
;; Defined at:
;;		line 23 in file "E:\Projects\COLOCK\Master_sub_slock\yzj\programe_updata\SZZ485_V1.4\source\timer2.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK2
;;      Params:         0       0       0       0
;;      Locals:         0       0       0       0
;;      Temps:          0       0       0       0
;;      Totals:         0       0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    2
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text1453
	file	"E:\Projects\COLOCK\Master_sub_slock\yzj\programe_updata\SZZ485_V1.4\source\timer2.c"
	line	23
	global	__size_of_timer2_init
	__size_of_timer2_init	equ	__end_of_timer2_init-_timer2_init
	
_timer2_init:	
	opt	stack 5
; Regs used in _timer2_init: [wreg+status,2+status,0]
	line	24
	
l13718:	
;timer2.c: 24: TMR2 = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(17)	;volatile
	line	25
	
l13720:	
;timer2.c: 25: TMR2IF = 0;
	bcf	(97/8),(97)&7
	line	26
	
l13722:	
;timer2.c: 26: T2CKPS1 = 0;
	bcf	(145/8),(145)&7
	line	27
	
l13724:	
;timer2.c: 27: T2CKPS0 = 0;
	bcf	(144/8),(144)&7
	line	28
	
l13726:	
;timer2.c: 28: TOUTPS3 = 0;
	bcf	(150/8),(150)&7
	line	29
	
l13728:	
;timer2.c: 29: TOUTPS2 = 1;
	bsf	(149/8),(149)&7
	line	30
	
l13730:	
;timer2.c: 30: TOUTPS1 = 1;
	bsf	(148/8),(148)&7
	line	31
	
l13732:	
;timer2.c: 31: TOUTPS0 = 1;
	bsf	(147/8),(147)&7
	line	33
	
l13734:	
;timer2.c: 33: TMR2ON = 1;
	bsf	(146/8),(146)&7
	line	34
	
l13736:	
;timer2.c: 34: TMR2IE = 1;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	bsf	(1121/8)^080h,(1121)&7
	line	35
	
l13738:	
;timer2.c: 35: timer2_cnt=0;
	clrc
	movlw	0
	btfsc	status,0
	movlw	1
	movwf	(_timer2_cnt)^080h
	line	36
	
l7610:	
	return
	opt stack 0
GLOBAL	__end_of_timer2_init
	__end_of_timer2_init:
;; =============== function _timer2_init ends ============

	signat	_timer2_init,88
	global	_system_value_init
psect	text1454,local,class=CODE,delta=2
global __ptext1454
__ptext1454:

;; *************** function _system_value_init *****************
;; Defined at:
;;		line 141 in file "E:\Projects\COLOCK\Master_sub_slock\yzj\programe_updata\SZZ485_V1.4\source\sys.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK2
;;      Params:         0       0       0       0
;;      Locals:         0       0       0       0
;;      Temps:          0       0       0       0
;;      Totals:         0       0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    2
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text1454
	file	"E:\Projects\COLOCK\Master_sub_slock\yzj\programe_updata\SZZ485_V1.4\source\sys.c"
	line	141
	global	__size_of_system_value_init
	__size_of_system_value_init	equ	__end_of_system_value_init-_system_value_init
	
_system_value_init:	
	opt	stack 5
; Regs used in _system_value_init: [wreg+status,2+status,0]
	line	142
	
l13708:	
;sys.c: 142: old_time.hour=0;
	clrc
	movlw	0
	btfsc	status,0
	movlw	1
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(_old_time)
	line	143
;sys.c: 143: old_time.min=0;
	clrc
	movlw	0
	btfsc	status,0
	movlw	1
	movwf	0+(_old_time)+01h
	line	144
;sys.c: 144: old_time.sec=0;
	clrc
	movlw	0
	btfsc	status,0
	movlw	1
	movwf	0+(_old_time)+02h
	line	145
	
l13710:	
;sys.c: 145: old_date.day=1;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	clrf	(_old_date)^080h
	bsf	status,0
	rlf	(_old_date)^080h,f
	line	146
	
l13712:	
;sys.c: 146: old_date.date=1;
	clrf	0+(_old_date)^080h+01h
	bsf	status,0
	rlf	0+(_old_date)^080h+01h,f
	line	147
	
l13714:	
;sys.c: 147: old_date.month=1;
	clrf	0+(_old_date)^080h+02h
	bsf	status,0
	rlf	0+(_old_date)^080h+02h,f
	line	148
	
l13716:	
;sys.c: 148: old_date.year=1;
	clrf	0+(_old_date)^080h+03h
	bsf	status,0
	rlf	0+(_old_date)^080h+03h,f
	line	150
;sys.c: 150: up_time_flag=0;
	clrc
	movlw	0
	btfsc	status,0
	movlw	1
	movwf	(_up_time_flag)
	line	151
;sys.c: 151: flag_jiaoshi=0;
	clrc
	movlw	0
	btfsc	status,0
	movlw	1
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(_flag_jiaoshi)
	line	152
;sys.c: 152: timer1_cnt=0;
	clrc
	movlw	0
	btfsc	status,0
	movlw	1
	movwf	(_timer1_cnt)
	line	153
;sys.c: 153: jiaoshi_cnt=0;
	clrc
	movlw	0
	btfsc	status,0
	movlw	1
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(_jiaoshi_cnt)^080h
	line	154
;sys.c: 154: flag_dian1=0;
	clrc
	movlw	0
	btfsc	status,0
	movlw	1
	movwf	(_flag_dian1)
	line	156
;sys.c: 156: flag_dian2=0;
	clrc
	movlw	0
	btfsc	status,0
	movlw	1
	movwf	(_flag_dian2)
	line	160
;sys.c: 160: my_id_code=0;
	clrc
	movlw	0
	btfsc	status,0
	movlw	1
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(_my_id_code)
	line	169
;sys.c: 169: usart_timer_cnt=0;
	clrc
	movlw	0
	btfsc	status,0
	movlw	1
	movwf	(_usart_timer_cnt)
	line	170
;sys.c: 170: usart_count=0;
	clrc
	movlw	0
	btfsc	status,0
	movlw	1
	movwf	(_usart_count)
	line	171
;sys.c: 171: flag_usart_start=0;
	clrc
	movlw	0
	btfsc	status,0
	movlw	1
	movwf	(_flag_usart_start)
	line	173
;sys.c: 173: up_date_flag=0;
	clrc
	movlw	0
	btfsc	status,0
	movlw	1
	movwf	(_up_date_flag)
	line	176
	
l5208:	
	return
	opt stack 0
GLOBAL	__end_of_system_value_init
	__end_of_system_value_init:
;; =============== function _system_value_init ends ============

	signat	_system_value_init,88
	global	_interupt_init
psect	text1455,local,class=CODE,delta=2
global __ptext1455
__ptext1455:

;; *************** function _interupt_init *****************
;; Defined at:
;;		line 79 in file "E:\Projects\COLOCK\Master_sub_slock\yzj\programe_updata\SZZ485_V1.4\source\sys.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		status,2
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK2
;;      Params:         0       0       0       0
;;      Locals:         0       0       0       0
;;      Temps:          0       0       0       0
;;      Totals:         0       0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    2
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text1455
	file	"E:\Projects\COLOCK\Master_sub_slock\yzj\programe_updata\SZZ485_V1.4\source\sys.c"
	line	79
	global	__size_of_interupt_init
	__size_of_interupt_init	equ	__end_of_interupt_init-_interupt_init
	
_interupt_init:	
	opt	stack 5
; Regs used in _interupt_init: [status,2]
	line	80
	
l13704:	
;sys.c: 80: GIE = 1;
	bsf	(95/8),(95)&7
	line	81
;sys.c: 81: PEIE = 1;
	bsf	(94/8),(94)&7
	line	82
	
l13706:	
;sys.c: 82: ANSEL = 0x00;
	bsf	status, 5	;RP0=1, select bank3
	bsf	status, 6	;RP1=1, select bank3
	clrf	(392)^0180h
	line	83
;sys.c: 83: ANSELH = 0x00;
	clrf	(393)^0180h
	line	84
	
l5199:	
	return
	opt stack 0
GLOBAL	__end_of_interupt_init
	__end_of_interupt_init:
;; =============== function _interupt_init ends ============

	signat	_interupt_init,88
	global	_latch_rclk
psect	text1456,local,class=CODE,delta=2
global __ptext1456
__ptext1456:

;; *************** function _latch_rclk *****************
;; Defined at:
;;		line 103 in file "E:\Projects\COLOCK\Master_sub_slock\yzj\programe_updata\SZZ485_V1.4\source\led.c"
;; Parameters:    Size  Location     Type
;;  flag            1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  flag            1    0[BANK0 ] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK2
;;      Params:         0       0       0       0
;;      Locals:         0       1       0       0
;;      Temps:          0       0       0       0
;;      Totals:         0       1       0       0
;;Total ram usage:        1 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    2
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_up_date
;; This function uses a non-reentrant model
;;
psect	text1456
	file	"E:\Projects\COLOCK\Master_sub_slock\yzj\programe_updata\SZZ485_V1.4\source\led.c"
	line	103
	global	__size_of_latch_rclk
	__size_of_latch_rclk	equ	__end_of_latch_rclk-_latch_rclk
	
_latch_rclk:	
	opt	stack 3
; Regs used in _latch_rclk: [wreg]
;latch_rclk@flag stored from wreg
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(latch_rclk@flag)
	line	104
	
l13692:	
;led.c: 104: if(flag==1)
	movf	(latch_rclk@flag),w
	xorlw	01h
	skipz
	goto	u5651
	goto	u5650
u5651:
	goto	l3308
u5650:
	line	106
	
l13694:	
;led.c: 105: {
;led.c: 106: RA5 = 0;
	bcf	(45/8),(45)&7
	line	107
;led.c: 107: }
	goto	l3309
	line	108
	
l3308:	
	line	110
;led.c: 108: else
;led.c: 109: {
;led.c: 110: RA4 = 0;
	bcf	(44/8),(44)&7
	line	111
	
l3309:	
	line	113
# 113 "E:\Projects\COLOCK\Master_sub_slock\yzj\programe_updata\SZZ485_V1.4\source\led.c"
nop ;#
# 113 "E:\Projects\COLOCK\Master_sub_slock\yzj\programe_updata\SZZ485_V1.4\source\led.c"
nop ;#
psect	text1456
	line	115
	
l13696:	
;led.c: 115: if(flag==1)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(latch_rclk@flag),w
	xorlw	01h
	skipz
	goto	u5661
	goto	u5660
u5661:
	goto	l3310
u5660:
	line	117
	
l13698:	
;led.c: 116: {
;led.c: 117: RA5 = 1;
	bsf	(45/8),(45)&7
	line	118
;led.c: 118: }
	goto	l3311
	line	119
	
l3310:	
	line	121
;led.c: 119: else
;led.c: 120: {
;led.c: 121: RA4 = 1;
	bsf	(44/8),(44)&7
	line	122
	
l3311:	
	line	123
# 123 "E:\Projects\COLOCK\Master_sub_slock\yzj\programe_updata\SZZ485_V1.4\source\led.c"
nop ;#
# 123 "E:\Projects\COLOCK\Master_sub_slock\yzj\programe_updata\SZZ485_V1.4\source\led.c"
nop ;#
psect	text1456
	line	124
	
l13700:	
;led.c: 124: if(flag==1)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(latch_rclk@flag),w
	xorlw	01h
	skipz
	goto	u5671
	goto	u5670
u5671:
	goto	l3312
u5670:
	line	126
	
l13702:	
;led.c: 125: {
;led.c: 126: RA5 = 0;
	bcf	(45/8),(45)&7
	line	127
;led.c: 127: }
	goto	l3314
	line	128
	
l3312:	
	line	130
;led.c: 128: else
;led.c: 129: {
;led.c: 130: RA4 = 0;
	bcf	(44/8),(44)&7
	goto	l3314
	line	131
	
l3313:	
	line	132
	
l3314:	
	return
	opt stack 0
GLOBAL	__end_of_latch_rclk
	__end_of_latch_rclk:
;; =============== function _latch_rclk ends ============

	signat	_latch_rclk,4216
	global	_shift_srclk
psect	text1457,local,class=CODE,delta=2
global __ptext1457
__ptext1457:

;; *************** function _shift_srclk *****************
;; Defined at:
;;		line 71 in file "E:\Projects\COLOCK\Master_sub_slock\yzj\programe_updata\SZZ485_V1.4\source\led.c"
;; Parameters:    Size  Location     Type
;;  flag            1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  flag            1    0[BANK0 ] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK2
;;      Params:         0       0       0       0
;;      Locals:         0       1       0       0
;;      Temps:          0       0       0       0
;;      Totals:         0       1       0       0
;;Total ram usage:        1 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    2
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_seg_disp
;; This function uses a non-reentrant model
;;
psect	text1457
	file	"E:\Projects\COLOCK\Master_sub_slock\yzj\programe_updata\SZZ485_V1.4\source\led.c"
	line	71
	global	__size_of_shift_srclk
	__size_of_shift_srclk	equ	__end_of_shift_srclk-_shift_srclk
	
_shift_srclk:	
	opt	stack 3
; Regs used in _shift_srclk: [wreg]
;shift_srclk@flag stored from wreg
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(shift_srclk@flag)
	line	72
	
l13680:	
;led.c: 72: if(flag==1)
	movf	(shift_srclk@flag),w
	xorlw	01h
	skipz
	goto	u5621
	goto	u5620
u5621:
	goto	l3299
u5620:
	line	74
	
l13682:	
;led.c: 73: {
;led.c: 74: RC5 = 0;
	bcf	(61/8),(61)&7
	line	75
;led.c: 75: }
	goto	l3300
	line	76
	
l3299:	
	line	78
;led.c: 76: else
;led.c: 77: {
;led.c: 78: RA3 = 0;
	bcf	(43/8),(43)&7
	line	79
	
l3300:	
	line	80
# 80 "E:\Projects\COLOCK\Master_sub_slock\yzj\programe_updata\SZZ485_V1.4\source\led.c"
nop ;#
# 80 "E:\Projects\COLOCK\Master_sub_slock\yzj\programe_updata\SZZ485_V1.4\source\led.c"
nop ;#
psect	text1457
	line	82
	
l13684:	
;led.c: 82: if(flag==1)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(shift_srclk@flag),w
	xorlw	01h
	skipz
	goto	u5631
	goto	u5630
u5631:
	goto	l3301
u5630:
	line	84
	
l13686:	
;led.c: 83: {
;led.c: 84: RC5 = 1;
	bsf	(61/8),(61)&7
	line	85
;led.c: 85: }
	goto	l3302
	line	86
	
l3301:	
	line	88
;led.c: 86: else
;led.c: 87: {
;led.c: 88: RA3 = 1;
	bsf	(43/8),(43)&7
	line	89
	
l3302:	
	line	90
# 90 "E:\Projects\COLOCK\Master_sub_slock\yzj\programe_updata\SZZ485_V1.4\source\led.c"
nop ;#
# 90 "E:\Projects\COLOCK\Master_sub_slock\yzj\programe_updata\SZZ485_V1.4\source\led.c"
nop ;#
psect	text1457
	line	91
	
l13688:	
;led.c: 91: if(flag==1)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(shift_srclk@flag),w
	xorlw	01h
	skipz
	goto	u5641
	goto	u5640
u5641:
	goto	l3303
u5640:
	line	93
	
l13690:	
;led.c: 92: {
;led.c: 93: RC5 = 0;
	bcf	(61/8),(61)&7
	line	94
;led.c: 94: }
	goto	l3305
	line	95
	
l3303:	
	line	97
;led.c: 95: else
;led.c: 96: {
;led.c: 97: RA3 = 0;
	bcf	(43/8),(43)&7
	goto	l3305
	line	98
	
l3304:	
	line	99
	
l3305:	
	return
	opt stack 0
GLOBAL	__end_of_shift_srclk
	__end_of_shift_srclk:
;; =============== function _shift_srclk ends ============

	signat	_shift_srclk,4216
	global	_calc_zone
psect	text1458,local,class=CODE,delta=2
global __ptext1458
__ptext1458:

;; *************** function _calc_zone *****************
;; Defined at:
;;		line 129 in file "E:\Projects\COLOCK\Master_sub_slock\yzj\programe_updata\SZZ485_V1.4\source\DS3231.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK2
;;      Params:         0       0       0       0
;;      Locals:         0       0       0       0
;;      Temps:          0       1       0       0
;;      Totals:         0       1       0       0
;;Total ram usage:        1 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    2
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_get_time
;;		_main
;; This function uses a non-reentrant model
;;
psect	text1458
	file	"E:\Projects\COLOCK\Master_sub_slock\yzj\programe_updata\SZZ485_V1.4\source\DS3231.c"
	line	129
	global	__size_of_calc_zone
	__size_of_calc_zone	equ	__end_of_calc_zone-_calc_zone
	
_calc_zone:	
	opt	stack 5
; Regs used in _calc_zone: [wreg+status,2+status,0]
	line	167
	
l13672:	
;DS3231.c: 167: old_time.hour += 8;
	movlw	(08h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_calc_zone+0)+0
	movf	(??_calc_zone+0)+0,w
	addwf	(_old_time),f
	line	168
	
l13674:	
;DS3231.c: 168: if(old_time.hour>=24)
	movlw	(018h)
	subwf	(_old_time),w
	skipc
	goto	u5611
	goto	u5610
u5611:
	goto	l2484
u5610:
	line	170
	
l13676:	
;DS3231.c: 169: {
;DS3231.c: 170: old_time.hour-=24;
	movlw	low(018h)
	subwf	(_old_time),f
	line	172
	
l13678:	
;DS3231.c: 172: up_date_flag=1;
	clrf	(_up_date_flag)
	bsf	status,0
	rlf	(_up_date_flag),f
	goto	l2484
	line	174
	
l2483:	
	line	176
	
l2484:	
	return
	opt stack 0
GLOBAL	__end_of_calc_zone
	__end_of_calc_zone:
;; =============== function _calc_zone ends ============

	signat	_calc_zone,88
	global	_putch
psect	text1459,local,class=CODE,delta=2
global __ptext1459
__ptext1459:

;; *************** function _putch *****************
;; Defined at:
;;		line 94 in file "E:\Projects\COLOCK\Master_sub_slock\yzj\programe_updata\SZZ485_V1.4\source\usart.c"
;; Parameters:    Size  Location     Type
;;  byte            1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  byte            1    0[BANK0 ] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK2
;;      Params:         0       0       0       0
;;      Locals:         0       1       0       0
;;      Temps:          0       0       0       0
;;      Totals:         0       1       0       0
;;Total ram usage:        1 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    2
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text1459
	file	"E:\Projects\COLOCK\Master_sub_slock\yzj\programe_updata\SZZ485_V1.4\source\usart.c"
	line	94
	global	__size_of_putch
	__size_of_putch	equ	__end_of_putch-_putch
	
_putch:	
	opt	stack 5
; Regs used in _putch: [wreg]
;putch@byte stored from wreg
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(putch@byte)
	line	96
	
l13668:	
;usart.c: 96: while(!TXIF)
	goto	l1653
	
l1654:	
	line	97
;usart.c: 97: continue;
	
l1653:	
	line	96
	btfss	(100/8),(100)&7
	goto	u5601
	goto	u5600
u5601:
	goto	l1653
u5600:
	goto	l13670
	
l1655:	
	line	98
	
l13670:	
;usart.c: 98: TXREG = byte;
	movf	(putch@byte),w
	movwf	(25)	;volatile
	line	99
	
l1656:	
	return
	opt stack 0
GLOBAL	__end_of_putch
	__end_of_putch:
;; =============== function _putch ends ============

	signat	_putch,4216
	global	_id_code
psect	text1460,local,class=CODE,delta=2
global __ptext1460
__ptext1460:

;; *************** function _id_code *****************
;; Defined at:
;;		line 33 in file "E:\Projects\COLOCK\Master_sub_slock\yzj\programe_updata\SZZ485_V1.4\source\usart.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  id              1    0[BANK0 ] unsigned char 
;; Return value:  Size  Location     Type
;;                  1    wreg      unsigned char 
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK2
;;      Params:         0       0       0       0
;;      Locals:         0       1       0       0
;;      Temps:          0       0       0       0
;;      Totals:         0       1       0       0
;;Total ram usage:        1 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    2
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_usart_init
;; This function uses a non-reentrant model
;;
psect	text1460
	file	"E:\Projects\COLOCK\Master_sub_slock\yzj\programe_updata\SZZ485_V1.4\source\usart.c"
	line	33
	global	__size_of_id_code
	__size_of_id_code	equ	__end_of_id_code-_id_code
	
_id_code:	
	opt	stack 4
; Regs used in _id_code: [wreg+status,2+status,0]
	line	34
	
l13644:	
;usart.c: 34: UINT8 id= 0;
	clrc
	movlw	0
	btfsc	status,0
	movlw	1
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(id_code@id)
	line	35
;usart.c: 35: id = 0x00;
	clrc
	movlw	0
	btfsc	status,0
	movlw	1
	movwf	(id_code@id)
	line	36
	
l13646:	
;usart.c: 36: if(RA1 == 0)
	btfsc	(41/8),(41)&7
	goto	u5521
	goto	u5520
u5521:
	goto	l1636
u5520:
	line	38
	
l13648:	
;usart.c: 37: {
;usart.c: 38: id |= 1<<7;
	bsf	(id_code@id)+(7/8),(7)&7
	line	39
	
l1636:	
	line	40
;usart.c: 39: }
;usart.c: 40: if(RA0 == 0)
	btfsc	(40/8),(40)&7
	goto	u5531
	goto	u5530
u5531:
	goto	l1637
u5530:
	line	42
	
l13650:	
;usart.c: 41: {
;usart.c: 42: id |= 1<<6;
	bsf	(id_code@id)+(6/8),(6)&7
	line	43
	
l1637:	
	line	44
;usart.c: 43: }
;usart.c: 44: if(RB1 == 0)
	btfsc	(49/8),(49)&7
	goto	u5541
	goto	u5540
u5541:
	goto	l1638
u5540:
	line	46
	
l13652:	
;usart.c: 45: {
;usart.c: 46: id |= 1<<5;
	bsf	(id_code@id)+(5/8),(5)&7
	line	47
	
l1638:	
	line	48
;usart.c: 47: }
;usart.c: 48: if(RB2 == 0)
	btfsc	(50/8),(50)&7
	goto	u5551
	goto	u5550
u5551:
	goto	l1639
u5550:
	line	50
	
l13654:	
;usart.c: 49: {
;usart.c: 50: id |= 1<<4;
	bsf	(id_code@id)+(4/8),(4)&7
	line	51
	
l1639:	
	line	52
;usart.c: 51: }
;usart.c: 52: if(RB4 == 0)
	btfsc	(52/8),(52)&7
	goto	u5561
	goto	u5560
u5561:
	goto	l1640
u5560:
	line	54
	
l13656:	
;usart.c: 53: {
;usart.c: 54: id |= 1<<3;
	bsf	(id_code@id)+(3/8),(3)&7
	line	55
	
l1640:	
	line	56
;usart.c: 55: }
;usart.c: 56: if(RB5 == 0)
	btfsc	(53/8),(53)&7
	goto	u5571
	goto	u5570
u5571:
	goto	l1641
u5570:
	line	58
	
l13658:	
;usart.c: 57: {
;usart.c: 58: id |= 1<<2;
	bsf	(id_code@id)+(2/8),(2)&7
	line	59
	
l1641:	
	line	60
;usart.c: 59: }
;usart.c: 60: if(RB7 == 0)
	btfsc	(55/8),(55)&7
	goto	u5581
	goto	u5580
u5581:
	goto	l1642
u5580:
	line	62
	
l13660:	
;usart.c: 61: {
;usart.c: 62: id |= 1<<1;
	bsf	(id_code@id)+(1/8),(1)&7
	line	63
	
l1642:	
	line	64
;usart.c: 63: }
;usart.c: 64: if(RB6 == 0)
	btfsc	(54/8),(54)&7
	goto	u5591
	goto	u5590
u5591:
	goto	l13664
u5590:
	line	66
	
l13662:	
;usart.c: 65: {
;usart.c: 66: id |= 1;
	bsf	(id_code@id)+(0/8),(0)&7
	goto	l13664
	line	67
	
l1643:	
	line	68
	
l13664:	
;usart.c: 67: }
;usart.c: 68: return(id);
	movf	(id_code@id),w
	goto	l1644
	
l13666:	
	line	69
	
l1644:	
	return
	opt stack 0
GLOBAL	__end_of_id_code
	__end_of_id_code:
;; =============== function _id_code ends ============

	signat	_id_code,89
	global	_time_add
psect	text1461,local,class=CODE,delta=2
global __ptext1461
__ptext1461:

;; *************** function _time_add *****************
;; Defined at:
;;		line 78 in file "E:\Projects\COLOCK\Master_sub_slock\yzj\programe_updata\SZZ485_V1.4\source\timer1.c"
;; Parameters:    Size  Location     Type
;;  t               1    wreg     PTR struct _TIME
;;		 -> old_time(3), 
;; Auto vars:     Size  Location     Type
;;  t               1    1[BANK0 ] PTR struct _TIME
;;		 -> old_time(3), 
;; Return value:  Size  Location     Type
;;                  1    wreg      unsigned char 
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK2
;;      Params:         0       0       0       0
;;      Locals:         0       1       0       0
;;      Temps:          0       1       0       0
;;      Totals:         0       2       0       0
;;Total ram usage:        2 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    2
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text1461
	file	"E:\Projects\COLOCK\Master_sub_slock\yzj\programe_updata\SZZ485_V1.4\source\timer1.c"
	line	78
	global	__size_of_time_add
	__size_of_time_add	equ	__end_of_time_add-_time_add
	
_time_add:	
	opt	stack 5
; Regs used in _time_add: [wreg-fsr0h+status,2+status,0]
;time_add@t stored from wreg
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(time_add@t)
	line	79
	
l13616:	
;timer1.c: 79: if(t->sec >= 59)
	movf	(time_add@t),w
	addlw	02h
	movwf	fsr0
	movlw	(03Bh)
	bcf	status, 7	;select IRP bank0
	subwf	indf,w
	skipc
	goto	u5491
	goto	u5490
u5491:
	goto	l13638
u5490:
	line	81
	
l13618:	
;timer1.c: 80: {
;timer1.c: 81: t->sec = 0;
	clrc
	movf	(time_add@t),w
	addlw	02h
	movwf	fsr0
	movlw	0
	btfsc	status,0
	movlw	1
	movwf	indf
	line	82
	
l13620:	
;timer1.c: 82: if(t->min >= 59)
	movf	(time_add@t),w
	addlw	01h
	movwf	fsr0
	movlw	(03Bh)
	subwf	indf,w
	skipc
	goto	u5501
	goto	u5500
u5501:
	goto	l13636
u5500:
	line	84
	
l13622:	
;timer1.c: 83: {
;timer1.c: 84: t->min = 0;
	clrc
	movf	(time_add@t),w
	addlw	01h
	movwf	fsr0
	movlw	0
	btfsc	status,0
	movlw	1
	movwf	indf
	line	85
	
l13624:	
;timer1.c: 85: if(t->hour >= 23)
	movf	(time_add@t),w
	movwf	fsr0
	movlw	(017h)
	subwf	indf,w
	skipc
	goto	u5511
	goto	u5510
u5511:
	goto	l13634
u5510:
	line	87
	
l13626:	
;timer1.c: 86: {
;timer1.c: 87: t->hour = 0;
	clrc
	movf	(time_add@t),w
	movwf	fsr0
	movlw	0
	btfsc	status,0
	movlw	1
	movwf	indf
	line	88
	
l13628:	
;timer1.c: 88: return 1;
	movlw	(01h)
	goto	l800
	
l13630:	
	goto	l800
	line	89
	
l13632:	
;timer1.c: 89: }
	goto	l13640
	line	90
	
l799:	
	line	92
	
l13634:	
;timer1.c: 90: else
;timer1.c: 91: {
;timer1.c: 92: t->hour++;
	movlw	(01h)
	movwf	(??_time_add+0)+0
	movf	(time_add@t),w
	movwf	fsr0
	movf	(??_time_add+0)+0,w
	addwf	indf,f
	goto	l13640
	line	93
	
l801:	
	line	94
;timer1.c: 93: }
;timer1.c: 94: }
	goto	l13640
	line	95
	
l798:	
	line	97
	
l13636:	
;timer1.c: 95: else
;timer1.c: 96: {
;timer1.c: 97: t->min++;
	movlw	(01h)
	movwf	(??_time_add+0)+0
	movf	(time_add@t),w
	addlw	01h
	movwf	fsr0
	movf	(??_time_add+0)+0,w
	addwf	indf,f
	goto	l13640
	line	99
	
l802:	
	line	100
;timer1.c: 99: }
;timer1.c: 100: }
	goto	l13640
	line	101
	
l797:	
	line	103
	
l13638:	
;timer1.c: 101: else
;timer1.c: 102: {
;timer1.c: 103: t->sec++;
	movlw	(01h)
	movwf	(??_time_add+0)+0
	movf	(time_add@t),w
	addlw	02h
	movwf	fsr0
	movf	(??_time_add+0)+0,w
	addwf	indf,f
	goto	l13640
	line	104
	
l803:	
	line	105
	
l13640:	
;timer1.c: 104: }
;timer1.c: 105: return 0;
	movlw	(0)
	goto	l800
	
l13642:	
	line	106
	
l800:	
	return
	opt stack 0
GLOBAL	__end_of_time_add
	__end_of_time_add:
;; =============== function _time_add ends ============

	signat	_time_add,4217
	global	_timer1_init
psect	text1462,local,class=CODE,delta=2
global __ptext1462
__ptext1462:

;; *************** function _timer1_init *****************
;; Defined at:
;;		line 21 in file "E:\Projects\COLOCK\Master_sub_slock\yzj\programe_updata\SZZ485_V1.4\source\timer1.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		status,2
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK2
;;      Params:         0       0       0       0
;;      Locals:         0       0       0       0
;;      Temps:          0       0       0       0
;;      Totals:         0       0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    2
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text1462
	file	"E:\Projects\COLOCK\Master_sub_slock\yzj\programe_updata\SZZ485_V1.4\source\timer1.c"
	line	21
	global	__size_of_timer1_init
	__size_of_timer1_init	equ	__end_of_timer1_init-_timer1_init
	
_timer1_init:	
	opt	stack 5
; Regs used in _timer1_init: [status,2]
	line	22
	
l13586:	
;timer1.c: 22: TMR1H = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(15)	;volatile
	line	23
;timer1.c: 23: TMR1L = 0;
	clrf	(14)	;volatile
	line	24
	
l13588:	
;timer1.c: 24: TMR1IF = 0;
	bcf	(96/8),(96)&7
	line	25
	
l13590:	
;timer1.c: 25: T1OSCEN = 0;
	bcf	(131/8),(131)&7
	line	26
	
l13592:	
;timer1.c: 26: TMR1GE = 0;
	bcf	(134/8),(134)&7
	line	27
	
l13594:	
;timer1.c: 27: T1CKPS1 = 1;
	bsf	(133/8),(133)&7
	line	28
	
l13596:	
;timer1.c: 28: T1CKPS0 = 1;
	bsf	(132/8),(132)&7
	line	29
	
l13598:	
;timer1.c: 29: TMR1CS = 0;
	bcf	(129/8),(129)&7
	line	30
	
l13600:	
;timer1.c: 30: TMR1ON = 1;
	bsf	(128/8),(128)&7
	line	31
	
l13602:	
;timer1.c: 31: TMR1IE = 1;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	bsf	(1120/8)^080h,(1120)&7
	line	32
	
l13604:	
;timer1.c: 32: WDTPS3=1;WDTPS2 = 0;WDTPS1=1;WDTPS0=1;
	bcf	status, 5	;RP0=0, select bank2
	bsf	status, 6	;RP1=1, select bank2
	bsf	(2092/8)^0100h,(2092)&7
	
l13606:	
	bcf	(2091/8)^0100h,(2091)&7
	
l13608:	
	bsf	(2090/8)^0100h,(2090)&7
	
l13610:	
	bsf	(2089/8)^0100h,(2089)&7
	line	34
	
l13612:	
;timer1.c: 34: PSA=0;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	bcf	(1035/8)^080h,(1035)&7
	line	36
	
l13614:	
;timer1.c: 36: RB0 = 1;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(48/8),(48)&7
	line	37
	
l789:	
	return
	opt stack 0
GLOBAL	__end_of_timer1_init
	__end_of_timer1_init:
;; =============== function _timer1_init ends ============

	signat	_timer1_init,88
	global	_isr
psect	text1463,local,class=CODE,delta=2
global __ptext1463
__ptext1463:

;; *************** function _isr *****************
;; Defined at:
;;		line 90 in file "E:\Projects\COLOCK\Master_sub_slock\yzj\programe_updata\SZZ485_V1.4\source\sys.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK2
;;      Params:         0       0       0       0
;;      Locals:         0       0       0       0
;;      Temps:          4       0       0       0
;;      Totals:         4       0       0       0
;;Total ram usage:        4 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		_timer1_isr
;;		_usart_isr
;;		_timer2_isr
;; This function is called by:
;;		Interrupt level 1
;; This function uses a non-reentrant model
;;
psect	text1463
	file	"E:\Projects\COLOCK\Master_sub_slock\yzj\programe_updata\SZZ485_V1.4\source\sys.c"
	line	90
	global	__size_of_isr
	__size_of_isr	equ	__end_of_isr-_isr
	
_isr:	
	opt	stack 1
; Regs used in _isr: [wreg-fsr0h+status,2+status,0+pclath+cstack]
psect	intentry,class=CODE,delta=2
global __pintentry
__pintentry:
global interrupt_function
interrupt_function:
	global saved_w
	saved_w	set	btemp+0
	movwf	saved_w
	movf	status,w
	movwf	(??_isr+0)
	movf	fsr0,w
	movwf	(??_isr+1)
	movf	pclath,w
	movwf	(??_isr+2)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	btemp+1,w
	movwf	(??_isr+3)
	ljmp	_isr
psect	text1463
	line	102
	
i1l12302:	
;sys.c: 102: if(TMR1IF == 1)
	btfss	(96/8),(96)&7
	goto	u391_21
	goto	u391_20
u391_21:
	goto	i1l12306
u391_20:
	line	104
	
i1l12304:	
;sys.c: 103: {
;sys.c: 104: timer1_isr();
	fcall	_timer1_isr
	goto	i1l12306
	line	105
	
i1l5202:	
	line	107
	
i1l12306:	
;sys.c: 105: }
;sys.c: 107: if(RCIF && RCIE)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	btfss	(101/8),(101)&7
	goto	u392_21
	goto	u392_20
u392_21:
	goto	i1l12312
u392_20:
	
i1l12308:	
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	btfss	(1125/8)^080h,(1125)&7
	goto	u393_21
	goto	u393_20
u393_21:
	goto	i1l12312
u393_20:
	line	109
	
i1l12310:	
;sys.c: 108: {
;sys.c: 109: usart_isr();
	fcall	_usart_isr
	goto	i1l12312
	line	110
	
i1l5203:	
	line	111
	
i1l12312:	
;sys.c: 110: }
;sys.c: 111: if(TMR2IF)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	btfss	(97/8),(97)&7
	goto	u394_21
	goto	u394_20
u394_21:
	goto	i1l5205
u394_20:
	line	113
	
i1l12314:	
;sys.c: 112: {
;sys.c: 113: timer2_isr();
	fcall	_timer2_isr
	goto	i1l5205
	line	114
	
i1l5204:	
	line	132
	
i1l5205:	
	movf	(??_isr+3),w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	btemp+1
	movf	(??_isr+2),w
	movwf	pclath
	movf	(??_isr+1),w
	movwf	fsr0
	movf	(??_isr+0),w
	movwf	status
	swapf	saved_w,f
	swapf	saved_w,w
	retfie
	opt stack 0
GLOBAL	__end_of_isr
	__end_of_isr:
;; =============== function _isr ends ============

	signat	_isr,88
	global	_timer2_isr
psect	text1464,local,class=CODE,delta=2
global __ptext1464
__ptext1464:

;; *************** function _timer2_isr *****************
;; Defined at:
;;		line 44 in file "E:\Projects\COLOCK\Master_sub_slock\yzj\programe_updata\SZZ485_V1.4\source\timer2.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK2
;;      Params:         0       0       0       0
;;      Locals:         0       0       0       0
;;      Temps:          1       0       0       0
;;      Totals:         1       0       0       0
;;Total ram usage:        1 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_isr
;; This function uses a non-reentrant model
;;
psect	text1464
	file	"E:\Projects\COLOCK\Master_sub_slock\yzj\programe_updata\SZZ485_V1.4\source\timer2.c"
	line	44
	global	__size_of_timer2_isr
	__size_of_timer2_isr	equ	__end_of_timer2_isr-_timer2_isr
	
_timer2_isr:	
	opt	stack 1
; Regs used in _timer2_isr: [wreg+status,2+status,0]
	line	45
	
i1l12316:	
;timer2.c: 45: TMR2IF = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(97/8),(97)&7
	line	46
	
i1l12318:	
;timer2.c: 46: if(flag_usart_start)
	movf	(_flag_usart_start),w
	skipz
	goto	u395_20
	goto	i1l12322
u395_20:
	line	48
	
i1l12320:	
;timer2.c: 47: {
;timer2.c: 48: usart_timer_cnt++;
	movlw	(01h)
	movwf	(??_timer2_isr+0)+0
	movf	(??_timer2_isr+0)+0,w
	addwf	(_usart_timer_cnt),f
	line	49
;timer2.c: 49: }
	goto	i1l12324
	line	50
	
i1l7613:	
	line	52
	
i1l12322:	
;timer2.c: 50: else
;timer2.c: 51: {
;timer2.c: 52: usart_timer_cnt=0;
	clrc
	movlw	0
	btfsc	status,0
	movlw	1
	movwf	(_usart_timer_cnt)
	line	53
;timer2.c: 53: usart_count=0;
	clrc
	movlw	0
	btfsc	status,0
	movlw	1
	movwf	(_usart_count)
	goto	i1l12324
	line	54
	
i1l7614:	
	line	57
	
i1l12324:	
;timer2.c: 54: }
;timer2.c: 57: if(timer2_cnt >= 10)
	movlw	(0Ah)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	subwf	(_timer2_cnt)^080h,w
	skipc
	goto	u396_21
	goto	u396_20
u396_21:
	goto	i1l12328
u396_20:
	line	59
	
i1l12326:	
;timer2.c: 58: {
;timer2.c: 59: timer2_cnt = 0;
	clrc
	movlw	0
	btfsc	status,0
	movlw	1
	movwf	(_timer2_cnt)^080h
	line	61
;timer2.c: 61: }
	goto	i1l7617
	line	62
	
i1l7615:	
	line	65
	
i1l12328:	
;timer2.c: 62: else
;timer2.c: 63: {
;timer2.c: 65: timer2_cnt++;
	movlw	(01h)
	movwf	(??_timer2_isr+0)+0
	movf	(??_timer2_isr+0)+0,w
	addwf	(_timer2_cnt)^080h,f
	goto	i1l7617
	line	66
	
i1l7616:	
	line	70
	
i1l7617:	
	return
	opt stack 0
GLOBAL	__end_of_timer2_isr
	__end_of_timer2_isr:
;; =============== function _timer2_isr ends ============

	signat	_timer2_isr,88
	global	_usart_isr
psect	text1465,local,class=CODE,delta=2
global __ptext1465
__ptext1465:

;; *************** function _usart_isr *****************
;; Defined at:
;;		line 71 in file "E:\Projects\COLOCK\Master_sub_slock\yzj\programe_updata\SZZ485_V1.4\source\usart.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  cbuffer         1    1[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK2
;;      Params:         0       0       0       0
;;      Locals:         1       0       0       0
;;      Temps:          1       0       0       0
;;      Totals:         2       0       0       0
;;Total ram usage:        2 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_isr
;; This function uses a non-reentrant model
;;
psect	text1465
	file	"E:\Projects\COLOCK\Master_sub_slock\yzj\programe_updata\SZZ485_V1.4\source\usart.c"
	line	71
	global	__size_of_usart_isr
	__size_of_usart_isr	equ	__end_of_usart_isr-_usart_isr
	
_usart_isr:	
	opt	stack 1
; Regs used in _usart_isr: [wreg-fsr0h+status,2+status,0]
	line	73
	
i1l12212:	
;usart.c: 72: UINT8 cbuffer;
;usart.c: 73: cbuffer = RCREG;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(26),w	;volatile
	movwf	(??_usart_isr+0)+0
	movf	(??_usart_isr+0)+0,w
	movwf	(usart_isr@cbuffer)
	line	74
	
i1l12214:	
;usart.c: 74: if(OERR == 1)
	btfss	(193/8),(193)&7
	goto	u381_21
	goto	u381_20
u381_21:
	goto	i1l12218
u381_20:
	line	76
	
i1l12216:	
;usart.c: 75: {
;usart.c: 76: CREN = 0;
	bcf	(196/8),(196)&7
	line	77
;usart.c: 77: CREN = 1;
	bsf	(196/8),(196)&7
	line	78
;usart.c: 78: return;
	goto	i1l1648
	line	79
	
i1l1647:	
	line	80
	
i1l12218:	
;usart.c: 79: }
;usart.c: 80: if(usart_count<17)
	movlw	(011h)
	subwf	(_usart_count),w
	skipnc
	goto	u382_21
	goto	u382_20
u382_21:
	goto	i1l12224
u382_20:
	line	82
	
i1l12220:	
;usart.c: 81: {
;usart.c: 82: rx_udata[usart_count++] = cbuffer;
	movf	(usart_isr@cbuffer),w
	movwf	(??_usart_isr+0)+0
	movf	(_usart_count),w
	addlw	_rx_udata&0ffh
	movwf	fsr0
	movf	(??_usart_isr+0)+0,w
	bcf	status, 7	;select IRP bank1
	movwf	indf
	
i1l12222:	
	movlw	(01h)
	movwf	(??_usart_isr+0)+0
	movf	(??_usart_isr+0)+0,w
	addwf	(_usart_count),f
	line	83
;usart.c: 83: }
	goto	i1l12226
	line	84
	
i1l1649:	
	line	86
	
i1l12224:	
;usart.c: 84: else
;usart.c: 85: {
;usart.c: 86: usart_count=0;
	clrc
	movlw	0
	btfsc	status,0
	movlw	1
	movwf	(_usart_count)
	goto	i1l12226
	line	87
	
i1l1650:	
	line	88
	
i1l12226:	
;usart.c: 87: }
;usart.c: 88: flag_usart_start=1;
	clrf	(_flag_usart_start)
	bsf	status,0
	rlf	(_flag_usart_start),f
	line	89
	
i1l12228:	
;usart.c: 89: usart_timer_cnt=0;
	clrc
	movlw	0
	btfsc	status,0
	movlw	1
	movwf	(_usart_timer_cnt)
	line	91
	
i1l1648:	
	return
	opt stack 0
GLOBAL	__end_of_usart_isr
	__end_of_usart_isr:
;; =============== function _usart_isr ends ============

	signat	_usart_isr,88
	global	_timer1_isr
psect	text1466,local,class=CODE,delta=2
global __ptext1466
__ptext1466:

;; *************** function _timer1_isr *****************
;; Defined at:
;;		line 45 in file "E:\Projects\COLOCK\Master_sub_slock\yzj\programe_updata\SZZ485_V1.4\source\timer1.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK2
;;      Params:         0       0       0       0
;;      Locals:         0       0       0       0
;;      Temps:          1       0       0       0
;;      Totals:         1       0       0       0
;;Total ram usage:        1 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_isr
;; This function uses a non-reentrant model
;;
psect	text1466
	file	"E:\Projects\COLOCK\Master_sub_slock\yzj\programe_updata\SZZ485_V1.4\source\timer1.c"
	line	45
	global	__size_of_timer1_isr
	__size_of_timer1_isr	equ	__end_of_timer1_isr-_timer1_isr
	
_timer1_isr:	
	opt	stack 1
; Regs used in _timer1_isr: [wreg+status,2+status,0]
	line	46
	
i1l12134:	
;timer1.c: 46: TMR1IF = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(96/8),(96)&7
	line	47
	
i1l12136:	
;timer1.c: 47: if(timer1_cnt >= 3)
	movlw	(03h)
	subwf	(_timer1_cnt),w
	skipc
	goto	u369_21
	goto	u369_20
u369_21:
	goto	i1l12158
u369_20:
	line	49
	
i1l12138:	
;timer1.c: 48: {
;timer1.c: 49: timer1_cnt = 0;
	clrc
	movlw	0
	btfsc	status,0
	movlw	1
	movwf	(_timer1_cnt)
	line	50
	
i1l12140:	
# 50 "E:\Projects\COLOCK\Master_sub_slock\yzj\programe_updata\SZZ485_V1.4\source\timer1.c"
nop ;#
psect	text1466
	
i1l12142:	
# 50 "E:\Projects\COLOCK\Master_sub_slock\yzj\programe_updata\SZZ485_V1.4\source\timer1.c"
nop ;#
psect	text1466
	
i1l12144:	
# 50 "E:\Projects\COLOCK\Master_sub_slock\yzj\programe_updata\SZZ485_V1.4\source\timer1.c"
nop ;#
psect	text1466
	
i1l12146:	
# 50 "E:\Projects\COLOCK\Master_sub_slock\yzj\programe_updata\SZZ485_V1.4\source\timer1.c"
nop ;#
psect	text1466
	
i1l12148:	
# 50 "E:\Projects\COLOCK\Master_sub_slock\yzj\programe_updata\SZZ485_V1.4\source\timer1.c"
nop ;#
psect	text1466
	
i1l12150:	
# 50 "E:\Projects\COLOCK\Master_sub_slock\yzj\programe_updata\SZZ485_V1.4\source\timer1.c"
nop ;#
psect	text1466
	
i1l12152:	
# 50 "E:\Projects\COLOCK\Master_sub_slock\yzj\programe_updata\SZZ485_V1.4\source\timer1.c"
nop ;#
psect	text1466
	line	52
	
i1l12154:	
;timer1.c: 52: TMR1L = 0x76;
	movlw	(076h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(14)	;volatile
	line	53
	
i1l12156:	
;timer1.c: 53: TMR1H = 0x2F;
	movlw	(02Fh)
	movwf	(15)	;volatile
	line	54
;timer1.c: 54: up_time_flag++;
	movlw	(01h)
	movwf	(??_timer1_isr+0)+0
	movf	(??_timer1_isr+0)+0,w
	addwf	(_up_time_flag),f
	line	60
;timer1.c: 60: }
	goto	i1l794
	line	61
	
i1l792:	
	line	64
	
i1l12158:	
;timer1.c: 61: else
;timer1.c: 62: {
;timer1.c: 64: timer1_cnt++;
	movlw	(01h)
	movwf	(??_timer1_isr+0)+0
	movf	(??_timer1_isr+0)+0,w
	addwf	(_timer1_cnt),f
	goto	i1l794
	line	65
	
i1l793:	
	line	68
	
i1l794:	
	return
	opt stack 0
GLOBAL	__end_of_timer1_isr
	__end_of_timer1_isr:
;; =============== function _timer1_isr ends ============

	signat	_timer1_isr,88
psect	text1467,local,class=CODE,delta=2
global __ptext1467
__ptext1467:
	global	btemp
	btemp set 07Eh

	DABS	1,126,2	;btemp
	global	wtemp0
	wtemp0 set btemp
	end
