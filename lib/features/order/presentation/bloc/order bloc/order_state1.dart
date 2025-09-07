import 'package:equatable/equatable.dart';
import 'package:sweet_shop_d/features/order/domain/entity/order_res_entity.dart';

sealed class OrderState1 extends Equatable {
  const OrderState1();

  @override
  List<Object> get props => [];
}

final class OrderInitial extends OrderState1 {}



//complete state
class LoadingOrderComState1 extends OrderState1 {
  @override
  List<Object> get props => [];
}

class LoadedOrderComState1 extends OrderState1 {
  final OrderResEntity? orders;

  const LoadedOrderComState1({required this.orders});
  @override
  List<Object> get props => [];
}

class ErrorOrderComState1 extends OrderState1 {
  final String errMsg;

  const ErrorOrderComState1({required this.errMsg});
  @override
  List<Object> get props => [];
}



//pending state

class LoadingOrderPenState1 extends OrderState1 {
  @override
  List<Object> get props => [];
}

class LoadedOrderPenState1 extends OrderState1 {
  final OrderResEntity? orders;

  const LoadedOrderPenState1({required this.orders});
  @override
  List<Object> get props => [];
}

class ErrorOrderPenState1 extends OrderState1 {
  final String errMsg;

  const ErrorOrderPenState1({required this.errMsg});
  @override
  List<Object> get props => [];
}
