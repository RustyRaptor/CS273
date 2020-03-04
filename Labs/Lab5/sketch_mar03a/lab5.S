//

//  AVR code to do the function of the 4  x 7 segment display of Lab 5
//
//
//   Shaun Cooper
//    CS 273
//    Semester XXXX , 20XX
//
//  The basic algorithm is to have the main loop
// set some shared variable values
//  we then use simulataneous arrays (vectors)
//  to figure out which segment is desired 
//; and which sequence is needed
//
//  Since our setup utilizes PORTB and PORTB, then we need to main
//   simulataneous vectors for all of the segment sequences that are neededed
//
// main routine does
//   setup_ports once
// 
//   C code to do the following

//   segment=0
//   digit=9
//   display_segment()// will display 9 on segment 0, for example
//  
  .data
  // macro to push all the registers
.macro pushall
push r16
push r17
push r18
push r19
push r20
push r21
push r22
push r23
push r24
push r25
push r26
push r27
push r28
push r29
push r30
push r31
.endm

// macro to pop all the registers
.macro popall
pop r31
pop r30
pop r29
pop r28
pop r27
pop r26
pop r25
pop r24
pop r23
pop r23
pop r21
pop r20
pop r19
pop r18
pop r17
pop r16
.endm
  .size segment_table, 4
  .size portb_table, 10
  .size portd_table, 10
  
segment_table:  // binary for seting input on PORTB for segment select
    .byte 0b00000010, 0b00000100, 0b00001000, 0b00010000
    // 0, 1, 2,3 4, 5, 6 , 7, 8 , 9
portb_table:  // list of binary sequences for setting port B to be ORed with segment table ite
    .byte  0b00000001,1,0,0,0,0,0,1,0,0
portd_table: // list of binary sequences for setting port D.
    .byte  0b00000000,0b11100100,0b10010000,0b11000000,0b01100100,0b01001000,0b00001100,0b11100000,0, 0b01100000
segmentv: .byte 1


  
  .comm segment, 1 // the common name for segment
  .comm digit, 1 // the digit into our sequences
  .global segment, digit

  

// --------
  .text
  .global setup_ports
  .global display_segment
  .global setallout



setup_ports:  // routine to set the ports into output mode

   // set PORT B
  // set PORT D
  
  ret // of setup_ports



display_segment:  //  main entry point for setting the segment

   // the goal is the use "digit" to and "segment" to find the values that need
   // to be sent to PORTB and PORT D 


    ret // of display_segment

setallout:
  pushall
  // set all the pins we are going to use to output mode.

  // port B
  ldi r16, 0x1f
  out 0x04, r16
  out 0x05, r16
  
  // port C
  ldi r17, 0x0A
  out 0x04, r17
  out 0x05, r17

  // port D
  ldi r17, 0xfc
  out 0x04, r17
  out 0x05, r17
  popall
  ret
  
    
