void main() {
  // late Person p1 = Person();
  
  Person p = Person(); // if late  output is t c name is pone
  // if late wasnt there output will be name is t c pone
  print("t");
  print("c");
  p.showName();
}

//In Flutter, the late keyword is used to indicate that a non-nullable variable will be initialized later in the code.
// if the non-nullable variable does not initialize before it using, it raised an error

class Person {
  late String
      name; // late so pi variable ko nout mha assigned lote lo ya par tal
  // assigned thay char lote pay pho lo par tal ma hote yin error throw par tal

  Person() {
    this.name = "pone";
    print("name is");
  }

  void showName() {
    print("$name");
  }
}
