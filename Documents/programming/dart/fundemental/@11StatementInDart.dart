void main() {
  //if else switch


    var day = DateTime.now();
    print(day.weekday);

    List<dynamic> dob = [1, 2, 3, 4, 5, 6, 7]; // 1= monday 2 = tue , 3 = wed,  4 = thu, 5 = fri,  6 = sat, 7 = sun
    var length = dob.length;
    

    if( day.weekday == dob[length - 1] || day.weekday== dob[length - 2] ){

      print("now , you can rest  abit");

    }else {
  
      print("work hard until friday night");
    }    


// if else 

    int a = 4;
    int b = 5;

    if (a == b) {
      print("same amount");
    }else if( a >= b){

      print("a is greater than b");
        
    }else if ( a <= b){

        print(" b is greater than a");
    }

    //switch case 

    var dates = DateTime.now();

      switch(dates.weekday){
        case 1:
          print("Today is Monday");
          break;
        case 2:
          print("Today is Tuesday");
          break;
        case 3:
          print("Today is Wedensday");
          break;
        case 4:
          print("Today is Thusday");
          break;
        case 5:
          print("Today is Friday. You did it mate.TGIF");
          break;
        case 6:
          print("Today is Sat");
          break;
        case 7:
          print("Today is Sunday");
          break;
        default:
          break;
      }

      
}