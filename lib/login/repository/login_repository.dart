import 'package:dio/dio.dart';
import 'package:my_money/http/app_dio.dart';
import 'package:my_money/login/model/login_model.dart';

class LoginRepository {
  String baseUrl = "http://localhost:3099/auth/login";

  Future<Response<Map<String, dynamic>>> sendData(LoginModel model) async {
    Dio clientHttp = await AppDio.getConnection(isAuth: false);

    return clientHttp.post(baseUrl, data: model.toJson());
  }
}
