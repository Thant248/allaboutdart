void main() {
  Teacher tea = Teacher();
  tea
    ..sapporu()
    ..name()
    ..address()
    ..education();
}

//An abstract class is a guideline created for the derived concrete classes.
// There must at least be a single abstract method, which provides the implementation for the non-abstract methods as well.
// The moment of indifference arises if you define an abstract class with implementation,
// then you might need to consider whether going with the interface would be a better choice.
//Concrete methods are methods that are declared in an abstract class and are implemented in the subclass.
//All methods that are mentioned in the interface are public and abstracts implicitly.
// Abstract classes can even contain non-abstract methods. They can both have the methods and variables,
// and neither one can be instantiated.
// All the variables declared within an interface are final,
//while an abstract class might contain non-final variable

abstract class Person {
  void name(); // concrete method
  void education();
  String address();

  void sapporu() {
    print("school ma lar");
  }
}
// abstract class ko inheritance yu mal so yin ma phit ma nay override lote pay ya par tal
class Teacher extends Person {
  @override
  String address() {
    return "Kalay";
  }

  @override
  void education() {
    print("KaLay Uni");
  }

  @override
  void name() {
    print("Pone Pone");
  }
}
