void main() {
  Monkey m = Monkey();
  m.fruit = "banana";
  m.type = "monkey";
  m.cute = false;
  m.info();
  m.isCute();
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
  String? cut ;
  void isCute() {
    print("This $type is not $cute");
  }
}

class Cat extends Monkey {
}
class Mouse{}

// class Tiger extends  Monkey, Mouse{} //multi inheritance didnt allow in dart
