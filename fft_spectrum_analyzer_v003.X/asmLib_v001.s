.include "xc.inc"

.text                       ;BP (put the following data in ROM(program memory))

; This is a library, thus it can *not* contain a _main function: the C file will
; define main().  However, we will need a .global statement to make available ASM
; functions to C code.
; All functions utilized outside of this file will need to have a leading 
; underscore (_) and be included in a comment delimited list below.
.global _wait_100us, _wait_1ms, _write_0, _write_1
    
    

_wait_100us:
    repeat #1593
    nop
    return
    
_wait_1ms:
    repeat #15993
    nop
    return
    
    
_write_0:			; 2 cycles to call
    inc     LATA		; set pin RA0 high = 1 cycle (low)
    repeat #3			; 1 cycle
    nop				; 3+1 cycle
    clr	    LATA                ; set pin RA0 low = 1 cycle (high)
    repeat #5			; 1 cycle
    nop				; 6 cycles
    return			; 3 cycles to return
    
    
_write_1:    ; 2 cycles to call
    inc     LATA		; set pin RA0 high = 1 cycle (low)
    repeat #8			; 1 cycle
    nop				; 8+1 cycle
    clr	    LATA                ; set pin RA0 low = 1 cycle (high)
    repeat #2			; 1 cycle
    nop				; 3 cycles
    return  ; 3 cycles to return














