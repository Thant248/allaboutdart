import 'package:flutter/material.dart';
import 'package:flutter_frontend/model/SessionStore.dart';
import 'package:flutter_frontend/model/dataInsert/user_management_store.dart';
import 'package:flutter_frontend/progression.dart';
import 'package:flutter_frontend/services/directMessage/provider/direct_message_provider.dart';
import 'package:flutter_frontend/services/userservice/user_management.dart';
import 'package:provider/provider.dart';

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
    userManagementService = UserManagementService();
    WidgetsBinding.instance?.addPostFrameCallback((timeStamp) {
      Provider.of<DirectMessageProvider>(context, listen: false).getAllUsers();
    });
  }

  @override
  Widget build(BuildContext context) {
    // int userLength = SessionStore.sessionData!.mUsers!.length.toInt();
    int? userId;

    final MaterialStateProperty<Icon?> thumbIcon =
        MaterialStateProperty.resolveWith<Icon?>(
      (Set<MaterialState> states) {
        if (states.contains(MaterialState.selected)) {
          return const Icon(Icons.check);
        }
        return const Icon(Icons.close);
      },
    );
    return Scaffold(
      backgroundColor: const Color(0xFF92AFE6),
      appBar: AppBar(
        backgroundColor: const Color(0xFF3860EF),
        leading: GestureDetector(
          onTap: () {
            return Navigator.pop(context);
          },
          child: const Icon(Icons.arrow_back),
        ),
        title: const Text("User Manage", style: TextStyle(color: Colors.white)),
      ),
      body: Consumer<DirectMessageProvider>(
        builder: (context, value, child) {
          int userLength = value.userManagement!.mUsers!.length.toInt();
          if (value.isLoading) {
            return const ProgressionBar(
              imageName: 'aboydatasending.json',
              height: 200,
              size: 200,
            );
          } else if (value.userManagement == null) {
            return const ProgressionBar(
              imageName: 'nodatahasFounded.json',
              height: 200,
              size: 200,
            );
          } else if (userLength == 0) {
            return const ProgressionBar(
              imageName: 'nodatahasFounded.json',
              height: 200,
              size: 200,
            );
          } else {
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
                    value!.userManagement!.mUsers![index].email.toString();
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
                        color: Color.fromARGB(144, 255, 255, 255)),
                  ),
                  trailing: isAdmin == true // If user is admin
                      ? null // Return null, which effectively disables the Switch
                      : Switch(
                          value: isMemberStatus ?? false,
                          thumbIcon: thumbIcon,
                          onChanged: (value) async {
                            setState(() {
                              userId = userIds;
                            });
                            await userManagementService.deactivateUser(userId!);
                            // ignore: use_build_context_synchronously
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const UserManagement(),
                                ));
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
