void main() {
  

  // set stored as undored list
  // set must be unique

  Set numberSet = {1,2,3,4,5,1,1};

  Set numberSet1 = {6,7,8,...numberSet}; //... state htain

  numberSet.map((e) => print(e));
  print(numberSet); // it will print 1,2,3,4,5 and last 2 index wont be able to print becuase we are using set 
  print(numberSet1.remove(numberSet1.length-1));
  print(numberSet1);

  numberSet1.forEach((element) {print(element);}); // for each using arrow function 


}