void main() {
  // why we use tenaryoperator ? its fucking good xD
  int a = 9;

  if (a.isEven) {
    print("a is even number");
  } else {
    print("a is prime number");
  }

  int b = 8;

  //you can measure which method is fast at time complexity by looking
  //condition  ? if true  : false statement
  (b.isEven) ? print("a is even number") : print("a is prime number");

  String? tena;

  if (tena == null) {
    print("tena is null do some push up you noob");
  } else {
    print("good job . but you have to learn fast");
  }

  //tenary operator

    (tena == null) ? print("null null nulll") :  print("cant believe you did this");
}
