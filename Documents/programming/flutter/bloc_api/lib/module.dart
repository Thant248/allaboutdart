import 'package:bloc_api/bloc/get/cubit/getcontact_cubit.dart';
import 'package:bloc_api/data/api/apiservice.dart';
import 'package:bloc_api/data/contact_repository.dart';
import 'package:get_it/get_it.dart';
import 'package:dio/dio.dart';

var getit = GetIt.I;
void locator() {
  Dio dio = Dio();
  getit.registerLazySingleton(() => dio);

  ApiService apiService = ApiService(getit.call());
  getit.registerLazySingleton(() => apiService);

  ContactRepository contactRepository = ContactRepository(getit.call());

  getit.registerLazySingleton(() => contactRepository);

  GetContactCubit getContactCubit = GetContactCubit(getit.call());

  getit.registerLazySingleton(() => getContactCubit);
}
