import 'package:equatable/equatable.dart';

sealed class OrderEvent extends Equatable {
  const OrderEvent();

  @override
  List<Object> get props => [];
}

class GetAllOrderComEvent extends OrderEvent {
  String driverId;
  String st;
  GetAllOrderComEvent({required this.driverId, required this.st});
  @override
  List<Object> get props => [];
}

class GetAllOrderPenEvent extends OrderEvent {
  const GetAllOrderPenEvent();
  @override
  List<Object> get props => [];
}
