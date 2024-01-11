//then
//catch
//future

import 'dart:async';

import 'dart:io';

void main() {
  getString().then((data) => print(data));
  getString().then((data) {
    if (data == "chit") {
      print(data);
    } else {
      print("Error");
    }
  });
  //catching error using future
  getString()
      .then((value) => print(value))
      .catchError((e) => print("error has been occurred"));

  print("First task 1");
  print("First task 2");
  print("First task 3");
}

Future<String> getString() {
  String name = "pone";
  //  return Future.delayed(Duration(seconds: 1), () => name);

  return Future.error(Exception(IOException));
}
