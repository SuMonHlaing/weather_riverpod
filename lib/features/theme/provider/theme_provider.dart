import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_weather_app/features/theme/provider/theme_state.dart';

class ThemeNotifier extends Notifier<WeatherTheme> {
  final WeatherTheme _weatherTheme = LightTheme();
  @override
  build() {
    return _weatherTheme;
  }

  void chageTheme(WeatherTheme weatherTheme) {
    state = weatherTheme;
  }
}

NotifierProvider<ThemeNotifier, WeatherTheme> themeProvider = NotifierProvider(
  () => ThemeNotifier(),
);
