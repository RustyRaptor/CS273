
    .file "FatMonitor.S"

    .data
    .comm gender, 1
    .global gender
    .comm age, 1
    .global age
    .comm fat, 1
    .global fat
    
    .text
    .global lightup       // export the program to be used in the sketch
lightup:
      ldi r18, 0b00110001 // ALL
      ldi r19, 0b00000001 // GREEN
      ldi r20, 0b00010000 // BLUE
      ldi r21, 0b00100000 // RED
      lds r22, gender     // Load Gender
      lds r23, age        // Load Age
      lds r24, fat        // load fat
      // Male or Female
      CPI r22, 0x01
      breq male:

      // If Female
female:
       
      // If Male
male:
      out 0x04, r18
      out 0x05, r18
      ret               // END
    
