import 'package:bloc_api/controller/job_service_api.dart';
import 'package:bloc_api/model/job_model.dart';
import 'package:bloc_api/screens/post_screen.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<HomeScreen> {
  JobApiService _apiService = JobApiService(Dio());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Hello Job'),
        leading: const Icon(Icons.home),
      ),
      body: FutureBuilder<List<Job>>(
        future: _apiService.getAllJobs(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
                child:
                    CircularProgressIndicator()); // Show a loading indicator while data is being fetched
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Text('No data available');
          } else {
            // Display your data here using snapshot.data
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                return ListTile(
                    title: Text(snapshot.data![index].job.toString()),
                    leading: Text(snapshot.data![index].name.toString()),
                    subtitle: Text(snapshot.data![index].age.toString()),
                    onTap: () => _deleteJob(snapshot.data![index].id.toString())

                    // Add more fields as needed
                    );
              },
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const PostScreen(),
                ));
          },
          child: const Icon(Icons.add)),
    );
  }

  Future<void> _deleteJob(String jobId) async {
    try {
      await _apiService.deleteJobs(jobId);
      print('Job deleted successfully');
      // Reload the job list after deletion
      setState(() {});
    } catch (e) {
      print('Error deleting job: $e');
    }
  }
}
