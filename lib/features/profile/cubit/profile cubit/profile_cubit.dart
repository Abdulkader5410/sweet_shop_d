import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sweet_shop_d/core/api/api_consumer.dart';
import 'package:sweet_shop_d/core/errors/exceptions.dart';
import 'package:sweet_shop_d/features/profile/cubit/profile%20cubit/profile_state.dart';
import 'package:sweet_shop_d/features/profile/model/profile_model.dart';
import 'package:sweet_shop_d/features/profile/model/profile_response_model.dart';

import '../../../../core/api/endpoints.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit(this.api) : super(ProfileInitial());

  ApiConsumer api;
  ProfileModel? profileModel;
  ProResModel? proResModel;

  GlobalKey<FormState> proForm = GlobalKey<FormState>();
  TextEditingController nameCon = TextEditingController();
  TextEditingController emailCon = TextEditingController();
  TextEditingController phoneCon = TextEditingController();
  TextEditingController currPassCon = TextEditingController();
  TextEditingController newPassCon = TextEditingController();

  String? image;

  getProfile() async {
    try {
      emit(ProfileLoading());

      final response = await api.get(EndPoints.baseUrl + EndPoints.me);

      print("response  >>>>>>>>>>>>>>>>>>  $response");

      profileModel = ProfileModel.fromjson(response);

      print("profileModel  >>>>>>>>>>>>>>>>>>  $profileModel");

      emit(ProfileLoaded(profileModel: profileModel!));
    } on ServerDioException catch (e) {
      log("ABD");
      emit(ProfileFailure(errMsg: e.errorModel.msg));
    }
  }

  updateProfile() async {
    try {
      emit(ProfileLoading());

      final data = {
        emailCon.text.isEmpty ? "" : ApiKey.email: emailCon.text,
        nameCon.text.isEmpty ? "" : ApiKey.name: nameCon.text,
        phoneCon.text.isEmpty ? "" : ApiKey.phone: phoneCon.text,
        image == null ? "" : ApiKey.image: phoneCon.text,
      };

      final response =
          await api.patch(EndPoints.baseUrl + EndPoints.updateMe, data: data);

      print("response  >>>>>>>>>>>>>>>>>>  $response");

      proResModel = ProResModel.fromjson(response);

      print("profileModel  >>>>>>>>>>>>>>>>>>  $proResModel");

      emit(ProfileUpdated(proResModel: proResModel!));
    } on ServerDioException catch (e) {
      log("ABD");
      emit(ProfileFailure(errMsg: e.errorModel.msg));
    }
  }

  updatePassword() async {
    try {
      emit(ProfileLoading());

      final data = {
        'passwordCurrent': currPassCon.text,
        'password': newPassCon.text,
      };

      final response = await api
          .patch(EndPoints.baseUrl + EndPoints.updateMyPassword, data: data);

      print("response  >>>>>>>>>>>>>>>>>>  $response");

      // emit(PasswordSuccess());
    } on ServerDioException catch (e) {
      log("ABD");
      emit(ProfileFailure(errMsg: e.errorModel.msg));
    }
  }
}
