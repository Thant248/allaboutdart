import 'package:dio/dio.dart';
import 'package:flutter_frontend/model/MChannel.dart';
import 'package:retrofit/http.dart';

part 'm_channel_service.g.dart';

@RestApi()
abstract class MChannelService {
  factory MChannelService(Dio dio) => _MChannelService(dio);

  @POST('http://localhost:8001/m_channels')
  Future<void> createMChannel(
      @Body() Map<String, dynamic> body, @Header('Authorization') String token);

  @DELETE('http://localhost:8001/m_channels/{channelID}')
  Future<void> deleteChannel(
      @Part() int channelID, @Header('Authorization') String token);

  @PATCH('http://localhost:8001/m_channels/{channelId}')
  Future<String> updateChannel(@Path() int channelId,
      @Body() Map<String, dynamic> body, @Header('Authorization') String token);

  @GET('http://localhost:8001/channeluserjoin')
  Future<String> joinChannel(@Query('channel_id') int channelId,
      @Header('Authorization') String token);
}
