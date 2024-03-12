import 'package:dio/dio.dart';
import 'package:flutter_frontend/model/confirm.dart';
import 'package:retrofit/http.dart';

part 'confirm_invitation_service.g.dart';

@RestApi()
abstract class ConfirmInvitationService {
  factory ConfirmInvitationService(Dio dio) => _ConfirmInvitationService(dio);

  @POST('http://127.0.0.1:8001/m_users')
  Future<void> invitationConfirm(@Body() Map<String, dynamic> requestBody);

  @GET('http://127.0.0.1:8001/confirminvitation')
  Future<Confirm> getConfirmData(@Query('channelid') int channelid,
      @Query('email') String email, @Query('workspaceid') int workspaceid);
}
