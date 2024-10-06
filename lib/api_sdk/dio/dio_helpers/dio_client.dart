import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'dio_client.g.dart';

@RestApi(baseUrl: "https://dummyjson.com")
abstract class DioClient {
  factory DioClient(Dio dio, {String baseUrl}) = _DioClient;

  @GET("/products")
  Future<dynamic> fetchProducts();
}
