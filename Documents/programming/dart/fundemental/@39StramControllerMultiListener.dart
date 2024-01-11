//stream controller mar listen ko ta khar pal thone lo ya par tal
//multi listener twae amyar kyi phit chin yin taw asBroadcast so tae method ko use pay ya par tal

import 'dart:async';
//broadcast stream or hot Observe // dart mar so hot stream lo call par tal
StreamController stc = StreamController();
void main() async {
  Stream<dynamic> st =
      stc.stream.asBroadcastStream(); // to listen multiple listener
  emit();
  st.listen((event) {
    print("Listener 1 $event");
  });

  await Future.delayed(Duration(seconds: 2)); //asBroadcast so tae ta oo chin
  //si thee thant array htoke pay thwr tar myo ma hote pal
  //htoke thwar tae har twae ko listen tar par eg: zoom meeting
  st.listen((event) {
    print("Listener 2 $event");
  }); // output wil 1 => 0 , 1, 2, 3, 4, 5, 6, 6, 7, 9
  //2 => 6, 7, 8, 9

  await Future.delayed(Duration(seconds: 1));
   st.listen((event) {
    print("Listener 3 $event");
  }); // e => 9
}

void emit() async {
  for (int i = 0; i < 10; i++) {
    await Future.delayed(Duration(milliseconds: 300));
    stc.sink.add(i);
  }
}
