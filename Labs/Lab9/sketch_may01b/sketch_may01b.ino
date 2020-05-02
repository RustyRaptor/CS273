
#include <avr/interrupt.h>
long start_time;
long totduration;
extern byte pinbstate;

extern "C" {
void ultrasensor( );
void readpinbstate( );
}

void setup( ) {
     Serial.begin( 9600 );

     /*
   * Set the bits of the appropriate PCMSKx register high
   * to enable pin change detection on PB1 (port b pin 1). 
   * PCINT1 in our case.
   */
     PCMSK0 = ( 1 << PCINT1 );

     // Enable the corresponding vector, PCIE0 in our case.
     PCICR = ( 1 << PCIE0 );

     // Enable the interrupt flag
     sei( );
}

void loop( ) {
     ultrasensor( );
     delay( 1000 ); // delay a second
}

/*
 * The interrupt service routine that would activate on 
 * a value change of PB1
 */
ISR( PCINT0_vect ) {
     /* The echo pin is changed twice
      1. First echo pin is set, this is when the echo is sent,
      record start time in microseconds
      2. Then echo pin is cleared, this is when the echo came
      back, record the end time now.
      */

     // Read the pin b state to know if its 0 or 1
     readpinbstate( );

     // figure out total time,
     // determine a safe distance (like 5 inches)
     // print out "Safe Distance"  or "Too close" based on your science
     if ( pinbstate == 1 ) {
          start_time = micros( );
     }

     if ( pinbstate == 0 ) {
          totduration = micros( ) - start_time; // calculate duration between signals
          if ( totduration > 760 ) {  // calculated from measurements taken in question 1
               Serial.println( "SAFE" );
          } else {
               Serial.println( "TOO CLOSE" );
          }
          Serial.println( totduration );
     }
}
