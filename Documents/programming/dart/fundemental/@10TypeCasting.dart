void main() {
  
  int value  = 2;
  double value2= 2;
  //in dart nut shell there are two types of casting . safe casting smart casting

  //smart cast 
  //smart casting twin type ko ma sit taw pal ta khar tae twat thwar par tal 
  if ( value is int ){
    print(value2 * 2);
  }

  //safe cast
  // safe cast twin intValue htae ko win lar thaw value ar as int phint filter lote pi mha tar twat thwar par tal
  // benefit value the 3 value the double ll phit naing tha lo int ll phit naing lo int pal lo chin l osit thwar tar
  if (value is int){

      int intValue = value as int; // value2 ko thar use yin undandled exceptioon htwat lr mar par

      print(intValue * 3);
  }

}