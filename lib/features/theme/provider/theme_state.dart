import 'package:flutter/material.dart';

sealed class WeatherTheme {
  ThemeData getTheme();
}

class LightTheme extends WeatherTheme {
  @override
  ThemeData getTheme() {
    return ThemeData.light();
  }
}

class DarkTheme extends WeatherTheme {
  @override
  ThemeData getTheme() {
    return ThemeData.dark().copyWith(
      switchTheme: SwitchThemeData(
        thumbColor: MaterialStateProperty.resolveWith((value) {
          return Colors.white;
        }),
        trackColor: MaterialStateProperty.resolveWith(
          (value) {
            return Colors.grey;
          },
        ),
      ),
    );
  }
}
