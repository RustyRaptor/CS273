.data

.comm segment, 1
.comm digit, 1
.global segment, digit

.text
.global setup_ports
.global select_segment
.global show_num



setup_ports:
ldi r16, 0b00011111
ldi R17, 0b11111100
out 0x04, r16
out 0x0A, r17

ret 

// select the segment
select_segment:
  out 0x05, R19
  out 0x0B, R19
  LDS R18, segment
  cpi R18, 0
    breq SEGMENT0
  cpi R18, 1
    breq SEGMENT1
  cpi R18, 2
    breq SEGMENT2
  JMP SEGMENT3

// Load the correct segment bytes. 
SEGMENT0:
  ldi R19, 0b00011100
  out 0x05, R19
  ret
SEGMENT1:
  ldi R19, 0b00011010
  out 0x05, R19
  ret
SEGMENT2:
  ldi R19, 0b00010110
  out 0x05, R19
  ret
SEGMENT3:
  ldi R19, 0b00001110
  out 0x05, R19
  ret

// Select the digit.
show_num: 
  LDS R20, digit
  cpi R20, 0
    breq SHOW0
  cpi R20, 1
    breq SHOW1
  cpi R20, 2
    breq SHOW2
  cpi R20, 3
    breq SHOW3
  cpi R20, 4
    breq SHOW4
  cpi R20, 5
    breq SHOW5
  cpi R20, 6
    breq SHOW6
  cpi R20, 7
    breq SHOW7
  cpi R20, 8
    breq SHOW8
  JMP SHOW9

// Display the correct digit. 
// Will add 0b00000001 to the segment and re OUT the segment when we need G
SHOW0:
  ldi R22, 0b11111111
  out 0x0B, R22
  ret

SHOW1:
  ldi R22, 0b00011000
  out 0x0B, R22
  ret

SHOW2:
  ldi R22, 0b01101100
  ldi R23, 0b00000001
  add R19, R23
  out 0x05, R19
  out 0x0B, R22
  ret
  
SHOW3:
  ldi R22, 0b00111100
  ldi R23, 0b00000001
  add R19, R23
  out 0x05, R19
  out 0x0B, R22
  ret
  
SHOW4:
  ldi R22, 0b10011000
  ldi R23, 0b00000001
  add R19, R23
  out 0x05, R19
  out 0x0B, R22
  ret
SHOW5:
  ldi R22, 0b10110100
  ldi R23, 0b00000001
  add R19, R23
  out 0x05, R19
  out 0x0B, R22
  ret
  
SHOW6:
  ldi R22, 0b11110100
  ldi R23, 0b00000001
  add R19, R23
  out 0x05, R19
  out 0x0B, R22
  ret
  
SHOW7:
  ldi R22, 0b00011100
  out 0x0B, R22
  ret
  
SHOW8:
  ldi R22, 0b11111100
  ldi R23, 0b00000001
  add R19, R23
  out 0x05, R19
  out 0x0B, R22
  ret

SHOW9:
  ldi R22, 0b10011100
  ldi R23, 0b00000001
  add R19, R23
  out 0x05, R19
  out 0x0B, R22
  ret
