import 'package:dio/dio.dart';
import 'package:my_money/http/app_dio.dart';
import 'package:my_money/register/model/register_model.dart';
import 'package:my_money/shared/helpers/constants.dart';

class RegisterRepository {
  String baseURL = "http://${Constants.hostname}:3099/user";

  Future<Response<Map<String, dynamic>>> sendRegisterData(RegisterDataModel registerData) async {
    final Dio clientHTTP = await AppDio.getConnection();

    return clientHTTP.post('$baseURL/create', data: registerData.toJson());
  }
}
