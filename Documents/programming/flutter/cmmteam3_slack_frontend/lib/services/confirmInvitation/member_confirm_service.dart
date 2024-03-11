import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';

part 'member_confirm_service.g.dart';

@RestApi()
abstract class MemberInvitationService {
  factory MemberInvitationService(Dio dio) => _MemberInvitationService(dio);

  @POST('http://127.0.0.1:8001/m_users')
  Future<void> confirmInvitation(@Body() Map<String, dynamic> requsetBody);
}
