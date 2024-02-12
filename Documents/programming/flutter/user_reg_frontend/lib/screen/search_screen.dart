import 'package:flutter/material.dart';
import 'package:user_reg_frontend/controller/user_api_service.dart';
import 'package:dio/dio.dart';
import 'package:user_reg_frontend/model/user_model.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _searchController = TextEditingController();
  final UserApiService _userApiService = UserApiService(Dio());
  List<User> userList = [];

  @override
  void initState() {
    super.initState();
    // Initialize userList with all users
    _getAllUsers();
  }

  void _getAllUsers() async {
    // Fetch all users from the API
    try {
      final List<User> users = await _userApiService.getAllUsers();
      setState(() {
        userList = users;
      });
    } catch (e) {
      print('Error fetching users: $e');
    }
  }

  void _searchUsers(String query) async {
    // Fetch users matching the search query from the API
    try {
      final List<User> users = await _userApiService.getByName(query);
      setState(() {
        userList = users;
      });
    } catch (e) {
      print('Error searching users: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          controller: _searchController,
          decoration: InputDecoration(
            hintText: 'Search users',
            suffixIcon: IconButton(
              icon: Icon(Icons.search),
              onPressed: () {
                final String query = _searchController.text.trim();
                if (query.isNotEmpty) {
                  _searchUsers(query);
                } else {
                  _getAllUsers();
                }
              },
            ),
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: userList.length,
        itemBuilder: (context, index) {
          final User user = userList[index];
          return ListTile(
            title: Text('${user.fname} ${user.lname}'),
            subtitle: Text(user.address.toString()),
            // Add more user details as needed
          );
        },
      ),
    );
  }
}
