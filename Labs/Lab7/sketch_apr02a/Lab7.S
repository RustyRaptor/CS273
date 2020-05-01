.equ ADCL, 0x0078
.equ ADCH, 0x0079
.equ ADCSRA, 0x007A
.equ ADCSRB, 0x007B
.equ ADMUX, 0x007C
.equ DDIR0, 0x007E
.equ ADSC, 6 // bit 6 on the ADCSRA
.text
.global initAD
.global readAD
     ; LDI r16, 0b01100000
     ; add r16, r24
     ; STS ADMUX, r16
initAD:  // routine which initializes the A/D lines     
     LDI R16, 0b00111111
     STS DDIR0, R16

     LDI R16, 0b10000111
     STS ADCSRA, R16

     ret // of initAD

readAD:
     // routine which has one parameter in r24
     // and then reads the A/D signal and places the result
     // into r24, clearing r25
     // we need to set up the ADMUX and ADSCSRA and then
     // wait on ADSC


     push r16
     push r17
     LDI r16, 0b01100000
     add r16, r24
     STS ADMUX, r16

     LDS r17, ADCSRA
     ori r17, 0b01000000
     STS ADCSRA, r17



     loopADC:
          LDS r16, ADCSRA
          andi r16, 0b01000000
          brne loopADC

     LDS r24, ADCH
     clr r25
     pop r17
     pop r16
     ret // we have our result, we are done
