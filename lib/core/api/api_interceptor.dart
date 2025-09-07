import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sweet_shop_d/main.dart';

class ApiInterceptor extends Interceptor {
  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    sharedPreferences = await SharedPreferences.getInstance();
    String? token = sharedPreferences.getString("token");

    options.headers["Authorization"] = token != null ? "Bearer $token" : null;

    options.headers['Accept-language'] = "en";
    

    
    super.onRequest(options, handler);
  }
}
