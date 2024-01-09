void main() {  

//nullable ? nulable type 

int? a; // local variable msut be assigned befor it can be used . ae lo akhar twae mhar ko ka null value pay htar chin tar akhar use par tal int?a
print(a);

List<String> notNll  = ["pone", "chit", "myo", "pone"]; // List<String> phit tae atwat null value assign lote lo ya mhar ma hote pr buu lote chin yin out ka har ko use ya mar phit par tal

List<String?> canNull = ["myo", "pone", "pone", null];

print(notNll);
print(canNull);

Map<int, String>  mapcantNull = {1: "thant", 2: "sin", 3: "phyoe"};

Map<int, String?>  mapcanNull = {1: "thant", 2: "sin", 3: null};

print(mapcanNull);

print(mapcantNull);

//optional type intreface and dynamic support

//type interface (var)
// dynamic (dynamic)

//dynamic is a keyword to assign a value in a variable with no type checking. 
//Object is the parent class of all classes in Dart and it can be used as a data type with type checking.



var name = "pone chit";
//name = 12; dynamic the kyite tae variable ko assigned lote lo ya pay mae
// var the assigned lote htr pi thay type arrr kyi ywae string so string double so double 
// boolean so bool hu that mhat lite thi atwat type ma tu thaw data myar assign lote ywae ya myi ma hote pr
print(name);

dynamic namae = "thants";

namae = true;
print(namae);



}