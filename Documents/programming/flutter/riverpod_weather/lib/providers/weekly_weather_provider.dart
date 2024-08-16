import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_weather/services/api_helper.dart';

final weeklyWeatherProvider = FutureProvider.autoDispose(
  (ref) {
    return ApiHelper.getWeeklyForecast();
  },
);
