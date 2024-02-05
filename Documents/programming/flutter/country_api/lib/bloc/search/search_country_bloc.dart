import 'dart:async';

import 'package:country_api/api/model/country_model.dart';
import 'package:country_api/api/service/country_api_service.dart';
import 'package:meta/meta.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:rxdart/rxdart.dart';

part 'search_country_event.dart';

part 'search_country_state.dart';

class SearchCountryBloc extends Bloc<SearchCountryEvent, SearchCountryState> {
  final CountryApiService _countryApiService =
      CountryApiService(Dio()..interceptors.add(PrettyDioLogger()));

  SearchCountryBloc() : super(SearchCountryInitial()) {
    //Myanmar
    on<SearchCountryEvent>((event, emit) async {
      if (event is SearchCountry) {
        String name = (event).name;
        if (name.isEmpty) {
          emit(SearchCountryInitial());
        } else {
          emit(SearchCountryLoading());
          try {
            List<CountryModel> countryList =
                await _countryApiService.searchCountry(name: name);
            emit(SearchCountrySuccess(countryList));
          } catch (e) {
            emit(SearchCountryFail(e.toString()));
          }
        }
      }
    }, transformer: (event, mapper) {
      return event
          .debounceTime(const Duration(milliseconds: 500))
          .asyncExpand(mapper);
    });
  }
}
