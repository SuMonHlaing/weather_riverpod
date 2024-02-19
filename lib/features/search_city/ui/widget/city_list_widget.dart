import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_weather_app/features/search_city/data/model/city_serach_result.dart';
import 'package:riverpod_weather_app/features/search_city/ui/widget/flag_widget.dart';

class CityListWidget extends StatelessWidget {
  const CityListWidget({super.key, required this.citySearchResult});
  final CitySearchResult citySearchResult;

  @override
  Widget build(BuildContext context) {
    List<Results>? cities = citySearchResult.results;
    return ListView.builder(
        itemCount: cities?.length ?? 0,
        itemBuilder: (context, position) {
          Results? results = cities?[position];
          return Column(
            children: [
              InkWell(
                onTap: () {
                  context.push('/current', extra: {
                    'lati': results.latitude?.toString(),
                    'longi': results.longitude?.toString(),
                    'city':results.name
                  });
                },
                child: Card(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(results!.name ?? ''),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(results.country ?? ''),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(results.admin1 ?? ''),
                          )
                        ],
                      ),
                      FlagWidget(results: results),
                    ],
                  ),
                ),
              ),
            ],
          );
        });
  }
}
