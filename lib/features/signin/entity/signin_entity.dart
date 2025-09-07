import 'package:equatable/equatable.dart';

class SigninEntity extends Equatable {
  final String password;
  final String email;

  SigninEntity({
    required this.password,
    required this.email,
  });
  @override
  List<Object?> get props => [email, password];
}
