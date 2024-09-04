import 'package:bloc_provider/core/usecases/usecase.dart';
import 'package:bloc_provider/data/model/signin_req_params.dart';
import 'package:bloc_provider/domain/repository/auth.dart';
import 'package:dartz/dartz.dart';
import 'package:bloc_provider/service_locator.dart';


class SigninUseCase implements UseCase<Either, SigninReqParams> {

  @override
  Future<Either> call({SigninReqParams ? param}) async {
    return sl<AuthRepository>().signin(param!);
  }
  
}