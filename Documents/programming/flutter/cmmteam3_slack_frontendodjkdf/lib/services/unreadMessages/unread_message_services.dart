import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
import 'package:flutter_frontend/model/UnreadMsg.dart';

part 'unread_message_services.g.dart';

@RestApi(baseUrl: 'http://localhost:8001/allunread')
abstract class UnreadMessageService {
  factory UnreadMessageService(Dio dio) => _UnreadMessageService(dio);

  @GET('')
  Future<UnreadMsg> getAllUnreadMsg(
      @Query('user_id') int userId, @Header('Authorization') String token);
}
