//whencomplete //timeout

import 'dart:io';

void main()  {
  getInt().then((value) => print(value))
          .catchError((e) => print(e))
          .whenComplete(() => print("completed"))
          .timeout(Duration(seconds: 3), onTimeout: () {
              print("time out baby");
          });
}

Future<String> getInt() {
  return Future.delayed(Duration(seconds: 14), () => throw IOException);
}
