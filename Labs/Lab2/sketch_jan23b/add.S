
#
# Global data (x1, x2, and x3)
#
    .data     //begin allocating memory
    .comm x1,1// Alocate x1 x2 and x3 with 1 byte each
    .global x1// Make them global
    .comm x2,1
    .global x2
    .comm x3,1
    .global x3

#
# Program code (addition function)
#
    .text           // begin program
    .global addition// make addition function global
addition:
    lds  r18, x1  // Store x1,x2,x3 in registers
    inc  r18      // Increment x1 for the +1  
    add  r18, r18 // add x1 to itself (times 2)
    lds  r19, x2  
    dec  r19      // -1 for x2
    lds  r20, x3
    dec  r20      // -3 for x3
    dec  r20
    dec  r20
    add  r18, r19 // add them all up and store them
    add  r18, r20 // in x3
    sts  x3,  r18 // put x3 back in it's memory
    ldi    r17, 0x20 // Now that we're done let's 
   // out    0x04, r17 // flash the LED
    out    0x05, r17
    ret           // All done
