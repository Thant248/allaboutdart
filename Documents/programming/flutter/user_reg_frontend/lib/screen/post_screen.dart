import 'dart:math';

import 'package:flutter/material.dart';
import 'package:user_reg_frontend/controller/user_api_service.dart';
import 'package:user_reg_frontend/main.dart';
import 'package:user_reg_frontend/model/user_model.dart';
import 'package:dio/dio.dart';

class PostScreen extends StatefulWidget {
  const PostScreen({super.key});

  @override
  State<PostScreen> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<PostScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String? fname, lname, email, phone, address;
  int? age;

  void _submitForm() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      User user = User(
          fname: fname,
          lname: lname,
          age: age,
          email: email,
          phone: phone,
          address: address);
      try {
        await UserApiService(Dio()).postUser(user);
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const MyApp(),
            ));
      } catch (error) {
        print('Error Posting User : $error');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          appBar: AppBar(
            leading: Icon(Icons.add),
            title: const Text('Add User'),
            backgroundColor: Colors.lightBlue,
          ),
          body: Form(
              key: _formKey,
              child: ListView(
                padding: const EdgeInsets.all(10),
                children: [
                  TextFormField(
                    autocorrect: true,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Enter Your FirstName'),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Please ReEnter Your FirstName";
                      }
                      return null;
                    },
                    onSaved: (newValue) {
                      this.fname = newValue;
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    autocorrect: true,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Enter Your LastName'),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Please ReEnter Your LastName";
                      }
                      return null;
                    },
                    onSaved: (newValue) {
                      this.lname = newValue;
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    keyboardType: TextInputType.number,
                    autocorrect: true,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Enter Your Age'),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Please ReEnter Your Age";
                      }
                      return null;
                    },
                    onSaved: (newValue) {
                      this.age = int.parse(newValue.toString());
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    autocorrect: true,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Enter Your Email'),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Please ReEnter Your Email";
                      }
                      return null;
                    },
                    onSaved: (newValue) {
                      this.email = newValue;
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    autocorrect: true,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Enter Your Phone'),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Please ReEnter Your Phone";
                      }
                      return null;
                    },
                    onSaved: (newValue) {
                      this.phone = newValue;
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    autocorrect: true,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Enter Your Address'),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Please ReEnter Your Address";
                      }
                      return null;
                    },
                    onSaved: (newValue) {
                      this.address = newValue;
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  ElevatedButton(
                      onPressed: _submitForm, child: const Icon(Icons.add))
                ],
              ))),
    );
  }
}
