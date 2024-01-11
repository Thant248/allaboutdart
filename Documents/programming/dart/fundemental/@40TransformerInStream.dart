//transformer so tar ka htoke lite tae stream ko listener shi ma yout khin transform lote tar ko pyaw tar par

import 'dart:async';

StreamController<int> stc = StreamController();
void main() {
  Stream<int> stream = stc.stream.asBroadcastStream();
  emit();

  StreamTransformer<int, int> transformer = StreamTransformer.fromHandlers(
    handleData: (data, sink) {
      if (data % 2 == 0) {
        sink.add(data);
      }
    },
  ); //stramtransformer thone pi handle lote lo ya pr tal
  //listener mar taw trasnfor  so tar har htae pay ya prtal

  stream.transform(transformer).listen((event) {
    print("Listener 1 $event");
  });

  stream.map((event) => event * 2).listen((event) {
    print("Listener 2 $event");
  });
}

void emit() async {
  for (int i = 0; i < 6; i++) {
    await Future.delayed(Duration(seconds: 1));
    stc.sink.add(i);
  }
}
