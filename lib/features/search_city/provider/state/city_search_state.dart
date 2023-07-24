import 'package:riverpod_weather_app/features/search_city/data/model/city_serach_result.dart';

sealed class CitySearchState {}

class CitySearchLoading extends CitySearchState {}
class CitySearchForm extends CitySearchState {}


class CitySearchSuccess extends CitySearchState {
  final CitySearchResult citySearchResult;

  CitySearchSuccess(this.citySearchResult);
}

class CitySearchFail extends CitySearchState {
  final String errorMessage;

  CitySearchFail(this.errorMessage);
}
