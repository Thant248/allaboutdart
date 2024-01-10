void main() {
  Subject sub = Subject();
  sub
    ..english()
    ..math()
    ..physics();
}

//The interface in the dart provides the user with the blueprint of the class,
// that any class should follow if it interfaces that class i.e.
// if a class inherits another it should redefine each function present inside an interfaced class in its way.
//They are nothing but a set of methods defined for an object.
// Dart doesn’t have any direct way to create inherited class, we have to make use of implements keyword to do so.
class English {
  void english() {}
  
}

class Math {
  void math() {}
}

class Physics {
  void physics() {}
}
//implements means darts interface
class Subject implements English, Math, Physics {
  @override
  void english() {
    print("learn English");
  }

  @override
  void math() {
    print("learn math");
  }

  @override
  void physics() {
    print("learn physics");
  }
}
