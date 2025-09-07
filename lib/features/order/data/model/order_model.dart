import 'package:sweet_shop_d/features/order/domain/entity/order_entity.dart';
import 'package:sweet_shop_d/features/order/domain/entity/order_res_entity.dart';

class DocOrder extends DocOrderEntity {
  DocOrder({
    required super.id,
    required super.cart,
    required super.delivery,
    required super.duration,
    required super.location,
    required super.paid,
    required super.paidstatus,
    required super.status,
    required super.priceDelivery,
    required super.priceExtesion,
    required super.total,
    required super.withDelivery,
    required super.updatedAt,
    required super.user,
  });

  factory DocOrder.fromjson(Map<String, dynamic> jsonOrder) {
    return DocOrder(
      id: jsonOrder['_id'],
      cart: jsonOrder['cart'],
      delivery: jsonOrder['delivery'],
      duration: jsonOrder['duration'],
      location: jsonOrder['location'],
      paid: jsonOrder['paid'],
      paidstatus: jsonOrder['paidstatus'],
      status: jsonOrder['status'],
      priceDelivery: jsonOrder['priceDelivery'],
      priceExtesion: jsonOrder['priceExtesion'],
      total: jsonOrder['total'],
      withDelivery: jsonOrder['withDelivery'],
      updatedAt: jsonOrder['updatedAt'],
      user: jsonOrder['user'],
    );
  }
}

class OrderResModel extends OrderResEntity {
  OrderResModel(
      {required super.doc, required super.results, required super.status});
  factory OrderResModel.fromjson(Map<String, dynamic> jsonCateg, bool isCom) {
    return OrderResModel(
      doc: (jsonCateg[isCom ? 'doc' : 'doc'] as List)
          .map((e) => DocOrder.fromjson(e))
          .toList(),
      results: jsonCateg['results'],
      status: jsonCateg['status'],
    );
  }
}