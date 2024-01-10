void main() {
  // Monkey m = Monkey();
  // m.fruit = "banana";
  // m.type = "monkey";
  // m.cute = false;
  // m.info();
  // m.isCute();
  // Cat c =  Cat();
  // c.isCute();
  // c.eat();


    
}

// inheritance mean away sate khan tar
// in dart language you cant multiple inheritance if you want to use mix
// parent ka nay child ko assign lote lo ya tal
//child ko parent mar assign ma ya cast lote lo ma ya
class Animal {
  String? type;
  String? fruit;

  void eat() {
    print("$type");
  }

  void info() {
    print("This $type likes $fruit");
  }
}

class Monkey extends Animal {
  bool? cute;
  String? cut;
  void isCute() {
    print("This $type is not $cute");
  }
}

class Cat extends Monkey {}

//method override lote tal so tar parent class ka method ko yu thone tar phit par tal
// inheritance lote lite lo ya lar tae har twae ko , ko ka ma lo chin tar shi yin pyin lo ya par tal
class Mouse extends Cat {
  @override
  void isCute() {
    print("this doesnt belong to parten this is from  child ");
  }

  @override
  void eat() {
    print("hi");
  }
}

// class Tiger extends  Monkey, Mouse{} //multi inheritance didnt allow in dart
