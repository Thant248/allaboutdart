part of 'search_country_bloc.dart';

@immutable
abstract class SearchCountryEvent {}

class SearchCountry extends SearchCountryEvent{
  final String name;

  SearchCountry(this.name);
}
