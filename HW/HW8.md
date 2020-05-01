
1. Convert to binary
```
LDI 1110-KKKK-dddd-KKKK
INC 1001-010d-dddd-0011
BRNE 1111-01kk-kkkk-k001
DEC 1001-010d-dddd-1010
ST,Y 1000-001r-rrrr-1000

0. LDI R19, 0x5
     1110-0000-0011-0101 = 0xE035

1. LDI R16, 0x55
     1110-0101-0000-0101 = 0xE505

2. LDI YL, 0x40
     1110-0100-1100-0000 = 0xE4C0

3. LDI YH, 0x1
     1110-0000-1101-0001 = 0xE0D1

4. L1: ST Y, R16
     1000-0011-0000-1000 = 0x8308

5. INC YL
     1001-0101-1100-0011 = 0x95C3

6. DEC R20
     1001-0101-0011-1010 = 0x953A

7. BRNE L1
     1111-01kk-kkkk-k001
     1111-0111-1110-0001 = 0xF7E1

     We need -4

     0000100  = 4
          1111011 = 1’s comp of 4
          1111100 = 2’s comp of 4

0. 35
   E0
1. 05
   E5
2. C0
   E4
3. D1
   E0
4. 08
   83
5. C3
   95
6. 3A
   95
7. E1
   F7


```

2. Convert to binary.
```
LDI   1110-KKKK-dddd-KKKK
LPMZ+ 1001-000d-dddd-0101
CPI   0011-KKKK-dddd-KKKK
BREQ  1111-00kk-kkkk-k001
ST,X+ 1001-001r-rrrr-1101
RJMP  1100-kkkk-kkkk-kkkk

LDI  ZL, lo8(MYDATA)   ;R30 = 00 low-byte address
1110-0000-1110-0000 = E0E0

LDI  ZH, hi8(MYDATA)   ;R31 = 05, high-byte address
1110-0000-1111-0101 = E0F5

LDI  XL, lo8(0x140)    ;R26 = 40, low-byte RAM address
1110-0100-1010-0000 E4A0

LDI  XH, hi8(0x140)    ;R27 = 1, high-byte RAM address
1110-0000-1011-0001 E0B1

AGAIN: 
     LPM  R16, Z+     ;read the table, then increment Z
          LPMZ+ 1001-000d-dddd-0101
          1001-0001-0000-0101 9105

     CPI  R16,0       ;compare R16 with 0
          CPI 0011-KKKK-dddd-KKKK
          0011-0000-0000-0000 3000

     1. BREQ  END        ;exit if end of string
          BREQ 1111-00kk-kkkk-k001 
          1111-0000-0001-0001 F011

     2. ST  X+, R16      ;store R16 in RAM and inc X
          ST,X+ 1001-001r-rrrr-1101
          1001-0011-0000-1101 930D
END: 
     8. RJMP  AGAIN
          RJMP 1100-kkkk-kkkk-kkkk
          1100-1111-1111-1011 CFFB

          Convert -5
               0000101

               1111010
               1111011 = -5
          -5 in 16 bit
          1111-1111-1111-1011

          0000-0000-0000-0100 1s comp
          0000-0000-0000-0101 = 5
     9. END: RJMP END
          RJMP 1100-kkkk-kkkk-kkkk
          1100-1111-1111-1111
          CFFF
1. E0
   E0
2. F5
   E0
3. A0
   E4
4. B1
   E0
5. 05
   91
6. 00
   30
7. 11
   F0
8. 0D
   93
9. FB
   CF
10.FF
   CF

500.0x54
0x68
0x65
0x20
0x50
0x72
0x6f
0x6d
0x69
0x73
0x65
0x20
0x6f
0x66
0x20
0x57
0x6f
0x72
0x6c
0x64
0x20
0x50
0x65
0x61
0x63
0x65

```

Do you view esports as a potential asset? How do you personally think esports could benefit the university's image? 