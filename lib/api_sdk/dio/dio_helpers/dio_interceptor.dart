import 'package:dio/dio.dart';
import 'package:pingolearn_assignment/shared/session_manager.dart';

import 'dio_exceptions.dart';

class DioInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.headers.addAll(getHeaders());
    super.onRequest(options, handler);
  }

  Map<String, dynamic> getHeaders() {
    return {
      "email": SessionManager.getEmail(),
      "auth_token": SessionManager.getAuthToken(),
    };
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    super.onResponse(response, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    _handleError(err);
    super.onError(err, handler);
  }

  String getErrorMessage(DioException err) {
    if (err.response != null) {
      if (err.response!.data is String) {
        return err.response!.data;
      } else if (err.response!.data['info'] != null) {
        return err.response!.data['info'];
      } else if (err.response!.data['exception'] != null) {
        return err.response!.data['exception'];
      } else if (err.response!.data['error'] != null) {
        return err.response!.data['error'];
      }
      return err.response!.data['message'];
    }
    return err.error.toString();
  }

  _handleError(DioException err) {
    String errorMsg = getErrorMessage(err);
    switch (err.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.receiveTimeout:
      case DioExceptionType.sendTimeout:
        throw TimeOutException(err.message!, err.requestOptions);
      case DioExceptionType.badResponse:
        switch (err.response?.statusCode) {
          case 400:
            throw BadRequestException(
              errorMsg,
              err.requestOptions,
            );
          case 401:
            throw UnauthorisedException(
              errorMsg,
              err.requestOptions,
            );
          case 403:
            throw UnauthorisedException(
              errorMsg,
              err.requestOptions,
            );
          case 404:
            throw FileNotFoundException(
              errorMsg,
              err.requestOptions,
            );
          case 500:
            throw InternalServerException(
              errorMsg,
              err.requestOptions,
            );
          case 502:
            throw BadGateWayException(
              errorMsg,
              err.requestOptions,
            );
          case 503:
            throw BadGateWayException(
              errorMsg,
              err.requestOptions,
            );
        }
        break;
      case DioExceptionType.unknown:
        throw ConnectionException(
          'Please check your network connection',
          err.requestOptions,
        );
      default:
        throw err;
    }
  }
}
