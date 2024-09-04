import 'package:bloc_provider/core/usecases/usecase.dart';
import 'package:bloc_provider/domain/repository/auth.dart';
import 'package:dartz/dartz.dart';
import 'package:bloc_provider/service_locator.dart';


class LogoutUseCase implements UseCase<Either, dynamic> {
  @override
  Future<Either> call({param}) async  {
    return await sl<AuthRepository>().logout();
  }

}