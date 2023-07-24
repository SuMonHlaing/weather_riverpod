import 'package:retrofit/retrofit.dart';
import 'package:riverpod_weather_app/common/const/api_const.dart';
import 'package:riverpod_weather_app/features/search_city/data/model/city_serach_result.dart';
import 'package:dio/dio.dart';
part 'city_search_service.g.dart';

@RestApi(baseUrl: ApiConst.citySearchBaseUrl)
abstract class CitySearchService {
  factory CitySearchService(Dio dio) => _CitySearchService(dio);
  @GET(ApiConst.citySearchEndPoint)
  Future<CitySearchResult> searchCity(
      {@Query('name') required String name,
      @Query('count') required int count,
      @Query('language') required String language,
      @Query('json') required String format});
}
