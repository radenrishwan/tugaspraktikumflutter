void main(List<String> args) {
  loop(10);
}

void loop(int size) {
  for (var i = 1; i < size + 1; i++) {
    print("*" * i);
  }
}
