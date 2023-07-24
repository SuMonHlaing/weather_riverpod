import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:dio/dio.dart';

Provider<Dio> DioProvider = Provider((ref) {
  Dio dio = Dio();
  return dio;
});
