import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_weather_app/common/provider/dio/dio_provider.dart';
import 'package:riverpod_weather_app/features/current_weather/data/model/current_weather_model.dart';
import 'package:riverpod_weather_app/features/current_weather/data/service/current_weather_service.dart';
import 'package:riverpod_weather_app/features/current_weather/provider/state/current_weather_state.dart';
import 'package:dio/dio.dart';

class CurrentWeatherProvider extends Notifier<CurrentWeatherState> {
  final CurrentWeatherState _currentWeatherState = CurrentWeatherLoadingState();
  @override
  CurrentWeatherState build() {
    return _currentWeatherState;
  }

  late final Dio _dio = ref.read(DioProvider);
  void getWeather({required latitude, required longitude}) async {
    state = CurrentWeatherLoadingState();
    try {
      CurrentWeatherService currentWeatherService = CurrentWeatherService(_dio);
      CurrentWeatherModel currentWeatherModel =
          await currentWeatherService.getCurrentWeather(
              latitude: latitude, longitude: longitude, currentWeather: true);
      state = CurrentWeatherSuccessState(currentWeatherModel);
    } catch (e) {
      state = CurrentWeatherFailState(e.toString());
    }
  }
}

final currentWeatherProvider =
    NotifierProvider<CurrentWeatherProvider, CurrentWeatherState>(
        () => CurrentWeatherProvider());
