import 'package:bloc_provider/core/usecases/usecase.dart';
import 'package:bloc_provider/data/model/signup_req_params.dart';
import 'package:bloc_provider/domain/repository/auth.dart';
import 'package:bloc_provider/service_locator.dart';
import 'package:dartz/dartz.dart';

class SignupUseCase implements UseCase<Either, SignupReqParams> {
  @override
  Future<Either> call({SignupReqParams ? param}) async  {
    return sl<AuthRepository>().signUp(param!);
  }
  
}