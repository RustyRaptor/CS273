
.file "FatMonitor.S"
.data
.comm BLINK, 1 // Used to enable or disable blink vs stay on
.comm BVECTOR, 1 // Stores the value to tell which LEDs to turn on.
.comm gender, 1
.global gender
.comm age, 1 
.global age
.comm fat, 1
.global fat

.text
.global lightup     // export the program to be used in the sketch


lightup:
        ldi r16, 1
        ldi r17, 0b00000000 // OFF ALL
        ldi r18, 0b00110001 // ALL
        ldi r19, 0b00000001 // RED
        ldi r20, 0b00100000 // BLUE
        ldi r21, 0b00010000 // GREEN
        lds r22, gender     // Load Gender
        lds r23, age        // Load Age
        lds r24, fat        // load fat
        sts BVECTOR, r17
        sts BLINK, r16
        // Male or Female
        cpi r22, 0x01
        brlt female
        jmp male


// If Female
female: 
        cpi r23, 20
        brlt leds
        jmp f20
f20:    // Are we age 20-39?
        cpi r23, 40
        brlt ft20
        jmp f40
ft20:   // We are age 20-39
        cpi r24, 21
        brlt low
        cpi r24, 33
        brlt normal
        cpi r24, 39
        brlt high
        jmp vhigh
f40:    // Are we age 40 - 59
        cpi r23, 60
        brlt ft40
        jmp f60
ft40:   // We are age 40-59
        cpi r24, 23
        brlt low
        cpi r24, 34
        brlt normal
        cpi r24, 40
        brlt high
        jmp vhigh
f60:    // Are we age 60 - 79?
        cpi r23, 79
        brlt ft60
        jmp fin // If we are 80+ then this program isn't for us.
ft60:   // We are age 60-79
        cpi r24, 24
        brlt low
        cpi r24, 36
        brlt normal
        cpi r24, 42
        brlt high
        jmp vhigh



// LED Choosing
// Placed here so it is easily within 
// branching distance of the female and male blocks.
low:
        sts BVECTOR, r20
        jmp leds
normal:
        sts BVECTOR, r21
        jmp leds
high:
        sts BVECTOR, r19
        jmp leds
vhigh:
        sts BVECTOR, r18
        sts BLINK, r17
        jmp leds
leds:
        lds r25, BVECTOR
        lds r26, BLINK
        out 0x04, r25
        out 0x05, r25
        cpi r26, 1
        brlt fin
        jmp off


// If Male
male:   // Are we at least 20?
        cpi r23, 20
        brlt fin // If we are under 20 this program is not for us. 
        jmp m20
m20:    // We are at least 20, are we 20-39?
        cpi r23, 40
        brlt mt20
        jmp m40
mt20:   // We are 20-39
        cpi r24, 8
        brlt low
        cpi r24, 20
        brlt normal
        cpi r24, 25
        brlt high
        jmp vhigh
m40:    // Are we age 40-59?
        cpi r23, 60
        brlt mt40
        jmp m60
mt40:   // We are age 40-59
        cpi r24, 11
        brlt low
        cpi r24, 22
        brlt normal
        cpi r24, 28
        brlt high
        jmp vhigh
m60:    // Are we age 60-79?
        cpi r23, 79
        brlt mt60
        jmp fin // If we are 80+ this program is not for us. 
mt60:   // We are age 60-79
        cpi r24, 13
        brlt low
        cpi r24, 25
        brlt normal
        cpi r24, 30
        brlt high
        jmp vhigh




off: // In case we just want to blink. Lets turn it off after a bit. 
        ldi    r20, 0x04  // Store 4 (multiplies the delay by 4)
dl0:    ldi    r18, 0xff  // Store 255 (multiplies by 255)
dl1:    ldi    r19, 0xff  // Also multiplies by 255
dl2:    nop
nop
nop
nop                // No-Op for wait
dec     r19        // decrement the last 255
brne    dl2        // loops back until r19 reaches 0
dec     r18        // decrement the second 255
brne    dl1        // loop back until r18 is 0
dec     r20        // decrease the 4
brne    dl0        // once we finish 4 times we continue

ldi     r17, 0x00  // Change the port values to 0 (For setting the LED off)
out     0x05, r17  // Output the 0 on port B (Led off)
fin: // End
ret


// ANSWERS TO QUESTIONS
// 1. BGR
// 2. BGR
// 3. _G_
// 4. __R
