import 'package:namer2/const/api_const.dart';
import 'package:namer2/model/country_model.dart';
import 'package:retrofit/http.dart';

@RestApi(baseUrl: ApiConst.baseUrl )
abstract class CountryApiService {
  Future<List<CountryModel>> getAllCountry();
}
