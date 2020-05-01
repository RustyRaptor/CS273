#include "avr/io.h"
#include "avr/interrupt.h"

ISR(TIMER2_COMPB_vect) //ISR for Timer2 compar B {
byte *a = 0x200;
byte *b = 0x201;

if (*B1 == 255) {
     *B1 = 0;
     *B2++;
} else{
     *B1++;
}
}
