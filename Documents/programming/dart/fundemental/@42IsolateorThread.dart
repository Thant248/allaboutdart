import 'dart:isolate';

void main() {
  Isolate.spawn(work1, 10);
  work2(10);
  print("Main Function ${Isolate.current.debugName}");
}

void work1(int num) {
  print("Work1 ${Isolate.current.debugName} isolate");
  for (int i = 0; i < num; i++) {
    print("work1 is $i");
  }
}

void work2(int num) {
  print("Work2 ${Isolate.current.debugName} isolate");
  for (int i = 0; i < num; i++) {
    print("work2 is $i");
  }
}
