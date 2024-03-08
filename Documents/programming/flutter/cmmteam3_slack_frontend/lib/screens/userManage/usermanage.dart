import 'package:flutter/material.dart';
import 'package:flutter_frontend/componnets/Nav.dart';
import 'package:flutter_frontend/model/SessionStore.dart';
import 'package:flutter_frontend/model/dataInsert/user_management_store.dart';
import 'package:flutter_frontend/progression.dart';
import 'package:flutter_frontend/services/directMessage/provider/direct_message_provider.dart';
import 'package:flutter_frontend/services/userservice/api_controller_service.dart';
import 'package:flutter_frontend/services/userservice/usermanagement/user_management_service.dart';
import 'package:provider/provider.dart';
import 'package:dio/dio.dart';

class UserManagement extends StatefulWidget {
  const UserManagement({Key? key});

  @override
  State<UserManagement> createState() => _UserManagementState();
}

class _UserManagementState extends State<UserManagement> {
  late UserManagementService userManagementService;

  @override
  void initState() {
    super.initState();
    userManagementService = UserManagementService(Dio());
    WidgetsBinding.instance?.addPostFrameCallback((timeStamp) {
      Provider.of<DirectMessageProvider>(context, listen: false).getAllUsers();
    });
  }

  Future<String?> getToken() async {
    return await AuthController().getToken();
  }

  @override
  Widget build(BuildContext context) {
    // int userLength = SessionStore.sessionData!.mUsers!.length.toInt();
    int? userId;

    return Scaffold(
      backgroundColor: const Color(0xFF92AFE6),
      appBar: AppBar(
        backgroundColor: const Color(0xFF3860EF),
        leading: GestureDetector(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const Nav(),
                ));
          },
          child: const Icon(Icons.arrow_back),
        ),
        title: const Text("User Manage", style: TextStyle(color: Colors.white)),
      ),
      body: Consumer<DirectMessageProvider>(
        builder: (context, value, child) {
          if (value.isLoading) {
            return const ProgressionBar(
              imageName: 'aboydatasending.json',
              height: 200,
              size: 200,
            );
          } else if (value.userManagement == null ||
              value.userManagement!.mUsers == null ||
              value.userManagement!.mUsers!.isEmpty) {
            return const ProgressionBar(
              imageName: 'nodatahasFounded.json',
              height: 200,
              size: 200,
            );
          } else {
            int userLength = value.userManagement!.mUsers!.length;

            return ListView.builder(
              itemCount: userLength,
              itemBuilder: (context, index) {
                int userIds = value.userManagement!.mUsers![index].id!.toInt();

                bool? isAdmin = value.userManagement!.mUsers![index].admin;
                bool? isMemberStatus =
                    value.userManagement!.mUsers![index].memberStatus;
                String userName =
                    value.userManagement!.mUsers![index].name.toString();
                String email =
                    value.userManagement!.mUsers![index].email.toString();

                return ListTile(
                  leading: Container(
                    height: 50,
                    width: 50,
                    color: Colors.red.shade600,
                    child: Center(
                      child: Text(
                        userName.characters.first.toUpperCase(),
                        style: const TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  title: Text(
                    userName,
                    style: const TextStyle(color: Colors.white),
                  ),
                  subtitle: Text(
                    email,
                    style: const TextStyle(
                      color: Color.fromARGB(144, 255, 255, 255),
                    ),
                  ),
                  trailing: isAdmin == true
                      ? null
                      : Switch(
                          value: isMemberStatus ?? false,
                          onChanged: (value) async {
                            setState(() {
                              userId = userIds;
                            });
                            var token = await  getToken();
                            await userManagementService.deactivateUser(
                                userId!, token!);
                            // ignore: use_build_context_synchronously
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const UserManagement(),
                              ),
                            );
                          },
                        ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
