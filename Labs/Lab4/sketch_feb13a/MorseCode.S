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

// tables for the morse code
// styled nicely :)
// each row has 6 elements so you can easily see which corresponds to which. 
morse_table:
.byte 0b01,    0b1000,  0b1010,  0b100,   0b0,     0b0010,\
      0b110,   0b0000,  0b00,    0b0111,  0b101,   0b0100,\
      0b11,    0b10,    0b111,   0b0110,  0b1101,  0b010,\
      0b000,   0b1,     0b001,   0b0001,  0b011,   0b1001,\
      0b1011,  0b1100,  0b01111, 0b00111, 0b00011, 0b00001,\
      0b00000, 0b10000, 0b11000, 0b11100, 0b11110, 0b11111

morse_width:
.byte 2, 4, 4, 3, 1, 4,\
      3, 4, 2, 4, 3, 4,\
      2, 2, 3, 4, 4, 3,\
      3, 1, 3, 4, 3, 4,\
      4, 4, 5, 5, 5, 5,\
      5, 5, 5, 5, 5, 5

ascii_table:
.byte 'A', 'B', 'C', 'D', 'E', 'F',\
      'G', 'H', 'I', 'J', 'K', 'L',\
      'M', 'N', 'O', 'P', 'Q', 'r',\
      's', 'T', 'U', 'V', 'W', 'X',\
      'Y', 'Z', '1', '2', '3', '4',\
      '5', '6', '7', '8', '9', '0'

.comm val, 1
.comm width, 1
.comm ascii, 1
.global val, ascii, width



.text
.global decode_morse

decode_morse:
pushall

ldi r31, hi8(morse_table) // Store the table values in X, Y, Z
ldi r30, lo8(morse_table)
ldi r29, hi8(ascii_table)
ldi r28, lo8(ascii_table)
ldi r27, hi8(morse_width)
ldi r26, lo8(morse_width)


loop:
  ld r20, X+ // load an item from the array and ready the next item. 
  ld r21, Y+
  ld r22, Z+
  lds r18, val // load val 
  lds r19, width // load width
  cp r19, r20   // check width
  breq compareasc // if it's the right width lets check the actual value
  jmp loop // otherwise lets go to the next one. 

compareasc:
  cp r22, r18 // if it's the right value lets go return it. 
  breq storeascii
  jmp loop

storeascii:

// return the value to ascii and we are done.
sts ascii, r21
popall
ret
