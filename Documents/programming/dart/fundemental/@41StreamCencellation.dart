import 'dart:async';

StreamController streamController = StreamController();
StreamSink streamSink = streamController.sink; //stream data add
Stream stream = streamController.stream; //stream listener
void main() async {
  emit();
  stream.listen((event) {
    print(event);
  });
  await Future.delayed(Duration(seconds: 5));
  streamController.close();
}

void emit() async {
  for (int i = 0; i < 10; i++) {
    await Future.delayed(Duration(seconds: 1));
    
    if (streamController.isClosed) {
      break;
    } else {
      streamSink.add(i);
    }
  }
}
