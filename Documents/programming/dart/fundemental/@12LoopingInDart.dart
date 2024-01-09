void main() {
  // for, for each, while, do while, for in
  // dont ask me which method is faster its depend on you

  //if you have to say "sorry" to your gf use this code instead of typing 1000 times

  int times = 10000;
  int time = 10;

  for (int i = 0; i <= time; i++) {
    print("$i. sorry ");
  }

  // for each

  Map map = {"name": 2, "thant": 3, "sin": 4};

  map.forEach((key, value) {
    print("$key is $value");
  });

  List list = [1, 2, 3, 4, 5];
  list.forEach((element) {
    print(element);
  });

  //while
  // while only work if condition is true
  // do while is not like that do while work at least one time even while conditional is false

  String smth = "dart is hard";
  int i = 0;
  while (i <= 10) {
    // print(smth);
    i++;
  }

  //do while
  int f = 0;
  do {
    print(smth);
  } while (f >= 10);
  {
    // print(smth);
    f++;
  }

  //for in
  //imperative -> how to
  // declerative -> what to do

  List inn = [1, 2, 3, 4, 6];

  for (int i in inn) {
    print(i);
  }
//time different
  for (int g = 0; g <= inn.length; g++) {
    print(inn);
  }

// loop control state using continue and break

  int q = 0;

  for (q = 0; q <= 5; q++) {
    print(q);
    /* if (q == 4) {
      break; // use break keywork when you want to break
    }
    */

    if (q == 4) {
      continue; // even tho q equal 4 it will continue print till q == 5
    }
  }
}
