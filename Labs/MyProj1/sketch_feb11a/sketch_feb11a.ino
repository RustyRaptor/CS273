int c = 40;
int d = 0;
int l[] = {13, 12, 11, 10, 9, 8, 7, 6, 5, 4, 3, 2};
int s[] = {1, 1, 0, 0, 0, 1, 1, 0, 0, 1, 0, 1};
int size = 12;
int jump = 20;

void setup() {
  // put your main code here, to run repeatedly:
   for (int i = 0; i < 12; i++) {
    pinMode(l[i], OUTPUT);
  }
  Serial.begin(9600); 

 
}

void loop() {
    
    Serial.print("Y:");
    Serial.println(analogRead(0));
    Serial.print("X:");
    Serial.println(analogRead(1));
    for (int j = 0; j < 6; j++){
      if (s[j] == 0){
        analogWrite(l[j], analogRead(0)-324);
      }
    }
    for (int j = 6; j < size; j++){
      if (s[j] == 0){
        analogWrite(l[j], analogRead(1)-651);
      }
    }
    delay(10);
//  for (int k = 1; k < 256; k++){
//    jump = k;
//    for (int i = 0; i < 256; i+=jump){
//      for (int j = 0; j < size; j++){
//        if (s[j] == 0){
//          analogWrite(l[j], i);
//        }
//      }
//      delay(10);
//    }
//    for (int i = 255; i >= 0; i-=jump){
//      for (int j = 0; j < size; j++){
//        if (s[j] == 0){
//          analogWrite(l[j], i);
//        }
//      }
//      delay(10);
//    }
//  }
//  for (int k = 256; k >= 1; k--){
//    jump = k;
//    for (int i = 0; i < 256; i+=jump){
//      for (int j = 0; j < size; j++){
//        if (s[j] == 0){
//          analogWrite(l[j], i);
//        }
//      }
//      delay(10);
//    }
//    for (int i = 255; i >= 0; i-=jump){
//      for (int j = 0; j < size; j++){
//        if (s[j] == 0){
//          analogWrite(l[j], i);
//        }
//      }
//      delay(10);
//    }
//  }
  
//  for (int k = 0; k < size; k++) {
//    for (int i = 0; i < size; i++) {
//      for (int j = 0; j < size;j++) {
//      digitalWrite(l[i], HIGH);
//      digitalWrite(l[j], HIGH);
//      digitalWrite(l[k], HIGH);
//      delay(c);
//      digitalWrite(l[i], LOW);
//      digitalWrite(l[j], LOW);
//      digitalWrite(l[k], LOW);
////      delay(d);
//      }
//    }
//  }
//  for (int k = size-1; k >= 0; k--) {
//    for (int i = size-1; i >= 0; i--) {
//      for (int j = size-1; j >= 0;j--) {
//      digitalWrite(l[i], HIGH);
//      digitalWrite(l[j], HIGH);
//      digitalWrite(l[k], HIGH);
//      delay(c);
//      digitalWrite(l[i], LOW);
//      digitalWrite(l[j], LOW);
//      digitalWrite(l[k], LOW);
////      delay(d);
//      }
//    }
//  }
//  for (int i = 0; i < 6; i++) {
//
//  }
//  for (int i = 11; i >= 0; i--) {
//    if (s[i] == 1){
//      digitalWrite(l[i], HIGH);
//      delay(c);
//      digitalWrite(l[i], LOW);
//      delay(c);
//    } else {
//      analogWrite(l[i], 255);
//      delay(c);
//      analogWrite(l[i], 0);
//      delay(c);
//    }
//  }
}
