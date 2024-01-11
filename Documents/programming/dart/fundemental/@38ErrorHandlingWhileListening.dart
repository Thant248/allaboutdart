import 'dart:async';

StreamController<int> stc = StreamController();
void main() {
  Stream<int> stream = stc.stream;
  countNumber(12).listen((event) {
    print(event);
  });

  stream.listen((num) => print(num),
      onError: (e) => print(e),
      cancelOnError: true,
      onDone: () => print("all done"));
}

Stream<num> countNumber(int num) async* {
  for (int i = 0; i <= num; i++) {
    await Future.delayed(Duration(milliseconds: 200));
    stc.sink.add(i);
    yield i;
  }
  yield* countNumber(num - 1);
}
