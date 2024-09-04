import 'package:bloc_provider/data/model/signin_req_params.dart';
import 'package:bloc_provider/data/model/signup_req_params.dart';
import 'package:bloc_provider/data/model/user.dart';
import 'package:bloc_provider/data/source/auth_api_service.dart';
import 'package:bloc_provider/data/source/auth_local_service.dart';
import 'package:bloc_provider/domain/repository/auth.dart';
import 'package:dartz/dartz.dart';
import 'package:bloc_provider/service_locator.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthRepositoryImpl implements AuthRepository{
  @override
  Future<Either> getUser() async  {
    
    Either result = await sl<AuthApiService>().getUser();
    return result.fold((error){
      return Left(error);
    }, (data) async {
      Response response = data;
      var userModel = UserModel.fromMap(response.data);
      var UserEntity = userModel.toEntity();
      return Right(UserEntity);
    });
  }

  @override
  Future<bool> isLoggedIn() async {
    return await sl<AuthLocalService>().isLoggedIn();
  }

  @override
  Future<Either> logout() async {
    return await sl<AuthLocalService>().logout();
  }

  @override
  Future<Either> signUp(SignupReqParams signupReq) async {
    
    Either result = await  sl<AuthRepository>().signUp(signupReq);
    return result.fold((error){
      return Left(error);
    }, (data) async {
      Response response = data;
      SharedPreferences sharedPreferences =  await SharedPreferences.getInstance();
      sharedPreferences.setString('token', response.data['token']);
      return Right(response);
    });
  }

  @override
  Future<Either> signin(SigninReqParams signinReq) async {
    
    Either result = await sl<AuthRepository>().signin(signinReq);
    return result.fold((error){
      return Left(error);
    }, (data) async {
      Response response = data;
      SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
      sharedPreferences.setString('token', response.data['token']);
      return Right(response);
    });
  }
  
}