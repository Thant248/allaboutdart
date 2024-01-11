import 'dart:async';
import 'dart:math';

StreamController<int> streamController = StreamController(); // global
void main() {
  streamController.add(12);

  Stream<int> s = streamController.stream;

  s.listen((event) {
    print(event);
  })..onError((e) => print(e));

  streamController.add(
      13); //streamController thi global phit nay lo bal ka htae htae listen phit nay mar par
  streamController.sink.add(15);
  emit();
}

void emit() async {
  streamController.add(45);
  for (int i = 0; i < 5; i++) {
    await Future.delayed(Duration(seconds: 2));
    streamController.add(Random().nextInt(100));
    if (i == 3) {
      throw TimeoutException("time is running");
    }
  }
}
