void main() {
  
  String name = "pone pone";

  String namae = "thant";

  int n = name.length; 

  String lower = name.toLowerCase();

  String upper = name.toUpperCase();


  print(n);
  print(lower);
  print(upper);


  print(name.trim()); // white space
  print(name.trimRight());
  print(name.endsWith("pone"));

  print("My name is $namae");
  print("My name is ${name.toUpperCase()}");



}