import 'dart:async';

import '../../common_export.dart';

class DataService {
  Future<dynamic> fetchProductData() async {
    await Future.delayed(const Duration(seconds: 1));
    final response = await ApiSdk.fetchProductsData();
    return response;
  }
}
