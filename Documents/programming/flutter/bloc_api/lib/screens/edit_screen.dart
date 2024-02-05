import 'package:bloc_api/controller/job_service_api.dart';
import 'package:bloc_api/main.dart';
import 'package:bloc_api/model/job_model.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

class EditScreen extends StatefulWidget {
  const EditScreen({Key? key}) : super(key: key);

  @override
  State<EditScreen> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<EditScreen> {
  late Future<Job> _futerjob;
  // If you don't need the controller, you can remove it
  final TextEditingController _controller = TextEditingController();

  JobApiService _apiService = JobApiService(Dio());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _futerjob = _apiService.getJobById('10');
  }

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
          child: FutureBuilder<Job>(
            future: _futerjob,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                if (snapshot.hasData) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(snapshot.data!.name.toString()),
                      // If you want to allow editing, use the TextField with a controller
                      TextField(
                        controller: _controller,
                        decoration: const InputDecoration(
                          hintText: 'Enter Your Name',
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          // Use the controller.text for the updated name
                          Job updatedJob = Job(
                            id: snapshot.data!.id,
                            name: _controller.text, // Use the updated name
                            age: snapshot.data!.age,
                            job: snapshot.data!.job,
                          );
                        },
                        child: const Text('Update Data'),
                      ),
                    ],
                  );
                } else if (snapshot.hasError) {
                  return Text('${snapshot.error}');
                }
              }
              return const CircularProgressIndicator();
            },
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
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Failed to update job: $e'),
          backgroundColor: Colors.red,
        ),
      );
      throw e; // Rethrow the error to propagate it further if needed
    }
  }
}
