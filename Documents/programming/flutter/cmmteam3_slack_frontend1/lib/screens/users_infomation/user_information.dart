import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:flutter_frontend/model/user_model.dart';
import 'package:flutter_frontend/services/userservice/api_controller_service.dart';
import 'package:flutter_frontend/services/userservice/user_controller_service.dart';

class UserInformation extends StatefulWidget {
  const UserInformation({Key? key}) : super(key: key);

  @override
  State<UserInformation> createState() => _UserInformationState();
}

class _UserInformationState extends State<UserInformation> {
  late UserService _userService;
  bool _isLoading = true;
  List<User> _users = [];

  @override
  void initState() {
    super.initState();
    // Retrieve token from SharedPreferences
    AuthController().getToken().then((token) {
      if (token != null) {
        // Initialize UserService with token
        _userService = UserService(Dio(), token: token);
        // Fetch users data
        _fetchUsersData();
      } else {
        setState(() {
          _isLoading = false;
        });
      }
    });
  }

  Future<void> _fetchUsersData() async {
    try {
      // Fetch users data
      List<User> users = await _userService.getAllUsers();
      setState(() {
        _users = users;
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _isLoading = false;
      });
      print('Error fetching users data: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User Information'),
      ),
      body: _isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : _users.isEmpty
              ? const Center(
                  child: Text('No Data Available'),
                )
              : ListView.builder(
                  itemCount: _users.length,
                  itemBuilder: (context, index) {
                    User user = _users[index];
                    return ListTile(
                      title: Text(user.mUser.name ?? ''),
                      subtitle: Text(user.mUser.email ?? ''),
                      // Add other user information fields as needed
                    );
                  },
                ),
    );
  }
}
