void main() {
  /*AddNumber(4, 5);*/
  String name = "pone chit";
  int age = 22;
  String education = "Kalay Uni";
  String address = "Yangon";
  String goal = "good developer";
  String bio = myBiographys(name, age, education, address, goal);
  print(bio);
  /* print(bio); */
  // int la = 15000000;
  // int month = 12;
  // int rate = 5;

  // print(totalPeryear(la, rate, month));

  // var y = DateTime.now();
  // int myo = y.year;
  // var y2 = 2001;

  // var ages = myo - y2;
  // print(ages);

  biogoraphii(name: "Thant", age: 23);
}

void AddNumber(int n, int m) {
  int f = n + m;
  print(f);
}

//return type function

String myBiography(
    String name, int age, String education, String address, String goal) {
  String bio =
      "My name is $name and I am $age years old. I am from $education. Currently, I live in $address. I want to become $goal";
  /* return "My name is $name and I am $age years old. I am from $education. Currently, I live in $address. I want to become $goal";*/ //i extract the code
  return bio;
}

double yearly(int la, int rate) {
  double decimalRate = rate / 100;
  double year = la * decimalRate;
  return year;
}

double monthly(int la, int rate, int month) {
  double year = yearly(la, rate);
  double monthly = year / month;
  return monthly;
}

double monthPerYear(int la, int month) {
  double mpy = la / month;
  return mpy;
}

double totalPeryear(int la, int rate, int month) {
  double total = monthly(la, rate, month) + monthPerYear(la, month);
  return total;
}

//arrow function

String myBiographys(
        String name, int age, String education, String address, String goal) =>
    "My name is $name and I am $age years old. I am from $education. Currently, I live in $address. I want to become $goal";
// we can use required at string
void biogoraphii(
    {required String? name,
    required int? age,
    String? education,
    String? address,
    String? goal}) {
  print("my name is $name");
  print("i am  $age");
  print("i am graudated from $education");
  print("I live in $address");
  print("i dont have goal just go with $goal");
}
