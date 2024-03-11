import 'package:dio/dio.dart';

import 'package:retrofit/http.dart';

part'confirm_service.g.dart';

@RestApi()
abstract class ConfirmService {
  factory ConfirmService(Dio dio) => _ConfirmService(dio);

  @POST('http://127.0.0.1:8001/m_users')
  Future<void> confirmInvitation(@Body() Map<String, dynamic> requestBody);
}
