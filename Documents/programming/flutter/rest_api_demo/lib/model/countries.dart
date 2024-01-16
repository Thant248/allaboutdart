import 'package:json_annotation/json_annotation.dart';

part 'countries.g.dart';

@JsonSerializable()
class Country {
  String name;
  String capital;
  String languages;
  Country(this.name, this.capital, this.languages);
  factory Country.fromJson(Map<String, dynamic> json) =>
      _$CountryFromJson(json);
}
