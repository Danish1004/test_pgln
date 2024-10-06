import 'dio/dio_service.dart';

class ApiSdk {
  static fetchProductsData() async {
    final response = await DioService.fetchProducts();
    return response;
  }
}
