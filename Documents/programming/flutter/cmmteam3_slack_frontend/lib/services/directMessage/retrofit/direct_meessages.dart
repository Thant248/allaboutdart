import 'package:dio/dio.dart';
import 'package:flutter_frontend/model/direct_message.dart';
import 'package:retrofit/http.dart';

part 'direct_meessages.g.dart';

@RestApi()
abstract class ApiService {
  factory ApiService(Dio dio) => _ApiService(dio);

  @GET("http://localhost:8001/show/{userId}")
  Future<DirectMessages> getAllDirectMessages(
      @Path("userId") int userId, @Header('Authorization') String token);

  @POST('http://127.0.0.1:8001/directmsg')
  Future<void> sendMessage(@Body() Map<String, dynamic> requestBody,
      @Header('Authorization') String token);

  @GET('http://127.0.0.1:8001/star')
  Future<void> directStarMsg(@Query("user_id") int user_id,
      @Query("id") int messageId, @Query("s_user_id") int receiveUserId, @Header('Authorization') String token);
}
