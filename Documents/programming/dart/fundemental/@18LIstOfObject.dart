void main() {
  Student student1 = new Student();
  student1.age = 22;
  student1.name = "pone chit";
  student1.uni = "kalay";

  Student student2 = new Student();
  student2.name = "Thants";
  student2.age = 23;
  student2.uni = "dagon";

  List<Student> studnets = [student1, student2];
  studnets.forEach((element) {
    // di method ko pal toString() method ko over ride ma lote htar pal ka Instance of studnet so pi output ya mar par
    print(element);
  });
}

class Student {
  String? name;
  int? age;
  String? uni;

  @override
  String toString() {
    return "my name is $name i am $age years old. I am from $uni";
  }
}
