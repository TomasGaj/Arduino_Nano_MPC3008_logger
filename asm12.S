;------------------------
; Assembly Code
;------------------------
#define __SFR_OFFSET 0x00
#include "avr/io.h"
;------------------------
.global init_serial
.global print_msg
.global a
//var: .byte 1
;------------------------
init_serial:
    CLR   R24
    STS   UCSR0A, R24               ;clear UCSR0A register
    STS   UBRR0H, R24               ;clear UBRR0H register
    LDI   R24, 0                    ;& store in UBRR0L 0 value (1000000baud)
    STS   UBRR0L, R24               ;to set baud rate 
    LDI   R24, 1<<RXEN0 | 1<<TXEN0  ;enable RXB & TXB
    STS   UCSR0B, R24
    LDI   R24, 1<<UCSZ00 | 1<<UCSZ01;asynch, no parity, 1 stop, 8 bits
    STS   UCSR0C, R24 

RET
;-------------------------------------------------------------------------

print_msg:

    LDS  R30, a
    LDS  R31, a+1
	
    LDS  R20, TCNT1L
	
    MOV  R28, R30
    MOV  R29, R31
	
    MOV  R18, R20	

    LDI   R25, 48
    LDI   R24, 7

	SWAP R30
	ANDI R30, 0b00001111
	
	ANDI R28, 0b00001111
	
	ANDI R29, 0b00001111
	
	SWAP R20
	ANDI R20, 0b00001111	

	ANDI R18, 0b00001111
	
    ADD   R28, R25  
    ADD   R29, R25       
    ADD   R30, R25 
    ADD   R31, R25
	
    ADD   R18, R25     
    ADD   R20, R25 	

    MOV   R16, R20
    SUBI  R16, 58
    BRPL  ADD_7_to_R20
	
FROM_7_ADDED_TO_R20: 
   
    MOV   R16, R18
    SUBI  R16, 58
    BRPL  ADD_7_to_R18
	
FROM_7_ADDED_TO_R18:

    MOV   R16, R29
    SUBI  R16, 58   
    BRPL ADD_7_to_R29

FROM_7_ADDED_TO_R29:
 
    MOV   R16, R30
    SUBI  R16, 58   
    BRPL  ADD_7_to_R30

FROM_7_ADDED_TO_R30:

    MOV   R16, R28
    SUBI  R16, 58
    BRPL  ADD_7_to_R28

FROM_7_ADDED_TO_R28:	

loop_print_R20: 
    LDS   R17, UCSR0A
    SBRS  R17, UDRE0                ;test data buffer if data can be sent
    RJMP  loop_print_R20
    STS   UDR0, R20

loop_print_R18: 
    LDS   R17, UCSR0A
    SBRS  R17, UDRE0                ;test data buffer if data can be sent
    RJMP  loop_print_R18
    STS   UDR0, R18
 
loop_print_R29: 
    LDS   R17, UCSR0A
    SBRS  R17, UDRE0                ;test data buffer if data can be sent
    RJMP  loop_print_R29
    STS   UDR0, R29

loop_print_R30: 
    LDS   R17, UCSR0A
    SBRS  R17, UDRE0                ;test data buffer if data can be sent
    RJMP  loop_print_R30
    STS   UDR0, R30

loop_print_R28: 
    LDS   R17, UCSR0A
    SBRS  R17, UDRE0                ;test data buffer if data can be sent
    RJMP  loop_print_R28
    STS   UDR0, R28

    LDI   R26, 13
loop_print_13: 
    LDS   R17, UCSR0A
    SBRS  R17, UDRE0                ;test data buffer if data can be sent
    RJMP  loop_print_13
    STS   UDR0, R26
 
    LDI   R26, 10
loop_print_10: 
    LDS   R17, UCSR0A
    SBRS  R17, UDRE0                ;test data buffer if data can be sent
    RJMP  loop_print_10
    STS   UDR0, R26

RET

ADD_7_to_R20:	
	ADD   R20, R24
	RJMP  FROM_7_ADDED_TO_R20

ADD_7_to_R18:	
	ADD   R18, R24
	RJMP  FROM_7_ADDED_TO_R18
	
ADD_7_to_R29:
	ADD   R29, R24
	RJMP  FROM_7_ADDED_TO_R29
  
ADD_7_to_R30:
	ADD   R30, R24
	RJMP  FROM_7_ADDED_TO_R30
	
ADD_7_to_R28:
	ADD   R28, R24
	RJMP  FROM_7_ADDED_TO_R28




