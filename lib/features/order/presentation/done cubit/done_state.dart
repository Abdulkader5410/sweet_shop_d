part of 'done_cubit.dart';

sealed class DoneState extends Equatable {
  const DoneState();

  @override
  List<Object> get props => [];
}

final class DoneInitial extends DoneState {}

final class DoneLoading extends DoneState {}

final class DoneSuccess extends DoneState {
  const DoneSuccess();
}

final class DoneError extends DoneState {
  final String msg;

  const DoneError({required this.msg});
}
