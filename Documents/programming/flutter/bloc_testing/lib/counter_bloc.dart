import 'dart:async';

import 'package:bloc_testing/count_event.dart';

class CounterBloc {
  int _counter = 0;

  CounterBloc() {
    _counterEventController.stream.listen((_mapeventTostate));
  }

  final StreamController<int> _counterStateController = StreamController<int>();

  StreamSink<int> get _inCount => _counterStateController.sink;

  Stream<int> get count => _counterStateController.stream;

  final StreamController<CounterEvent> _counterEventController =
      StreamController<CounterEvent>();

  StreamSink<CounterEvent> get counterEventSink => _counterEventController.sink;

  void _mapeventTostate(CounterEvent event) {
    if (event is IncreaseEvent) {
      _counter++;
    } else {
      _counter--;
    }
    _inCount.add(_counter);
  }

  void dispose() {
    _counterStateController.close();
    _counterEventController.close();
  }
}
