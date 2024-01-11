//stream so tar collection or iterator twae phit kya par tal
// list nae htoke pay lo par

void main() {
  Stream<int> number = countNuumber();
  number.listen((event) => print(
      event)); // listen keyword so tar num htae ka har twae ko pyan yu pya tae har par
}

Stream<int> countNuumber() async* {
  int i = 0; //async ka stream api type phit pay mae stream return type ka
  while (i <= 6) {
    Future.delayed(Duration(seconds: 2));
    yield i;
    i++;
  }

  //adds a value to the output stream of the surrounding async* function.
  // It's like return, but doesn't terminate the function.
}
