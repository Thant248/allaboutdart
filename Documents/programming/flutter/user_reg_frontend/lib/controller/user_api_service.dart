import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
import 'package:user_reg_frontend/const/api_catcher.dart';
import 'package:user_reg_frontend/model/user_model.dart';

part 'user_api_service.g.dart';

@RestApi()
abstract class UserApiService {
  factory UserApiService(Dio dio) => _UserApiService(dio);

  @GET(ApiRecord.baseUrl)
  Future<List<User>> getAllUsers();

  @POST(ApiRecord.baseUrl)
  Future<User> postUser(@Body() User user);

  @DELETE('${ApiRecord.baseUrl}/{id}')
  Future<User> deleteUser(@Path() int id);

  @PUT('${ApiRecord.baseUrl}/{id}')
  Future<User> updateUser(@Path() int id, @Body() User user);

  @GET('${ApiRecord.search}')
  Future<List<User>> getByName(@Query('address') String address);
}
