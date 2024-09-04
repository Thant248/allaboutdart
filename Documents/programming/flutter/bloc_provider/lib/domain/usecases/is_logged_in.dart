import 'package:bloc_provider/core/usecases/usecase.dart';
import 'package:bloc_provider/domain/repository/auth.dart';
import 'package:bloc_provider/service_locator.dart';

class IsLoggedInUseCase implements UseCase<bool, dynamic> {
  @override
  Future<bool> call({param})  async {
    return await sl<AuthRepository>().isLoggedIn();
  }
  
}