import 'package:bloc_api/main.dart';
import 'package:flutter/material.dart';
import 'package:bloc_api/model/job_model.dart';
import 'package:bloc_api/controller/job_service_api.dart';
import 'package:dio/dio.dart';

class PostScreen extends StatefulWidget {
  const PostScreen({Key? key}) : super(key: key);

  @override
  State<PostScreen> createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String? _name, _job, _age;

  void _submitForm() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      // Create a Job instance with the entered data
      Job job = Job(name: _name!, job: _job!, age: _age!);

      // Use the JobApiService to post the job
      try {
        await JobApiService(Dio()).postJobs(job);
        // If the request is successful, you can handle the success here
         Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => const MyApp()));
      } catch (e) {
        // Handle the error if the request fails
        print('Error posting job: $e');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Add Jobs'),
          leading: FloatingActionButton(
              child: Icon(Icons.add),
              onPressed: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => const MyApp()));
              }),
        ),
        body: Form(
          key: _formKey,
          child: ListView(
            padding: EdgeInsets.all(10),
            children: [
              TextFormField(
                decoration: const InputDecoration(
                    border: OutlineInputBorder(), hintText: 'Enter Your Name'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Please Enter Your Name";
                  }
                  return null;
                },
                onSaved: (newValue) {
                  this._name = newValue;
                },
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                decoration: const InputDecoration(
                    border: OutlineInputBorder(), hintText: 'Enter Your Age'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Please Enter Your age";
                  }
                  return null;
                },
                onSaved: (newValue) {
                  this._age = newValue;
                },
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                decoration: const InputDecoration(
                    border: OutlineInputBorder(), hintText: 'Enter Your Job'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Please Enter Your Job";
                  }
                  return null;
                },
                onSaved: (newValue) {
                  this._job = newValue;
                },
              ),
              const SizedBox(
                height: 10,
              ),
              ElevatedButton(
                onPressed: _submitForm,
                child: Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
