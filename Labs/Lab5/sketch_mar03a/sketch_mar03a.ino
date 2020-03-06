/*
  Showing number 0-9 on a Common Anode 7-segment LED display
  Displays the numbers 0-9 on the display, with one second inbetween.
    A
   ---
F |   | B
  | G |
   ---
E |   | C
  |   |
   ---
    D
  This example code is in the public domain.
 */
 
// Pin 2-8 is connected to the 7 segments of the display.
int pinA = 2;
int pinB = 3;
int pinC = 4;
int pinD = 5;
int pinE = 6;
int pinF = 7;
int pinG = 8;
int D1 = 9;
int D2 = 10;
int D3 = 11;
int D4 = 12;
extern byte segment;
extern byte digit;

extern "C" { 
  void setup_ports();
//  void select_segment();
//  void display_segment();
  void doit();
}

//void selectseg(){
//  select_segment();
//  
//}//end of selectSeg()
//
//void displayseg(){
//  display_segment();
//    
//}//end displayseg();

// the setup routine runs once when you press reset:
void setup() {                
  // initialize the digital pins as outputs.
//  pinMode(pinA, OUTPUT);     
//  pinMode(pinB, OUTPUT);     
//  pinMode(pinC, OUTPUT);     
//  pinMode(pinD, OUTPUT);     
//  pinMode(pinE, OUTPUT);     
//  pinMode(pinF, OUTPUT);     
//  pinMode(pinG, OUTPUT);   
//  pinMode(D1, OUTPUT);  
//  pinMode(D2, OUTPUT);  
//  pinMode(D3, OUTPUT);  
//  pinMode(D4, OUTPUT);  
  setup_ports();
}

// the loop routine runs over and over again forever:
void loop() {
  //Tell which segment im writing to

  doit();
  delay(1000);
 
}
