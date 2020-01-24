
    .file "test.S"
    .text
    .global testf       // export the program to be used in the sketch
testf:
      ldi    r17, 0x20  // Store 32 (used to turn on the LED)
      out    0x04, r17  // Sets the direction of that port on B to out

      ldi    r16, 100   // Store 100 (Determines the number of times we blink the LED)

all:  ldi    r17, 0x20  // Store 32 again for looping
      out    0x05, r17  // Output the 32 on port B (LED On)
      ldi    r20, 0x04  // Store 4 (multiplies the delay by 4)
dl0:  ldi    r18, 0xff  // Store 255 (multiplies by 255)
dl1:  ldi    r19, 0xff  // Also multiplies by 255
dl2:  nop
      nop
      nop
      nop               // No-Op for wait
      dec    r19        // decrement the last 255
      brne   dl2        // loops back until r19 reaches 0
      dec    r18        // decrement the second 255
      brne   dl1        // loop back until r18 is 0
      dec    r20        // decrease the 4       
      brne   dl0        // once we finish 4 times we continue
      
      ldi    r17, 0x00  // change the 32 to 0 (sets the LED to off)
      out    0x05, r17  // Output the 0 on port B (Led off)
      
      ldi    r20, 0x04  // We set the same values as when it was on. 
dl5:  ldi    r18, 0xff
dl3:  ldi    r19, 0xff
dl4:  nop
      nop
      nop
      nop               // all same as before but different loops labels.
      dec    r19
      brne   dl4
      dec    r18
      brne   dl3
      dec    r20
      brne   dl5

      dec    r16        // decrement the number of blinks
      brne   all        // loop back to beginning until we finish all the blinks.
      ret               // END
    
