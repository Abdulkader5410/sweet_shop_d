import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sweet_shop_d/core/api/api_consumer.dart';
import 'package:sweet_shop_d/core/api/endpoints.dart';
import 'package:sweet_shop_d/core/errors/exceptions.dart';
import 'package:sweet_shop_d/features/signin/cubit/signin%20cubit/signin_state.dart';
import 'package:sweet_shop_d/features/signin/model/signin_model.dart';
import 'package:sweet_shop_d/main.dart';


class SigninCubit extends Cubit<SigninState> {
  SigninCubit(this.api) : super(SigninInitial());

  ApiConsumer api;
  GlobalKey<FormState> siginForm = GlobalKey();
  TextEditingController passController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  String? phoneNumber;

  SigninModel? signinModel;

  signin() async {
    try {
      emit(SigninLoading());

      if (siginForm.currentState!.validate()) {
        siginForm.currentState!.save();

        final body = {
          ApiKey.password: passController.text,
          ApiKey.email: emailController.text,
        };

        Map<String, dynamic> response =
            await api.post(EndPoints.baseUrl + EndPoints.login, data: body);

        print("response  >>>>>>>>>>>>>>>>>>  $response");

        sharedPreferences.setString("token", response['token']);
        sharedPreferences.setString("currentUser", response['user']['_id']);
        sharedPreferences.setString("name", response['user']['name']);

        print(
            "CURRENT USER IS >>>>>>>>>>>>>>>>>>  ${sharedPreferences.getString("currentUser")} ");

        emit(SigninSuccess());
      } else {
        emit(const SigninFailure(errMsg: "Check on fields !!"));
      }
    } on ServerDioException catch (e) {
      log("ABD");
      emit(SigninFailure(errMsg: e.errorModel.msg));
    }
  }
}
