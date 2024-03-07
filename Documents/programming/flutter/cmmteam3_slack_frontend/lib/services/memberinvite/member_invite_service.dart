import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';

part 'member_invite_service.g.dart';

@RestApi(baseUrl: 'http://localhost:8001/channeluserjoin')
abstract class MemberInviteServices {
  factory MemberInviteServices(Dio dio) => _MemberInviteServices(dio);

  @POST('')
  Future<void> memberinvite(
      @Header('Authorization') String token, @Body() Map<String, dynamic> body);
}
