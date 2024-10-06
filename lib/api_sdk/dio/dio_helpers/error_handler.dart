import 'package:dio/dio.dart';
import 'package:pingolearn_assignment/api_sdk/dio/dio_helpers/dio_exceptions.dart';

String getErrorMessage(exception) {
  if (exception is DioException) {
    return exception.error is DioExceptions
        ? (exception.error as DioExceptions).message
        : exception.error.toString();
  } else {
    return exception.toString();
  }
}
