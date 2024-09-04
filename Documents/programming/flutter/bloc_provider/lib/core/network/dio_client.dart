import 'package:bloc_provider/core/network/interceptors.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class DioClient {
  late final Dio _dio;

  DioClient()
      : _dio = Dio(BaseOptions(
            headers: {
              'Content-Type': 'application/json',
            },
            responseType: ResponseType.json,
            sendTimeout: const Duration(seconds: 10),
            receiveTimeout: const Duration(seconds: 10)))
          ..interceptors.addAll([LoggerInterceptor()]);

  // GET METHOD

  Future<Response> get(String url,
      {Map<String, dynamic>? queryParameters,
      Options? options,
      CancelToken? CancelToken,
      ProgressCallback? onReceiveProgress}) async {
    try {
      final response = await _dio.get(url,
          queryParameters: queryParameters,
          options: options,
          cancelToken: CancelToken,
          onReceiveProgress: onReceiveProgress);

      return response;
    } on DioException catch (e) {
      return e.response!;
    }
  }

  // POST METHOD
  Future<Response> post(
    String url, {
    data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? CancelToken,
    ProgressCallback? onSendProgress,
  }) async {
    try {
      final Response response = await _dio.post(
        url,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: CancelToken,
        onSendProgress: onSendProgress,
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }

  // PUT METHOD

  Future<Response> put(String url,
      {dynamic data,
      Map<String, dynamic>? queryParameters,
      Options? options,
      CancelToken? CancelToken,
      ProgressCallback? onSendProgress,
      ProgressCallback? onReceiveProgress}) async {
    try {
      final Response response = await _dio.put(
        url,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: CancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }

  // DELETE METHOD

  Future<dynamic> delete(String url,
      {dynamic data,
      Map<String, dynamic>? queryParameters,
      Options? options,
      CancelToken? CancelToken,
      ProgressCallback? onSendProgress,
      ProgressCallback? onReceiveProgress}) async {
    try {
      final Response response = await _dio.delete(
        url,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: CancelToken,
      );
    } catch (e) {
      rethrow;
    }
  }
}
