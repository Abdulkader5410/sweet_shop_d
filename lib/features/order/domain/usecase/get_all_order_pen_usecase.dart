import 'package:dartz/dartz.dart';
import 'package:sweet_shop_d/core/error/failure.dart';
import 'package:sweet_shop_d/features/order/domain/dom_repo/order_dom_repo.dart';
import 'package:sweet_shop_d/features/order/domain/entity/order_res_entity.dart';

class GetAllOrdersPenUC {
  late final OrderDomRepo ordersDomRepo;

  GetAllOrdersPenUC({required this.ordersDomRepo});

  Future<Either<Failure, OrderResEntity?>> call() async {
    return await ordersDomRepo.getAllOrdersPen();
  }
}
