
# MorseCode.S

#--------------------------------------------------------------------
    .extern delay
#---------------------------------------------------------------------
    .text
    .global goaggies

// the sequence of long and short waits for each letter we need. 
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

// short wait
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

// long delay
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

// the amount of time we wait between each letter. 
letter:
    call wait
    call wait
    call wait
    call wait
    call wait
    call wait


// the amount of time we wait between each word.
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

// the wait delay for 1 unit.
wait:    
    ldi R22, 160
    ldi R23, 0
    ldi R24, 0
    ldi R25, 0
    call delay
    ret
