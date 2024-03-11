import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';

part 'member_invite.g.dart';

@RestApi(baseUrl: 'http://127.0.0.1:8001/memberinvite')
abstract class MemberInviteService {
  factory MemberInviteService(Dio dio) => _MemberInviteService(dio);

  @POST('')
  Future<void> memberinvitation(@Header('Authorization') String token,
      @Body() Map<String, dynamic> requestBody);
}
