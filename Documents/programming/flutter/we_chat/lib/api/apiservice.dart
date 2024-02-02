import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';
import 'package:we_chat/model/Post.dart';
part 'apiservice.g.dart';

@RestApi(baseUrl: 'https://jsonplaceholder.typicode.com/')
abstract class ApiService {
  factory ApiService(Dio dio) = _ApiService;

  @GET('posts')
  Future<List<Post>> getAllPosts();
}
