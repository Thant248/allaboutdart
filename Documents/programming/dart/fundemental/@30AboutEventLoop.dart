//event loop normal works twae ka ayin lote lote tal
// pi mha event loop
// micro task  queue
// event queue
//single thread 

import 'dart:async';

void main() {
  print("ui work 1");
  scheduleMicrotask(() => print("small heavy test 1"));
  Future(() => print("heavy work1"));

  print("ui work 2");
  scheduleMicrotask(() => print("small heavy test 2"));
  Future(() => print("heavy work2"));

  print("ui work 3");
  scheduleMicrotask(() => print("small heavy test 3"));
  Future(() => print("heavy work3"));
}
