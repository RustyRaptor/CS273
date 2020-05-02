// question 1
     //  2in = 300ms
     //  3in = 460ms
     //  4in = 580ms
     //  7in = 940ms
     //  8in = 1860ms

// question 2
     //    1ft(12in) = 8in + 4in = 1860 + 580  = 2440ms 

// question 3
     // 2cm - 400cm or 1ft to 13ft
     // https://randomnerdtutorials.com/complete-guide-for-ultrasonic-sensor-hc-sr04/

// question 4
     // no because our interrupt vector only uses the bit we have it plugged into.
  
 
// setting constants for ultrasonic sensor 
.set trigpin, 4; port c pin 4
.set echopin, 1; port b pin 1
.set pinb, 0x03
.set ddirb, 0x04
.set ddirc, 0x07
.set portc, 0x08

.data

.comm pinbstate, 1
.global pinbstate ; used to store the current state of pinb

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
     pop r22
     pop r21
     pop r20
     pop r19
     pop r18
     pop r17
     pop r16
.endm

.text
.global ultrasensor
.global readpinbstate
.extern delaymicroseconds

// setup the ultrasonic sensor to send an echo
ultrasensor:

     // set trig pin to output and echo pin to input
     sbi ddirc, trigpin
     cbi ddirb, echopin

     // trig pin is low for 2 microseconds
     cbi portc, trigpin
     call delay2

     // trig pin is high for 10 microseconds
     sbi portc, trigpin
     call delay10

     // finally set trig pin to low, this will send an echo
     cbi portc, trigpin

     ret

readpinbstate:
//routine to look at the echo pin and set "pinbstate" the global variable to 1 or 0 based on the pin
     pushall
     // read pinb in a register, we want to see if the echo pin has been set
     
     

     // if the echo pin has been set, it means that the echo has been sent, store 1 in 'pinbstate'
     sbic pinb, echopin
          rjmp truelabel
     rjmp falselabel

          // if the echo pin has been cleared, it means that the echo might have come back, store 0 in 'pinbstate'
     falselabel:
          ldi r16, 0 // set R16 to 0 for false
          jmp done
     
     truelabel:
          ldi r16, 1 // set R16 to 1 for true
          jmp done

     done:
          sts pinbstate, r16 // load the state of pin B into R16 so we can read it.
          popall
     ret


delay10:
     pushall
     ldi   r22, 0x0a // load 10 into the r22 register to make it 10000 ms
     ldi   r23, 0x00
     ldi   r24, 0x00
     ldi   r25, 0x00
     call delay
     popall
     ret

delay2:
     pushall
     ldi   r22, 0x02  // same but load 2 to make it 2000ms
     ldi   r23, 0x00
     ldi   r24, 0x00
     ldi   r25, 0x00
     call delay
     popall
     ret


