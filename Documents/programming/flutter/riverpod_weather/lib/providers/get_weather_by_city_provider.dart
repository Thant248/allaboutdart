import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_weather/services/api_helper.dart';
import 'package:riverpod_weather/models/weather.dart';


final weatherByCityNameProvider = FutureProvider.autoDispose.family<Weather, String>((ref, String cityName) {
  return ApiHelper.getWeatherByCityName(cityName: cityName);
},);