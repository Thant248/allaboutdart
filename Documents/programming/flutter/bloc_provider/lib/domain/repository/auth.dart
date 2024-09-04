import 'package:bloc_provider/data/model/signin_req_params.dart';
import 'package:bloc_provider/data/model/signup_req_params.dart';
import 'package:dartz/dartz.dart';

abstract class AuthRepository{

  Future<Either> signUp(SignupReqParams signupReq);
  Future<Either> signin(SigninReqParams signinReq);
  Future<bool> isLoggedIn();
  Future<Either> getUser();
  Future<Either> logout();
}