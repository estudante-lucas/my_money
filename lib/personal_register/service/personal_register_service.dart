import 'package:flutter/material.dart';
import 'package:my_money/personal_register/model/personal_register_model.dart';
import 'package:my_money/personal_register/repository/personal_register_repository.dart';
import 'package:my_money/shared/helpers/authenticated_user.dart';
import 'package:my_money/shared/model/user_model.dart';
import 'package:my_money/shared/model/user_update_model.dart';

class PersonalRegisterService {
  PersonalRegisterRepository repository = PersonalRegisterRepository();

  Future<bool> sendData({
    required String name,
    required String email,
    required double limitValue,
  }) async {
    try {
      UserModel user = await AuthenticatedUser.getUserData();

      if (name.compareTo(user.fullName) != 0 || email.compareTo(user.email) != 0) {
        await updateRegister(
          user.id,
          UserUpdateModel(
            fullName: name,
            email: email,
          ),
        );
      }

      if (limitValue != user.limitValue) {
        await sendPersonalRegister(limitValue, user.id);
      }

      return true;
    } catch (exception) {
      debugPrint(exception.toString());
      return false;
    }
  }

  Future<void> sendPersonalRegister(double limitValue, String userId) async {
    await repository.sendData(PersonalRegisterModel(
      userId: userId,
      limitValue: limitValue,
    ));
  }

  Future<void> updateRegister(String userId, UserUpdateModel userUpdate) async {
    await repository.updateDataUser(userId, userUpdate);
  }
}
