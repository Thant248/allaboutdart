import 'package:bloc_api/bloc/get/cubit/getcontact_cubit.dart';
import 'package:bloc_api/module.dart';
import 'package:bloc_api/screen/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main(List<String> args) {
  locator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BlocProvider<GetContactCubit>(
        create: (context) => getit.call(),
        child: const Home(),
      ),
    );
  }
}
