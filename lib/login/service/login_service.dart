import 'package:dio/dio.dart';
import 'package:my_money/login/model/login_model.dart';
import 'package:my_money/login/repository/login_repository.dart';
import 'package:my_money/shared/storage/app_key.dart';
import 'package:my_money/shared/storage/app_secure_storage.dart';

class LoginService {
  LoginRepository repository = LoginRepository();

  Future<Map<dynamic, dynamic>> sendData({
    required String email,
    required String password,
  }) async {
    try {
      LoginModel model = LoginModel(email, password);

      Response<Map<String, dynamic>> response = await repository.sendData(model);
      await persistLocalData(response.data);

      return {"success": true};
    } on DioError catch (e) {
      return {"error": getStatusCode(e)};
    }
  }

  Future<void> persistLocalData(Map<String, dynamic>? data) async {
    if (data != null) {
      String token = data['access_token'];
      Map<String, dynamic> userData = data['additional_information'];
      String userId = userData['id'];

      AppSecureStorage.addItem(AppKey.authToken, token);
      AppSecureStorage.addItem(AppKey.user, userData.toString());
      AppSecureStorage.addItem(AppKey.userId, userId);
    }
  }

  int getStatusCode(DioError e) {
    return e.response!.data['statusCode'];
  }
}
