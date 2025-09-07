import 'package:dio/dio.dart';
import 'package:sweet_shop_d/core/errors/error_model.dart';

class ServerDioException implements Exception {
  ErrModel errorModel;

  ServerDioException({required this.errorModel});
}

void handleEx(DioException e) {
  switch (e.type) {
    case DioExceptionType.badCertificate:
      throw ServerDioException(errorModel: ErrModel.fromJson(e.response!.data));

    case DioExceptionType.connectionTimeout:
      throw ServerDioException(errorModel: ErrModel.fromJson(e.response!.data));

    case DioExceptionType.cancel:
      throw ServerDioException(errorModel: ErrModel.fromJson(e.response!.data));

    case DioExceptionType.connectionError:
      throw ServerDioException(errorModel: ErrModel.fromJson(e.response!.data));

    case DioExceptionType.receiveTimeout:
      throw ServerDioException(errorModel: ErrModel.fromJson(e.response!.data));

    case DioExceptionType.sendTimeout:
      throw ServerDioException(errorModel: ErrModel.fromJson(e.response!.data));

    case DioExceptionType.unknown:
      throw ServerDioException(errorModel: ErrModel.fromJson(e.response!.data));
    case DioExceptionType.badResponse:
      switch (e.response!.statusCode!) {
        case 400:
          print("${e.response!.data}");
        throw ServerDioException(
            errorModel: ErrModel.fromJson(e.response!.data));
        case 401:
          throw ServerDioException(
              errorModel: ErrModel.fromJson(e.response!.data));

        case 403:
          throw ServerDioException(
              errorModel: ErrModel.fromJson(e.response!.data));

        case 404:
          throw ServerDioException(
              errorModel: ErrModel.fromJson(e.response!.data));

        case 409:
          throw ServerDioException(
              errorModel: ErrModel.fromJson(e.response!.data));

        case 422:
          throw ServerDioException(
              errorModel: ErrModel.fromJson(e.response!.data));

        case 504:
          throw ServerDioException(
              errorModel: ErrModel.fromJson(e.response!.data));
      }
  }
}
