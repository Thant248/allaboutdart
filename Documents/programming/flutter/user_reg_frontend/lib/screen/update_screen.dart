import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

import 'package:user_reg_frontend/controller/user_api_service.dart';
import 'package:user_reg_frontend/model/user_model.dart';
import 'package:user_reg_frontend/screen/home_screen.dart';

class EditScreen extends StatefulWidget {
  final User user;
  const EditScreen({Key? key, required this.user}) : super(key: key);

  @override
  State<EditScreen> createState() => _EditScreenState();
}

class _EditScreenState extends State<EditScreen> {
  final TextEditingController _controllerfName = TextEditingController();
  final TextEditingController _controllerlName = TextEditingController();
  final TextEditingController _controllerAge = TextEditingController();
  final TextEditingController _controllerEmail = TextEditingController();
  final TextEditingController _controllerPhone = TextEditingController();
  final TextEditingController _controllerAddress = TextEditingController();
  UserApiService _userApiService = UserApiService(Dio());

  @override
  void initState() {
    super.initState();
    // Set initial values to the text controllers
    _controllerfName.text = widget.user.fname ?? '';
    _controllerlName.text = widget.user.lname ?? '';
    _controllerAge.text = widget.user.age?.toString() ?? '';
    _controllerEmail.text = widget.user.email ?? '';
    _controllerPhone.text = widget.user.phone ?? '';
    _controllerAddress.text = widget.user.address ?? '';
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          leading: const Icon(Icons.edit),
          title: const Text('Edit User Information'),
          backgroundColor: Colors.lightBlue,
        ),
        body: Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: _controllerfName,
                decoration: InputDecoration(
                  hintText: 'First Name',
                ),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: _controllerlName,
                decoration: InputDecoration(
                  hintText: 'Last Name',
                ),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: _controllerAge,
                decoration: InputDecoration(
                  hintText: 'Age',
                ),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: _controllerEmail,
                decoration: InputDecoration(
                  hintText: 'Email',
                ),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: _controllerPhone,
                decoration: InputDecoration(
                  hintText: 'Phone',
                ),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: _controllerAddress,
                decoration: InputDecoration(
                  hintText: 'Address',
                ),
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: () async {
                  await _updateUser();
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const HomeScreen(),
                    ),
                  );
                },
                child: const Text('Update'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _updateUser() async {
    try {
      User updatedUser = User(
        id: widget.user.id,
        fname: _controllerfName.text,
        lname: _controllerlName.text,
        age: int.tryParse(_controllerAge.text) ?? 0,
        email: _controllerEmail.text,
        phone: _controllerPhone.text,
        address: _controllerAddress.text,
      );
      await _userApiService.updateUser(widget.user.id!, updatedUser);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('User updated successfully')),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Failed to update user: $e'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }
}
