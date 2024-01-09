void main() {
  //object creation
  //otherwise instantiation
  Student stu = new Student();
  stu.study();
  stu.age = 22;
  stu.name = "pone chit";
  stu.goal = "love"; // ref variable

  print("My name is ${stu.name} and i am ${stu.age} . i want to ${stu.goal}");

  Student mgmg = Student.study();
  print(mgmg);

  int  number = 0;
  Student mama = Student.choose(number);
}

// class is blueprint or prototype that can create method variable object is state and behaviour
class Student {
  String? name; // instance variable
  int? age;
  String? goal;

  Student() {
    print("this is constructor ");
  }

  void study() {
    //method
    print("i am method i am working");
  }

//dart mar default constructor apyin name constructor ko par sout lo ya par tal .study name ka small lo par tal
  Student.study() {
    print("Student is Studying");
  }

  Student.play() {
    print("student is playing");
  }
//factory constructor ko name constructor nae pal write ya par tal
  factory Student.choose(int st) {
    if (st == 0) {
      return Student.study();
    } else if(st == 1){
      return Student.play();
    }
    return Student();
  }
}
