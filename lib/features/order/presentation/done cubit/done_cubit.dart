import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:sweet_shop_d/core/api/api_consumer.dart';
import 'package:sweet_shop_d/core/api/endpoints.dart';
import 'package:sweet_shop_d/core/errors/exceptions.dart';

part 'done_state.dart';

class DoneCubit extends Cubit<DoneState> {
  DoneCubit(this.api) : super(DoneInitial());

  ApiConsumer api;

  void doneOrder(
    String id,
  ) async {
    try {
      emit(DoneLoading());

      final body = {
        "status": {"ar": "مكتمل", "en": "Completed"},
        "paid": "true",
      };

//       final response =
//           await api.patch(EndPoints.baseUrl + EndPoints.orders + id, data: body);

// https://sweet-shop-main.vercel.app/api/v1.0.0/orders/68b6aab2ffa82c6195d3db02/paid
      final response =
          await api.patch("${EndPoints.baseUrl}${EndPoints.orders}$id/paid");

      print("response  >>>>>>>>>>>>>>>>>>  $response");

      print("TOKEN  :::  ${response['token']}");

      emit(const DoneSuccess());
    } on ServerDioException catch (e) {
      log("ABD");
      emit(DoneError(msg: e.errorModel.msg));
    }
  }
}
