extern byte val;
extern byte width;
extern byte ascii;

extern "C" {
  void decode_morse();
  void goaggies();
}

//
// function to read a 2-digit decimal value from user
//
byte read2DigitValue()
{
  byte inch; int val;
  Serial.println("Enter a 2-digit decimal value:");
  while (!Serial.available()) delay(100);
  inch = Serial.read();
  val = (inch - '0') * 10;
  while (!Serial.available()) delay(100);
  inch = Serial.read();
  val += (inch - '0');
  Serial.print("The value entered is ");
  Serial.println(val, DEC);
  return (byte) val;
}

void flashGoAggies()
{
  Serial.println("How many times do you want it to flash GOAGGIES?");
  int num = read2DigitValue();
  for (int i = 0; i < num; i++) {
     goaggies();
  }
  

  // You will call the GoAggies() function from assembly file GoAggies.S
}

void decodeMorse(const String & string, char message[])
{

  int idx = 0; // index of message
  val = 0; // val to store input sequence
  width = 0; // width of the sequence we give it
  for (int i = 0; i <= string.length(); i++) {
    if (string[i] != '\0' && string[i] != ' ' ) {
      width++;
      val = val * 2 + (string[i] - '0');
    }
    else {
      decode_morse();
      message[idx] = ascii;
      idx++;
      val = 0;
      width = 0;
    }
  }

  message[idx] = '\0';
}



void decodeMorse()
{
  Serial.println("Input a Morse code string (separate the code for characters by a space):");

  while (!Serial.available()) delay(100);
  String string = Serial.readString();

  Serial.print("The Morse code string is: ");
  Serial.println(string);

//  string = "1000 100 0"; // "01 1000";
  char message[100];

  decodeMorse(string, message);

  if (strlen(message) > 0) {
    Serial.print("The decoded message is: ");
    Serial.println(message);
  } else {
    Serial.print("Failure in decoding the input Morse code\n");
  }
}

void setup() {
  //
  // Initialize serial communications
  //
  Serial.begin(9600);

  flashGoAggies();

  decodeMorse();

}

void loop() {
  // put your main code here, to run repeatedly:
  delay(20000); // 20,000 millisecs == 20 seconds
  Serial.println("*");
}
