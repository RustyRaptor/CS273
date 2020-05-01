
extern "C" {
void initAD( );
byte readAD( byte );
}

void setup( ) {
     Serial.begin( 9600 );
     initAD( ); // call assembly init A/D routine
}

void loop( ) {
     byte v;
     v = readAD( 2 ); // call assembly read sensor routine, A/D pin #2
     Serial.print( " light = " );
     Serial.println( v, HEX );
     delay( 1000 ); // delay one second
}
