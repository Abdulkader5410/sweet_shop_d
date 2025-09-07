import 'package:dartz/dartz.dart';
import 'package:sweet_shop_d/core/error/failure.dart';
import 'package:sweet_shop_d/core/errors/exceptions.dart';
// import 'package:sweet_shop_d/core/network/network_info.dart';
import 'package:sweet_shop_d/features/order/data/data_source/order_remote_data_source.dart';
import 'package:sweet_shop_d/features/order/data/model/order_model.dart';
import 'package:sweet_shop_d/features/order/domain/dom_repo/order_dom_repo.dart';

class OrderDataRepo extends OrderDomRepo {
  final OrderRemoteDataSource remoteDataSource;
  // final Networkinfo networkinfo;

  OrderDataRepo({
    // required this.networkinfo,
    required this.remoteDataSource,
  });

  @override
  Future<Either<Failure, OrderResModel?>> getAllOrdersCom(
      String driverId, String st) async {
    try {
      final remoteOrders = await remoteDataSource.getAllOrdersCom(driverId, st);

      return Right(remoteOrders);
    } on ServerDioException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, OrderResModel>> getAllOrdersPen() async {
    try {
      final remoteOrders = await remoteDataSource.getAllOrdersPen();

      return Right(remoteOrders!);
    } on ServerDioException {
      return Left(ServerFailure());
    }
  }
}
