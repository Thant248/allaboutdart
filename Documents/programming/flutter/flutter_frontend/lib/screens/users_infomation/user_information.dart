import 'package:flutter/material.dart';
import 'package:flutter_frontend/controller/user_controller_service.dart';

import 'package:dio/dio.dart';
import 'package:flutter_frontend/model/user_create.dart';

class UserInformation extends StatefulWidget {
  const UserInformation({super.key});

  @override
  State<UserInformation> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<UserInformation> {
  UserService _userService = UserService(Dio());
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<User>>(
      future: _userService.getAllUsers(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (snapshot.hasError) {
          return Center(
            child: Text('Error: ${snapshot.error}'),
          );
        } else if (!snapshot.hasError || snapshot.data!.isEmpty) {
          return const Text('No Data Available');
        } else {
          return ListView.builder(
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              User user = snapshot.data![index];
              return ListTile(
                title: Text(user.email.toString()),
              );
            },
          );
        }
      },
    );
  }
}
