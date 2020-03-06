
//
// Declare the things that exist in our assembly code
//
extern "C" { 
  void display_symbol();//will write this in display.s
  void display_one(); 
}

extern byte symbol1;
extern byte symbol2;
extern byte symbol3;
extern byte symbol4; 

//
// Arduino-required setup function (called once)
//
void setup()
{
  //
  // Initialize serial communications (for loop() function)
  //
  Serial.begin(9600);

  while (!Serial.available()) delay(100);
  String string = Serial.readString();

  int b = 0; 
  symbol1 = string[b]; 
  display_one(); 

  while (!Serial.available()) delay(100);
  string = Serial.readString();
      
  int i = 0; 
  int j = 1;
  int v = 2;
  int k = 3; 
  while(true){

  if(string[i] == '\0'){
    i = 0; 
    symbol1 = string[i]; 
    i++;  
    
  }
  else{
    symbol1 = string[i]; 
    i++; 
  }

  if(string[j] == '\0'){
    j = 0; 
    symbol2 = string[j];
    j++; 
  }
  else{
    symbol2 = string[j];
    j++; 
  }
  if(string[v] == '\0'){
    v = 0; 
    symbol3 = string[v]; 
    v++;  
  }
  else{
    symbol3 = string[v]; 
    v++; 
  }
  if(string[k] == '\0'){
    k = 0; 
    symbol4 = string[k]; 
    k++; 
  }
  else{
    symbol4 = string[k]; 
    k++; 
  }
  
   // only take the first symbol to display
  
  display_symbol();
  delay(500); 
  }
}

//
// Arduino-required loop function (called infinitely)
//
void loop(){

  delay(2000); // 2,000 millisecs == 2 seconds
  Serial.println("*"); // debug output just to show we got here
}
