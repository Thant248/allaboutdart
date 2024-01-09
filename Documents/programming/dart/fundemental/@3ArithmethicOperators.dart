void main() {
  

  // + - -expr  * / -/ %

print(2 + 3 == 5);
print(2 - 3 == -1);
print(2 * 3 == 6);
print(5 / 2 == 2.5); // Result is a double
print(10 ~/ 2 == 5); // Result is an int //sar lo ya tae sar lat
print(5 % 2 == 1); // Remainder


//increment and decrement operators.

int a;
int b;

a = 0;
b = ++a; // Increment a before b gets its value.
assert(a == b); // 1 == 1

a = 0;
b = a++; // Increment a after b gets its value.
assert(a != b); // 1 != 0

a = 0;
b = --a; // Decrement a before b gets its value.
assert(a == b); // -1 == -1

a = 0;
b = a--; // Decrement a after b gets its value.


//Equality and relational operators
// == != > < >= <=  

int d = 5;
int c = 6;

print(d == c); // result is false  == operation is clasify they are equal or not;
print(d != c); //result is true =! not equal
print(d > c); //result is false
print(d < c); //result is true
print(d <= 5); //result is true <= greater than equal check both that variable is equal 5 or greater
print(c >= 5); //result is true >= less than equal check both that variable is equal 5 or less


//type test operator

// as is !is


int intType = 9 ;
String stringType  = "thant";



if( intType is int){
    print("i am integer");
}

if(stringType is String) {
  print("I am String");
}

if( intType is! double){
    print("i am not  double");
}

if(stringType is! int) {
  print("I am not int");
}


  //as 

  // Example with the 'as' operator in Dart
  dynamic myObject = "Hello, world!";

  // Try casting the object to a String using the 'as' operator
  String? myString = myObject as String?;

  // Check if the cast was successful
  if (myString != null) {
    print("Casting successful: $myString");
  } else {
    print("Casting failed.");
  }

  //Conditional expressions 
  // in other languages its called tenary operator
  String? name;
  String namae = "thant";
  String playerName(String? name) => name != null ? name : 'Guest';

  print(playerName(name));
  print(playerName(namae));

}