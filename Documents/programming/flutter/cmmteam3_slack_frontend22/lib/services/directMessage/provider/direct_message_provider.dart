import 'package:flutter/material.dart';
import 'package:flutter_frontend/model/direct_message.dart';
import 'package:flutter_frontend/model/user_management.dart';
import 'package:flutter_frontend/services/directMessage/direct_message_api.dart';
import 'package:flutter_frontend/services/userservice/user_management.dart';

class DirectMessageProvider extends ChangeNotifier {
  final DirectMessageService _service = DirectMessageService();
  bool isLoading = false;
  DirectMessages? directMessages;
  final UserManagementService _userManagementService = UserManagementService();
  UserManagement? userManagement;

  // Future<void> getAllMessages(int userId) async {
  //   isLoading = true;
  //   notifyListeners();

  //   final response = await _service.getAllDirectMessage(userId);
  //   directMessages = response;
  //   isLoading = false;
  //   notifyListeners();
  // }

  Future getAllUsers() async {
    isLoading = true;
    notifyListeners();

    final response = await _userManagementService.getAllUsers();
     userManagement = response;
    isLoading = false;
    notifyListeners();
  }
}
