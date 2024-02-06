import 'dart:js';

import 'package:bloc_api/controller/job_service_api.dart';
import 'package:bloc_api/main.dart';
import 'package:bloc_api/model/job_model.dart';
import 'package:bloc_api/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

class EditScreen extends StatefulWidget {
  final Job job;

  const EditScreen({Key? key, required this.job}) : super(key: key);

  @override
  State<EditScreen> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<EditScreen> {
  // Initialize controllers with existing data
  final TextEditingController _controllerName = TextEditingController();
  final TextEditingController _controllerAge = TextEditingController();
  final TextEditingController _controllerJob = TextEditingController();

  JobApiService _apiService = JobApiService(Dio());

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Edit Job'),
          leading: FloatingActionButton(
            child: Icon(Icons.add),
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const MyApp()),
              );
            },
          ),
        ),
        body: Container(
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              // Display the existing data
              Text(widget.job.name.toString()),
              TextField(
                controller: _controllerName,
                decoration: const InputDecoration(
                  hintText: 'Enter Name',
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(widget.job.age.toString()),
              TextField(
                controller: _controllerAge,
                decoration: const InputDecoration(
                  hintText: 'Enter Age',
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(widget.job.job.toString()),
              TextField(
                controller: _controllerJob,
                decoration: const InputDecoration(
                  hintText: 'Enter Job',
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              ElevatedButton(
                onPressed: () async {
                  // Capture edited data from controllers
                  Job updatedJob = Job(
                    id: widget.job.id,
                    name: _controllerName.text,
                    age: _controllerAge.text,
                    job: _controllerJob.text,
                  );

                  try {
                    await _updateJob(updatedJob);
                    // Only navigate if the update is successful
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const HomeScreen(),
                      ),
                    );
                  } catch (e) {
                    // Handle errors if the update fails
                    // You may want to show an error message to the user
                    print('Error updating job: $e');
                  }
                },
                child: const Text('Update Data'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<Job> _updateJob(Job updatedJob) async {
    try {
      var result =
          await _apiService.updateJobs(updatedJob.id.toString(), updatedJob);
      print('Success: $result');
      return result; // Return the updated job if needed
    } catch (e) {
      print('Error updating job: $e');
      // Provide feedback to the user about the error
      ScaffoldMessenger.of(context as BuildContext).showSnackBar(
        SnackBar(
          content: Text('Failed to update job: $e'),
          backgroundColor: Colors.red,
        ),
      );
      throw e; // Rethrow the error to propagate it further if needed
    }
  }
}
