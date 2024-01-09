void main() {
  

  //map stored unordered list 
  // index => key
  // key, value can stored

  Map memberMap = {1: "name", true: 1, 3.34: true, "c": false}; 

    print(memberMap[true]); // memberMap should key,vlaue if you want value then find with key thats is how map work

    Map<String, dynamic> memberMap2 = {"a": true, "b": false, "c": 3.44, "d": "Myanmar", "e": "Japan", "f": 12, "g": 34  };  //dynamic is a keyword to assign a value in a variable with no type checking.
    print(memberMap2["d"]);

    // how Object works vs dynamic 

    //dynamic is a keyword to assign a value in a variable with no type checking.
    // Object is the parent class of all classes in Dart and it can be used as a data type with type checking.
    

    memberMap.forEach((key, value) {
      print(key);
      print(value);
    });

  // just testing

    String test = "false";
   memberMap.forEach((key, value) {
    if(value == test){
      print(key);
    }else{
       print("cannot find");
    }
   });

}