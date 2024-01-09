void main() {
  //there are too many data types such as string double int num boolean Map Set List 

  String p = "pone chit";

  double d = 3;

  int i = 2;

  num n = 555; /// num could be both double or int


  print("My name is "+ p);

  print("i am "+d.toString()  + " years old"); //used toString coz double or int type cannot assigned in Strings only in dart

  print("i am in "+i.toString());  


  //if statement

  if(d is double){
    print("i am double");
  }

 
}