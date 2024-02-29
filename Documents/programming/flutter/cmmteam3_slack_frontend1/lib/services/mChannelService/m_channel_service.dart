import 'package:dio/dio.dart';
import 'package:flutter_frontend/const/ApiConst.dart';
import 'package:flutter_frontend/model/MChannel.dart';
import 'package:retrofit/http.dart';

part 'm_channel_service.g.dart';

@RestApi(baseUrl: ApiConst.mCannel)
abstract class MChannelService {
  factory MChannelService(Dio dio) => _MChannelService(dio);

  @POST('')
  Future<MChannel> createMChannel(@Body() MChannel mChannel);
}
