
import 'package:sweet_shop_d/core/api/endpoints.dart';
import 'package:sweet_shop_d/features/signin/entity/signin_entity.dart';

class SigninModel extends SigninEntity {
  SigninModel({
    required super.password,
    required super.email,
  });

  factory SigninModel.fromjson(Map<String, dynamic> jsonDate) {
    return SigninModel(
      password: jsonDate[ApiKey.password],
      email: jsonDate[ApiKey.email],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'email': ApiKey.email,
      'password': ApiKey.password,
    };
  }
}
