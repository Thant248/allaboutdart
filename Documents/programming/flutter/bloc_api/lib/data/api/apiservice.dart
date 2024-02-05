import 'package:bloc_api/data/model/contact.dart';
import 'package:retrofit/http.dart';
import 'package:dio/dio.dart';

part 'apiservice.g.dart';

@RestApi(baseUrl: 'https://65bf384b25a83926ab94a485.mockapi.io/api')
abstract class ApiService {
  factory ApiService(Dio dio) => _ApiService(dio);

  @GET('')
  Future<List<Contact>> getContact();

  @POST('')
  Future<Contact> addContact(@Body() Contact contact);

  @PUT('{id}')
  Future<Contact> updateContact(@Path() id, @Body() Contact contact);

  @DELETE('{id}')
  Future<Contact> deleteContact(@Path() int id);
}
