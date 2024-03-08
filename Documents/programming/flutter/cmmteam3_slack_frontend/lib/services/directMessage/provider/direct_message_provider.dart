import 'package:flutter/material.dart';
import 'package:flutter_frontend/model/direct_message.dart';
import 'package:flutter_frontend/model/user_management.dart';
import 'package:flutter_frontend/services/userservice/api_controller_service.dart';
import 'package:flutter_frontend/services/userservice/usermanagement/user_management_service.dart';
import 'package:dio/dio.dart';

class DirectMessageProvider extends ChangeNotifier {
  // final DirectMessageService _service = DirectMessageService();
  bool isLoading = false;
  DirectMessages? directMessages;
  final UserManagementService _userManagementService =
      UserManagementService(Dio());
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
    var token = await AuthController().getToken();
    final response = await _userManagementService.getAllUser(token!);
    userManagement = response;
    isLoading = false;
    notifyListeners();
  }
}
