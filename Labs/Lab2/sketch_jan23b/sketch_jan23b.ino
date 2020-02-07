//
// Declare the things that exist in our assembly code
//
/*
extern "C" { 
  byte x1;
  byte x2;
  byte x3;
  void addition();
}
*/


extern byte x1, x2, x3; // import x1 x2 x3
extern "C" void addition(void); // import the addition program as a function

//
// function to read a 2-digit decimal value from user
//
byte read2DigitValue()
{
  byte inch; int val;
  Serial.println("Enter a 2-digit decimal value:"); 
  
  while (!Serial.available()) delay(100); // Wait for the user to enter something 
  
  inch = Serial.read(); // As soon as they do read what they entered
  val = (inch - '0') * 10;
   
  
  while (!Serial.available()) delay(100); // Do it again for the next digit
  
  inch = Serial.read(); // read what the digit is
  val += (inch - '0');
  Serial.print("It's decimal value entered is ");
  Serial.println(val,DEC);
  return (byte) val; 
}
byte readHexValue()
{
  byte inch; int val;
  Serial.println("Enter a 2-digit hexadecimal value:"); 
  
  while (!Serial.available()) delay(100); // Wait for the user to enter something 
  
  inch = Serial.read(); // As soon as they do read what they entered
  if (inch >= '0' && inch <= '9') val = (inch - '0') * 16;
  else if (inch >= 'a' && inch <= 'f') val = (inch - 'a' + 10) * 16;
  else if (inch >= 'A' && inch <='F') val = (inch - 'A' + 10) * 16;
   
  
  while (!Serial.available()) delay(100); // Do it again for the next digit
  
  inch = Serial.read(); // read what the digit is
  if (inch >= '0' && inch <= '9') val += (inch - '0');
  else if (inch >= 'a' && inch <= 'f') val += (inch - 'a' + 10);
  else if (inch >= 'A' && inch <='F') val += (inch - 'A' + 10);
  Serial.print("The hex value entered is "); 
  Serial.println(val,HEX); // print out the value they entered
  Serial.print("It's decimal value is ");
  Serial.println(val,DEC);
  return (byte) val; 
}

//
// Arduino-required setup function (called once)
//
void setup()
{
  pinMode(13, OUTPUT); // set the LED to be automatically off
  digitalWrite(13, LOW); 

  //
  // Initialize serial communications
  //
  Serial.begin(9600); // Start listening on the Serial console
  //
  // Read three values from user, store in global vars
  //
  x1 = read2DigitValue(); // read 2 digit values into each memory address
  x2 = read2DigitValue();
  x3 = read2DigitValue();
  //
  // Call our assembly code
  //
  addition(); 
  //
  // print out value of x2 variable
  Serial.println("After addition()");
  Serial.print("The value is ");
  Serial.println((int) x3,DEC);
}

//
// Arduino-required loop function (called infinitely)
//
void loop()
{
  // prints a * every 20 seconds for some reason
  delay(20000); // 20,000 millisecs == 20 seconds 
  Serial.println("*");
}
