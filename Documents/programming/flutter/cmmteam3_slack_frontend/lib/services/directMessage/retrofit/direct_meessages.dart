import 'package:dio/dio.dart';
import 'package:flutter_frontend/model/direct_message.dart';
import 'package:retrofit/http.dart';

part 'direct_meessages.g.dart';

@RestApi(baseUrl: "http://localhost:8001/show")
abstract class ApiService {
  factory ApiService(Dio dio) => _ApiService(dio);

  @GET("/{userId}")
  Future<DirectMessages> getAllDirectMessages(
      @Path("userId") int userId, @Header('Authorization') String token);
}
