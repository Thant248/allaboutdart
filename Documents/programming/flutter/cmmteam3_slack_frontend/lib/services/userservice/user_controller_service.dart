import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
import 'package:flutter_frontend/model/user_model.dart'; // Import your user model

part 'user_controller_service.g.dart';

@RestApi(baseUrl: "http://127.0.0.1:8001/m_users")
abstract class UserService {
  factory UserService(Dio dio, {String? token}) {
    dio.options.headers['Authorization'] = 'Bearer $token';
    return _UserService(dio);
  }

  @GET('/3')
  Future<List<User>> getAllUsers();

  @POST('')
  Future<User> createUser(@Body() User user);
}
