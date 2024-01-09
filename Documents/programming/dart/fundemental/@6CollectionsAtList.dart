import 'dart:math';

void main() {
  

  //In Collections, There are three type such as list set map
  //this class will talk about list
  //list is store as sorted 

    List list = [1,2,3,4,5];

    List variousType = [2, "pone", true, 4.45];  // List lo write htar yin kyite tae type twae htae lo ya par tal

    List<int> fixedVariable = [1,2,3,4]; // generic ko thone pi type set lote lite tae atwat
                                          //variousType tone ka lo kyite tar htae lo ma ya taw pr bu

    List<num> numType = [1,2,3,3.44, 4.56]; // as we know num is a interface of int and double thats why we can put both

    List<String> fixedStringType = ["Thant", "Pone", "Naing", "Kane", "Than", "Japan" ];

    var testing ;
    testing = list.elementAt(0); // itreate list index0 value

    List sampleList = []; // this is how you can add list
    sampleList.add("name");
    sampleList.add("め");
    sampleList.add("え");
    sampleList.add("げ");

    print(sampleList);

   
    const add  = <int, String> {1: "name",2: "pone" };


    fixedStringType.map((e) => {
        print(e)
    }).toList(); // map


    numType = numType.where((element) => (
        element is double
    )).toList();

    print(numType);
  
  


    print(list); 
    print(variousType);
    print(fixedVariable);
    print(numType);
    print(fixedStringType);
   
   print(testing);

   print(fixedStringType.contains("Thant"));
}