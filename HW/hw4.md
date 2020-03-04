# CS273 HW 4 - Ziad Arafat

1. The instructions are
   1. LDI R28, lo8(0x33A0)
   2. LDI R29, hi8(0x33A0)


2. To keep different pieces of code or functions from interfering with each other. We are storing their values so we can retreive them later for another function that was using them. 
3. Each character is 1 byte so we should just find them in the even registers.
   - So 'm' 'o' 'o' 'n' will be in r24, r22, r20, r18 respectively.


4. A microcontroller has I/O and memory components on-board whereas a CPU does not. A CPU needs to be plugged into a board which provides those components.
   - The AVR is a microcontroller because it has I/O and memory on board.

5. 16 bits on ours


6. It's I/O Address is 0x3f so simply
   - IN R18, 0x3f


7. Since the PC will increment before branching it will need to be calculated from the next line: $2002 - 2005 = -3$, $2007 - 2006 = 1$
   1. for the first it's 1111111
   2. for the second it's 0000001

8. the value stored should be 16
   1. first we increment it until it is 15
   2. then we skip that decrement and increment it one more time.
