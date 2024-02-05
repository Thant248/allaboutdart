import 'package:bloc_api/const/ApiConst.dart';
import 'package:bloc_api/model/job_model.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
part 'job_service_api.g.dart';

@RestApi(baseUrl: ApiConst.get)
abstract class JobApiService {
  factory JobApiService(Dio dio) => _JobApiService(dio);

  @GET('')
  Future<List<Job>> getAllJobs();

  @POST('')
  Future<Job> postJobs(@Body() Job job);

  @DELETE('/{id}')
  Future<Job> deleteJobs(@Path() String id);
}
