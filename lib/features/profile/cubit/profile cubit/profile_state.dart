import 'package:equatable/equatable.dart';
import 'package:sweet_shop_d/features/profile/model/profile_model.dart';

import '../../model/profile_response_model.dart';

sealed class ProfileState extends Equatable {
  const ProfileState();

  @override
  List<Object> get props => [];
}

final class ProfileInitial extends ProfileState {}

final class ProfileLoading extends ProfileState {}

final class PasswordSuccess extends ProfileState {
  final ProfileModel profileModel;

  const PasswordSuccess({required this.profileModel});
}

final class ProfileLoaded extends ProfileState {
  final ProfileModel profileModel;

  const ProfileLoaded({required this.profileModel});
}

final class ProfileUpdated extends ProfileState {
  final ProResModel proResModel;

  const ProfileUpdated({required this.proResModel});
}

final class ProfileFailure extends ProfileState {
  final String errMsg;

  const ProfileFailure({required this.errMsg});
  @override
  List<Object> get props => [errMsg];
}
