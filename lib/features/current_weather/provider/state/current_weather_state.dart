import 'package:riverpod_weather_app/features/current_weather/data/model/current_weather_model.dart';

sealed class CurrentWeatherState {}

class CurrentWeatherLoadingState extends CurrentWeatherState {}

class CurrentWeatherSuccessState extends CurrentWeatherState {
  final CurrentWeatherModel currentWeatherModel;

  CurrentWeatherSuccessState(this.currentWeatherModel);
}

class CurrentWeatherFailState extends CurrentWeatherState {
  final String errorMessage;

  CurrentWeatherFailState(this.errorMessage);
}
