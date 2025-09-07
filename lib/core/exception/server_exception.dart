
import 'package:sweet_shop_d/core/errors/error_model.dart';

class ServerException implements Exception {
  final ErrModel errorModel;

  ServerException({required this.errorModel});
}

class OfflineException implements Exception {}

class EmptyCacheException implements Exception {}
