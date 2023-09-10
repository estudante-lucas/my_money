import 'dart:async';

import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:my_money/personal_register/service/personal_register_service.dart';
import 'package:my_money/shared/components/app_snackbar.dart';
import 'package:my_money/shared/helpers/authenticated_user.dart';
import 'package:my_money/shared/model/user_model.dart';

part 'personal_register_controller.g.dart';

class PersonalRegisterController = PersonalRegisterControllerBase with _$PersonalRegisterController;

abstract class PersonalRegisterControllerBase with Store {
  PersonalRegisterService service = PersonalRegisterService();

  @observable
  bool isLoading = true;

  @observable
  bool isSuccess = false;

  late String name;
  late String email;
  late double limitValue;
  late BuildContext buildContext;

  @action
  Future<UserModel> loadUser() async {
    UserModel user = await AuthenticatedUser.getUserData();
    isLoading = false;
    return user;
  }

  @action
  Future<void> checkData({
    required String nameController,
    required String emailController,
    required String limitValueController,
    required BuildContext buildContext,
  }) async {
    this.buildContext = buildContext;
    limitValueController = limitValueController.isEmpty ? "0" : limitValueController;
    if (double.parse(limitValueController) > 0) {
      name = nameController;
      email = emailController;
      limitValue = double.parse(limitValueController);
      isLoading = true;
      await sendData();
    } else {
      AppSnackbar.openMessage(
        context: buildContext,
        message: "O campo limite de gastos deve ser preenchido",
      );
    }
  }

  @action
  Future<void> sendData() async {
    isSuccess = await service.sendData(
      name: name,
      email: email,
      limitValue: limitValue,
    );
  }
}
