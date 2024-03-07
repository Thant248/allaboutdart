import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';

part 'api_controller_services.g.dart';

@RestApi(baseUrl: 'http://127.0.0.1:8001/login')
abstract class LoginService {
  factory LoginService(Dio dio) => _LoginService(dio);

  @POST('')
  Future<String> loginUser(@Body() Map<String, dynamic> body);
}
