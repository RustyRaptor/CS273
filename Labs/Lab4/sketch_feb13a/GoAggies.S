
# MorseCode.S
# Feb 9, 2016

#--------------------------------------------------------------------
    .extern delay
#---------------------------------------------------------------------
    .text
    .global goaggies
G:
  call long
  call long
  call short
  call letter
  ret
O:
  call long
  call long
  call long
  call letter
  ret 

A:
  call short
  call long
  call letter
  ret
I:
  call short
  call short
  call letter
  ret
E:
  call short
  call letter
  ret
S:
  call short
  call short
  call short
  call letter
  ret

goaggies:
    call G
    call O
    call A
    call G
    call G
    call I
    call E
    call S
    ret

short:
    ldi r16, 0x20
    ldi r17, 0x00
    out 0x04, r16
    out 0x05, r16
    call wait
    call wait
    out 0x05, r17
    call wait
    ret

long:
    ldi r16, 0x20
    ldi r17, 0x00
    out 0x04, r16
    out 0x05, r16
    call wait
    call wait
    call wait
    call wait
    call wait
    call wait
    out 0x05, r17
    call wait
    ret

letter:
    call wait
    call wait
    call wait
    call wait
    call wait
    call wait

word:
    call wait
    call wait
    call wait
    call wait
    call wait
    call wait
    call wait
    call wait
    call wait
    call wait
    call wait
    call wait
    call wait
    call wait

wait:    
    ldi R22, 160
    ldi R23, 0
    ldi R24, 0
    ldi R25, 0
    call delay
    ret
