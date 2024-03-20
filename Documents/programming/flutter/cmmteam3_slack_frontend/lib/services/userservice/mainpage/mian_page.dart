import 'package:dio/dio.dart';
import 'package:flutter_frontend/model/SessionState.dart';
import 'package:retrofit/http.dart';

part 'mian_page.g.dart';

@RestApi(baseUrl: 'http://192.168.100.100:8001/main')
abstract class MainPageService {
  factory MainPageService(Dio dio) => _MainPageService(dio);

  @GET('')
  Future<SessionData> mainPage(@Header('Authorization') String token);

}
