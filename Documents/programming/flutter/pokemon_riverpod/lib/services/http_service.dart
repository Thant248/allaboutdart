import 'package:dio/dio.dart';

class HttpService {
  HttpService();

  final dio = Dio();

  Future<Response?> getRequest(String url) async {
    try {
      Response response = await dio.get(url);
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
