import 'package:dio/dio.dart';
import 'package:flutter_frontend/model/user_create.dart';
import 'package:retrofit/http.dart';

part 'user_controller_service.g.dart';

@RestApi(baseUrl: "http://127.0.0.1:8001/m_users")
abstract class UserService {
  factory UserService(Dio dio) => _UserService(dio);

  @GET('/3')
  Future<List<User>> getAllUsers();

  // @POST('')
  // Future<User> createUser(@Body() User user);

  @POST('')
  Future<User> createUser(@Body() Map<String, dynamic> userData);
}
