1. as follows
```
0x0100:   0010-0001-1110-0000  1110-kkkk-dddd-kkkk
               1110-0000-0010-0001 => ldi r18, 0x01

0x0101:   0011-0001-1110-0000
               1110-0000-0011-0001 => ldi r19, 0x01

0x0102:   0100-1000-1110-0000
               1110-0000-0100-1000 => ldi r20, 0x08

0x0103:   0011-0010-0000-1111  0000-11rd-dddd-rrrr
          l1:  0000-1111-0011-0010 => add r19, r18

0x0104:   0010-0011-0010-1111  0010-11rd-dddd-rrrr
               0010-1111-0010-0011 => mov r18, r19

0x0105:   0100-1010-1001-0101 1001-010d-dddd-1010
               1001-0101-0100-1010 => dec r20

0x0106:   1110-0001-1111-0111      1111-01kk-kkkk-k001
               1111-0111-1110-0001 => brne l1  (111100)
                                             000011 => 000100
```

2. indicate the value loaded into r30, r31, and r20 in the following program:
```
.org 0x0
     ldi r30, lo8(our_data )
     ldi r31, hi8(our_data)
     lpm  r20, z
.org 0x0524
our_data: .byte 20, ‘$’, ‘5’
```

```
r30 = 0x24
r31 = 0x05
r20 = 0x14
```

3. write a program to read the following message from program rom and place it in data ram starting at 0x200:
```
.org 0x0500
mydata: .asciz “will artificial intelligence rule human?”


.text 
entry:
     ldi r31, hi8(mydata)
     ldi r30, lo8(mydata)
     ldi r29, hi8(0x200)
     ldi r28, lo8(0x200)

loop:   
     lpm r16, z+
     st y+, r16
     cpi r16, 0
     brne loop
     ret


.org 0x500
mydata: .asciz “will artificial intelligence rule human?”
```

4. write a program that calculates the checksum of the values at location 0x00d5 to 0x0300 of eeprom.
```
ldi r18, hi8(0x00d5) // load hi bit
ldi r17, lo8(0x00d5) // load low bit
clr r19 // clear two registers. 
clr r20
loop:      
     sbic eecr, eewe // is the eeprom available?
     rjmp loop // repeat if it's not ready yet. 
     
     out eearh, r18 
     out eearl, r17
     
     sbi eecr, eere // open eeprom
     
     in r16, eedr
     
     add r19, r16
     inc r17  
     adc r18, r20
     
     cpi r18, 0x03 // we know that r18 will be 0x03 once after we covered all the num
     brne  loop

// r19 contains the sum of the data
neg r19 // r19 should now make it zero if it's not corrupted
```

5. Checksums

```
(a) Data=$62, $F3, and $15; checksum=$72

$62
$F3
$15
$72
$1 DC

CORRUPTED
```
```
(b) Data=$50, $88, $3C, and $8E; checksum=$6D

$50
$88
$3C
$8E
$6D
= 2 OF
NOT CORRUPTED
```

```
(c) Data=0, 0, 0, 0, 0, 0; checksum=0

0
0 
NOT CORRUPTED
```

```
(d) Data=1,-1,1,-1,1,-1; checksum=1

 1
 -1
 1
 -1
 1
 -1
 1
  = 1 
  CORRUPTED DATA
 ```