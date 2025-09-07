import 'dart:developer';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sweet_shop_d/core/error/failure.dart';
import 'package:sweet_shop_d/core/strings/failure.dart';
import 'package:sweet_shop_d/features/order/domain/usecase/get_all_order_com_usecase.dart';
import 'package:sweet_shop_d/features/order/domain/usecase/get_all_order_pen_usecase.dart';
import 'package:sweet_shop_d/features/order/presentation/bloc/order%20bloc/order_event.dart';
import 'package:sweet_shop_d/features/order/presentation/bloc/order%20bloc/order_state1.dart';

class OrderBloc extends Bloc<OrderEvent, OrderState1> {
  final GetAllOrdersComUC getAllOrderComUC;
  final GetAllOrdersPenUC getAllOrderPenUC;

  OrderBloc({required this.getAllOrderComUC, required this.getAllOrderPenUC})
      : super(OrderInitial()) {
    on<OrderEvent>((event, emit) async {
      if (event is GetAllOrderComEvent) {
        emit(LoadingOrderComState1());
        final ordersCom = await getAllOrderComUC(event.driverId, event.st);
        print("||||||||||||||||||||ordersCom $ordersCom");
        ordersCom.fold((failure) {
          print("FFFFFFFFF      $failure ");
          emit(ErrorOrderComState1(errMsg: _mapFailureType(failure)));
        }, (orders) {
          log("order >>>> $orders");

          emit(LoadedOrderComState1(orders: orders));
        });
      }

      if (event is GetAllOrderPenEvent) {
        emit(LoadingOrderPenState1());
        final ordersPen = await getAllOrderPenUC();
        print("||||||||||||||||||||ordersPen $ordersPen");
        ordersPen.fold((failure) {
          print("FFFFFFFFF      $failure ");
          emit(ErrorOrderPenState1(errMsg: _mapFailureType(failure)));
        }, (orders) {
          log("order >>>> $orders");

          emit(LoadedOrderPenState1(orders: orders));
        });
      }
    });
  }

  String _mapFailureType(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return SERVER_FAILURE_MESSAGE;

      case EmptyFailure:
        return SERVER_FAILURE_MESSAGE;

      case OfflineFailure:
        return SERVER_FAILURE_MESSAGE;

      default:
        return "Unexpcted Error";
    }
  }
}
