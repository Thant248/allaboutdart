void main() {
  // showTriple(number: 10, result: showResult);

  // showTriple(number: 10, result: (triple) => print("the result is $triple"));
  // showSquare(3);
  // var sq = showSquare;
  // sq(3);

  var sq = showSquare;
  var ss = sq(3);
  ss();
  showSquare(3)();
}

//if you put required that means highter
void showTriple({required int number, required Function(int) result}) {
  //function as a parameter
  int triple = number * 3;
  result(triple);
}

void showResult(int number) {
  print("The reuslt is $number");
}

showSquare(int number) {
  // int square = number * number;
  // return showResult(square);

  void square() => print("The result is ${number * number}");
  return square;
}
