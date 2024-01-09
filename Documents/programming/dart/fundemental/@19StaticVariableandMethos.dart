void main() {
  //static variable and instance variable kwar char chat ka
  // static the class apaw twin depend lote pi shi tha mhya kar la pat lone name htae ka variable ko thr assigned lote pi
  //instance variable myar thi sout lite thay object apaw twin mhi kho ywae pyg ll tat kya the
  //although instance variable cant assigned in static methods/variable but static can assign 
  People p = People();
  p.behaviour = "can walk";
  p.state = "have legs";

  People p1 = People();
  p1.behaviour = "can eat";
  p1.state = "have mouth";

  print("People ${p.state} that's why they ${p.behaviour}");
  print("People ${p1.state} that's why they ${p1.behaviour}");

  People.name = "pone pone lay";
  print(People.name);

  People.naming("pone");
}

class People {
  static String name = "pone pone <3";
  String? behaviour;
  String? state;

  static String study() {
    return "she is studying";
  }

  // out  par static method twin tha di htar ya mi mar static method twin static variable ko thr use lo ya mi so tr par pal

  // static void age() {
  //   print($state);
  // }

//static method can only be used static variable
  static void age() {
    print('$name');
  }

  static String naming(String name) {
    return "my name is $name";
  }
}
