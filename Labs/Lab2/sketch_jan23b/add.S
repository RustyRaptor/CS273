
#
# Global data (x1, x2, and x3)
#
    .data
    .comm x1,1
    .global x1
    .comm x2,1
    .global x2
    .comm x3,1
    .global x3

#
# Program code (addition function)
#
    .text
    .global addition
addition:
    lds  r18, x1
    inc  r18  
    add  r18, r18
    lds  r19, x2
    dec  r19
    lds  r20, x3
    dec  r20
    dec  r20
    dec  r20
    add  r18, r19
    add  r18, r20
    sts  x3,  r18
    ret
    ldi    r17, 0x20  // Store 32 (used to turn on the LED)
    out    0x04, r17  // Sets the direction of that port on B to out
    out    0x05, r17
