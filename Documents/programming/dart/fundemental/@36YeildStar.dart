void main() {
  getNumber(12).listen((event) {
    print(event);
  })
    ..onDone(() {
      print('done');
    }) //onDOne ka akone pi mha alote lote
    ..onError((e) => print(e));
}

Stream<int> getNumber(int number) async* {
  // recursive  function ko use chin yin yeild* ko use par
  if (number > 0) {
    yield number;
    await Future.delayed(Duration(seconds: 2));
    if (number == 5) {
      throw Exception("Error");
    }
    yield* getNumber(number - 1);
  }
}
