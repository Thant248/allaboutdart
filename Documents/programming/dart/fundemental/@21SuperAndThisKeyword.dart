void main() {
  // Animal an = Animal();
  // an.food = "parent banana";
  // Monkey m = Monkey();

  aboutThisMethod method = aboutThisMethod();
}

class Animal {
  String? type;
  String? behaviour;
  String? food = "parent banana";

  void playing() {
    print("this $type is $behaviour");
  }

  void eating() {
    print("This $type love to eat $food");
  }
}

class Monkey extends Animal {
  //default constructor
  Monkey() {
    print("parent eating is ");
    super
        .eating(); // super lo write lite yin extend yu htar tae parent class ko yu thone tar par
    print("child eating is");
    eating();
    print(
        "this is from super ${super.food}"); // inheritance yu htar tae parent shi ka lo chin yin super use ya tal
    print("this is from child class $food");
  }

  @override
  String? type = "monkey";

  @override
  String? behaviour = "annoy";

  @override
  String? food = "banna";

  @override
  void playing() {
    print("this $type is $behaviour");
  }

  @override
  void eating() {
    print("this $type is $behaviour");
  }
}


//class ta khu mar local scope nae global scope so pi shi kya par tal
//class atwin htae mar pal create htar thaw variable myar ko global hu call pi
// method atwin htae ka variable myar ko local variable hu call kya par tal
// method atwin global variable myar ko use chin tae akhar this so thaw method ko use pay ya par tal

class aboutThisMethod {
  String? name = "Thants"; //global variable
  String? uni = "Dagon";  //global variable

  aboutThisMethod() {
    biography();
  }

  void biography() {
    String? name = "Pone chit"; //local variable
    String? uni = "Kalay Tech"; //local variable

    print("this is form local variable ");
    print("my name is $name i am from $uni");
    print("this is from global variable");
    print("my name is ${this.name} and i am from ${this.uni}");
  }
}
