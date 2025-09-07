import 'package:sweet_shop_d/core/api/dio_consumer.dart';
import 'package:sweet_shop_d/core/api/endpoints.dart';
import 'package:sweet_shop_d/core/exception/server_exception.dart';
import 'package:sweet_shop_d/features/order/data/model/order_model.dart';

abstract class OrderRemoteDataSource {
  Future<OrderResModel?> getAllOrdersCom(String driverId, String st);
  Future<OrderResModel?> getAllOrdersPen();
}

class OrderRemoteDataSourceImpl implements OrderRemoteDataSource {
  DioConsumer dio;

  OrderRemoteDataSourceImpl({required this.dio});

  @override
  Future<OrderResModel?> getAllOrdersCom(String driverId, String st) async {
    dynamic response;
    print("Enter to method");
    try {
      print("Enter try");

      https: //sweet-shop-main.vercel.app/api/v1.0.0/orders?delivery=68b6ad6effa82c6195d3db1c&status.ar=مكتمل
      response = await dio.get("${EndPoints.baseUrl}orders",
          queryParms: {'delivery': driverId, 'status.ar': 'مكتمل' });

      print("RESPONSE  ::  $response");

      if (response != null) {
        OrderResModel orders = OrderResModel.fromjson(response, true);

        print("ORDERS  ::  $orders");

        return Future.value(orders);
      } else {
        return null;
      }
    } on ServerException catch (e) {
      throw ServerException(errorModel: e.errorModel);
    }
  }

  @override
  Future<OrderResModel?> getAllOrdersPen() async {
    dynamic response;
    print("Enter to method");
    try {
      print("Enter try");
      response = await dio
          .get(EndPoints.baseUrl + EndPoints.orders + EndPoints.workMe);

      print("RESPONSE  ::  $response");

      if (response != null) {
        OrderResModel orders = OrderResModel.fromjson(response, false);

        print("ORDERS  ::  $orders");

        return Future.value(orders);
      } else {
        return null;
      }
    } on ServerException catch (e) {
      throw ServerException(errorModel: e.errorModel);
    }
  }
}
