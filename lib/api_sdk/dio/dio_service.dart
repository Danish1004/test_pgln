import 'package:dio/dio.dart';

import 'dio_helpers/dio_client.dart';
import 'dio_helpers/dio_interceptor.dart';

class DioApi {
  DioApi._internal();

  static final _singleton = DioApi._internal();

  factory DioApi() => _singleton;

  static Dio createDio() {
    var dio = Dio(BaseOptions(
      receiveTimeout: const Duration(seconds: 90),
      connectTimeout: const Duration(seconds: 90),
      sendTimeout: const Duration(seconds: 90),
    ));

    dio.interceptors.addAll({
      DioInterceptor(),
    });
    return dio;
  }
}

class DioService {
  static fetchProducts() async {
    final client = DioClient(DioApi.createDio());
    final response = await client.fetchProducts();
    return response;
  }
}
