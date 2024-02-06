import 'package:bloc_testing/count_event.dart';
import 'package:bloc_testing/search_word_page.dart';
import 'package:flutter/material.dart';
import 'package:bloc_testing/counter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final CounterBloc _counterBloc = CounterBloc();

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Bloc Pattern'),
        ),
        body: channelList(),

        // body: Center(
        //   child: Row(
        //     mainAxisAlignment: MainAxisAlignment.center,
        //     children: [
        //       Column(
        //         mainAxisAlignment: MainAxisAlignment.center,
        //         children: [
        //           TextButton.icon(
        //             onPressed: () {
        //               _counterBloc.counterEventSink.add(IncreaseEvent());
        //             },
        //             icon: const Icon(Icons.add),
        //             label: const Text('Plus'),
        //           ),
        //         ],
        //       ),
        //       const SizedBox(width: 20),
        //       StreamBuilder<int>(
        //         stream: _counterBloc.count,
        //         initialData: 0,
        //         builder: (context, snapshot) {
        //           if (snapshot.data! <= 0) {
        //             return Text(
        //               '${snapshot.data}',
        //               style: TextStyle(fontSize: 24),
        //             );
        //           } else {
        //             return Text(
        //               '${snapshot.data}',
        //               style: const TextStyle(fontSize: 24),
        //             );
        //           }
        //         },
        //       ),
        //       const SizedBox(width: 20),
        //       Column(
        //         mainAxisAlignment: MainAxisAlignment.center,
        //         children: [
        //           TextButton.icon(
        //             onPressed: () {
        //               _counterBloc.counterEventSink.add(DecreaseEvent());
        //             },
        //             icon: const Icon(Icons.minimize),
        //             label: const Text('Minus'),
        //           ),
        //         ],
        //       ),
        //     ],
        //   ),
        // ),
      ),
    );
  }
}
