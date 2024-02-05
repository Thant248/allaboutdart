part of 'country_list_bloc_cubit.dart';

abstract class CountryListBlocState {}

class CountryListBlocLoading extends CountryListBlocState {}

class CountryListBlocSuccess extends CountryListBlocState{
  final List<CountryModel> countryList;
  CountryListBlocSuccess(this.countryList);
}
class CountryListBlocFailed extends CountryListBlocState{
  final String error;
  CountryListBlocFailed(this.error);
}
