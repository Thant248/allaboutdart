part of 'search_country_bloc.dart';

@immutable
abstract class SearchCountryState {}

class SearchCountryInitial extends SearchCountryState {}

class SearchCountryLoading extends SearchCountryState {}

class SearchCountrySuccess extends SearchCountryState {
  final List<CountryModel> countryList;

  SearchCountrySuccess(this.countryList);
}

class SearchCountryFail extends SearchCountryState {
  final String errorMessage;

  SearchCountryFail(this.errorMessage);
}
