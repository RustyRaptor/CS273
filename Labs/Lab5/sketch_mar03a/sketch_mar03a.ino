extern byte segment;
extern byte digit;

extern "C" {
  void setup_ports();
  void select_segment();
  void show_num();
}

void display_num(byte seg, byte dig, int del) {
  digit = dig;
  segment = seg;
  select_segment();
  show_num();
  delay(del);
}

void setup() {
  setup_ports();
}

void loop() {
  // for loop simplifies call
  for (int i = 0; i <= 9; i++) {
    display_num(i % 4, i, 500);
    // the i%4 sets the correct segment
  }
}
