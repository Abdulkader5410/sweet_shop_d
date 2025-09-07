import 'package:dartz/dartz.dart';
import 'package:sweet_shop_d/core/error/failure.dart';
import 'package:sweet_shop_d/features/order/domain/dom_repo/order_dom_repo.dart';
import 'package:sweet_shop_d/features/order/domain/entity/order_res_entity.dart';

class GetAllOrdersComUC {
  late final OrderDomRepo ordersDomRepo;

  GetAllOrdersComUC({required this.ordersDomRepo});

  Future<Either<Failure, OrderResEntity?>> call(
    String driverId, String st) async {
    return await ordersDomRepo.getAllOrdersCom(driverId,st);
  }
}
