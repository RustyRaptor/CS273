  .data
  .size segment_table, 4
  .size portb_table, 10
  .size portd_table, 10
  
segment_table:  #binary for seting input on PORTB for segment select
    .byte 0b00000010, 0b00000100, 0b00001000, 0b00010000
     //  0, 1, 2,3 4, 5, 6 , 7, 8 , 9
portb_table:  # list of binary sequences for setting port B to be ORed with segment table ite
    .byte  0b00000001,1,0,0,0,0,0,1,0,0
portd_table: # list of binary sequences for setting port D.
    .byte  0b00000000,0b11100100,0b10010000,0b11000000,0b01100100,0b01001000,0b00001100,0b11100000,0, 0b01100000
segmentv: .byte 1


  
  .comm segment, 1  //  the common name for segment
  .comm digit, 1  //  the digit into our sequences
  .global segment, digit

  

# --------
  .text
  .global setup_ports
  .global select_segment
  .global display_segment
  .global doit
setup_ports:
clr R16
clr R17
ldi R16, 0b11111111
ldi R17, 0b11111111
out 0x04, R17
out 0x0A, R16
ret

doit:

ldi R16, 0b11111110
ldi R17, 0b00100001
out 0x05, R17
out 0x0B, R16


ret
    
