import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:my_money/login/service/login_service.dart';
import 'package:my_money/shared/components/app_snackbar.dart';
import 'package:my_money/shared/helpers/validator.dart';

part 'login_controller.g.dart';

class LoginController = LoginControllerBase with _$LoginController;

abstract class LoginControllerBase with Store {
  LoginService service = LoginService();

  @observable
  bool _isLoading = false;

  @observable
  bool _isSuccess = false;

  bool get isLoading => _isLoading;
  bool get isSuccess => _isSuccess;

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
      toggleLoading();
      await sendData();
    } else {
      AppSnackbar.openMessage(
        context: buildContext,
        message: "Verifique os dados preenchidos",
      );
    }
  }

  bool _validate({
    required String email,
    required String password,
  }) {
    return Validator.isEmail(email) && password.isNotEmpty;
  }

  @action
  Future<void> sendData() async {
    Map result = await service.sendData(
      email: email,
      password: password,
    );

    result.containsKey('success') ? toggleSuccess() : getException(result['exception']);
  }

  @action
  void toggleSuccess() => _isSuccess = !_isSuccess;

  @action
  void toggleLoading() => _isLoading = !_isLoading;

  @action
  void getException(int code) {
    toggleLoading();
    switch (code) {
      case 401:
        AppSnackbar.openMessage(
          context: buildContext,
          message: "Acesso não autorizado",
        );
        break;
      case 400:
        AppSnackbar.openMessage(
          context: buildContext,
          message: "Dados inválidos",
        );
        break;
      default:
        AppSnackbar.openMessage(
          context: buildContext,
          message: "Erro inesperado, tente mais tarde",
        );
    }
  }
}
