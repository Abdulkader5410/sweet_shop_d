import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class DocOrderEntity extends Equatable {
  String id;
  Map<String, dynamic> paidstatus;
  Map<String, dynamic> status;
  List<dynamic> cart;
  bool withDelivery;
  dynamic delivery;
  dynamic location;
  dynamic priceExtesion;
  dynamic priceDelivery;
  dynamic total;
  bool paid;
  double duration;
  dynamic updatedAt;
  Map<String, dynamic> user;

  DocOrderEntity({
    required this.id,
    required this.cart,
    required this.delivery,
    required this.duration,
    required this.location,
    required this.paid,
    required this.paidstatus,
    required this.priceDelivery,
    required this.priceExtesion,
    required this.status,
    required this.total,
    required this.withDelivery,
    required this.updatedAt,
    required this.user,
  });

  factory DocOrderEntity.fromJson(Map<String, dynamic> json) {
    return DocOrderEntity(
      id: json['_id'],
      cart: json['cart'],
      delivery: json['delivery'],
      duration: json['duration'],
      location: json['location'],
      paid: json['paid'],
      paidstatus: json['paidstatus'],
      priceDelivery: json['priceDelivery'],
      priceExtesion: json['priceExtesion'],
      status: json['status'],
      total: json['total'],
      withDelivery: json['withDelivery'],
      updatedAt: json['updatedAt'],
      user: json['user'],
    );
  }

  @override
  List<Object?> get props => [
        id,
        cart,
        delivery,
        duration,
        location,
        paid,
        paidstatus,
        priceDelivery,
        priceExtesion,
        status,
        total,
        withDelivery,
        updatedAt,
        user,
      ];
}

class CartItem {
  Product product;
  dynamic quantity;
  dynamic price;
  dynamic id;

  CartItem(
      {required this.id,
      required this.quantity,
      required this.product,
      required this.price});

  factory CartItem.fromJson(Map<String, dynamic> json) {
    return CartItem(
      product: json['product'],
      quantity: json['quantity'],
      price: json['price'],
      id: json['_id'],
    );
  }
}


class Product {
  dynamic nameAr;
  dynamic nameEn;

  Product({required this.nameAr, required this.nameEn});

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      nameEn: json['name']["en"],
      nameAr: json['name']["ar"],
    );
  }
}

// {product: {name: {ar: منتج حلو2, en: sweet product2}}, quantity: 3, price: 6000, _id: 6819fb529648afd4cf47293a},