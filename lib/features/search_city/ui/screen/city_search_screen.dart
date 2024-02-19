import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_weather_app/features/search_city/data/model/city_serach_result.dart';
import 'package:riverpod_weather_app/features/search_city/provider/city_search_provider.dart';
import 'package:riverpod_weather_app/features/search_city/provider/state/city_search_state.dart';
import 'package:riverpod_weather_app/features/search_city/ui/widget/city_list_widget.dart';
import 'package:riverpod_weather_app/features/theme/provider/theme_provider.dart';
import 'package:riverpod_weather_app/features/theme/provider/theme_state.dart';

class CitySearchScreen extends ConsumerStatefulWidget {
  const CitySearchScreen({super.key});

  @override
  ConsumerState<CitySearchScreen> createState() => _CitySearchScreenState();
}

class _CitySearchScreenState extends ConsumerState<CitySearchScreen> {
  final TextEditingController _cityController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final citySearchState = ref.watch(citySearchProvider);
    final provider = ref.read(citySearchProvider.notifier);
    final weatherTheme = ref.watch(themeProvider);
    final weatherProvider = ref.watch(themeProvider.notifier);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Riverpod Lesson'),
        actions: [
          Switch(
              value: (weatherTheme is DarkTheme),
              onChanged: (value) {
                if (value) {
                  weatherProvider.chageTheme(DarkTheme());
                } else {
                  weatherProvider.chageTheme(LightTheme());
                }
              })
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                  suffixIcon: IconButton(
                    icon: const Icon(
                      Icons.search,
                    ),
                    onPressed: () {
                      String city = _cityController.text.trim();
                      if (city.isEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text('Please enter a city')));
                      } else {
                        provider.searchCity(city);
                      }
                    },
                  ),
                  border: const OutlineInputBorder(),
                  labelText: 'Enter city name'),
              controller: _cityController,
            ),
            Expanded(child: _citySearchResultWidget(citySearchState))
          ],
        ),
      ),
    );
  }

  Widget _citySearchResultWidget(CitySearchState citySearchState) {
    return Center(
      child: switch (citySearchState) {
        CitySearchForm() => const Text('Enter search a city '),
        CitySearchLoading() => const CircularProgressIndicator(),
        CitySearchSuccess(
          citySearchResult: CitySearchResult citySearchResult
        ) =>
          CityListWidget(
            citySearchResult: citySearchResult,
          ),
        CitySearchFail(errorMessage: String error) => Text(error.toString())
      },
    );
  }
}
