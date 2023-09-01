import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
part 'login_controller.g.dart';

class LoginController = LoginControllerBase with _$LoginController;

abstract class LoginControllerBase with Store {
  @observable
  bool isLoading = false;

  @observable
  bool isSuccess = false;

  late String email;
  late String password;
  late BuildContext buildContext;

  @action
  Future<void> checkData({
    required String email,
    required String password,
    required BuildContext buildContext,
  }) async {
    this.buildContext = buildContext;

    if (_validate(email: email, password: password)) {
      this.email = email;
      this.password = password;
      isLoading = true;
      await sendData();
      isLoading = false;
    }
  }

  bool _validate({
    required String email,
    required String password,
  }) {
    return true;
  }

  @action
  Future<void> sendData() async {
    isSuccess = true;
  }
}
