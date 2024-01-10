void main() {
  UniStudent uni = UniStudent("pone");
}

class Person {
  Person(String namae) {
    print("i am human $namae");
  }
}

class Student extends Person {
  Student(String name) : super("smb") {
    print("i am from student $name");
  }
}
// super call ya chin mar inheritance yu lite thaw parent class twin shi constructor twin parameter par lo phit pr thi
class UniStudent extends Student {
  UniStudent(String name) : super(name) {
    print("i am from UniStudnet ");
  }
}
