import 'package:json_annotation/json_annotation.dart';
import 'package:rest_api_demo/model/countries.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

part 'apiService.g.dart';

@RestApi(baseUrl: 'https://restcountries.com/v3.1/')
abstract class ApiService {
  factory ApiService(Dio dio) = _ApiService;

  @GET('all')
  Future<List<Country>> getCountries();
}
