import 'package:equatable/equatable.dart';
import 'package:sweet_shop_d/features/order/data/model/order_model.dart';

class OrderResEntity extends Equatable {
  String? status;
  int? results;
  List<DocOrder>? doc;

  OrderResEntity(
      {required this.status, required this.results, required this.doc});

  @override
  List<Object?> get props => [results, status, doc];
}
