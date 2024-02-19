import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:riverpod_weather_app/features/search_city/data/model/city_serach_result.dart';

class FlagWidget extends StatelessWidget {
  const FlagWidget({
    super.key,
    required this.results,
  });

  final Results? results;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl:
          'https://flagsapi.com/${results?.countryCode}/shiny/64.png',
      width: 64,
      height: 64,
      errorWidget: (context, url, error) => const Center(
        child: Icon(
          Icons.error,
          color: Colors.red,
        ),
      ),
      progressIndicatorBuilder: (context, url, progress) =>
          const Center(
        child: CircularProgressIndicator.adaptive(),
      ),
    );
  }
}
