import 'package:dartz/dartz.dart';
import 'package:sweet_shop_d/core/error/failure.dart';
import 'package:sweet_shop_d/features/order/data/model/order_model.dart';

abstract class OrderDomRepo {
  Future<Either<Failure, OrderResModel?>> getAllOrdersCom(String driverId, String st);
  Future<Either<Failure, OrderResModel>> getAllOrdersPen();
}