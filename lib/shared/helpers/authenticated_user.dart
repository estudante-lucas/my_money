import 'dart:convert';

import 'package:my_money/shared/model/user_model.dart';
import 'package:my_money/shared/storage/app_key.dart';
import 'package:my_money/shared/storage/app_secure_storage.dart';

class AuthenticatedUser {
  static Future<UserModel> getUserData() async {
    Map<String, dynamic> userJson = {};

    String? user = await AppSecureStorage.readItem(AppKey.user);

    if (user != null) userJson.addAll(jsonDecode(user));

    String goalValue = await AppSecureStorage.readItem(AppKey.goalValue) ?? "0";

    userJson["limitValue"] = goalValue;

    UserModel userData = UserModel.fromJson(userJson);

    return userData;
  }
}
