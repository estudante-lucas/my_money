// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$LoginController on LoginControllerBase, Store {
  late final _$_isLoadingAtom =
      Atom(name: 'LoginControllerBase._isLoading', context: context);

  @override
  bool get _isLoading {
    _$_isLoadingAtom.reportRead();
    return super._isLoading;
  }

  @override
  set _isLoading(bool value) {
    _$_isLoadingAtom.reportWrite(value, super._isLoading, () {
      super._isLoading = value;
    });
  }

  late final _$_isSuccessAtom =
      Atom(name: 'LoginControllerBase._isSuccess', context: context);

  @override
  bool get _isSuccess {
    _$_isSuccessAtom.reportRead();
    return super._isSuccess;
  }

  @override
  set _isSuccess(bool value) {
    _$_isSuccessAtom.reportWrite(value, super._isSuccess, () {
      super._isSuccess = value;
    });
  }

  late final _$checkDataAsyncAction =
      AsyncAction('LoginControllerBase.checkData', context: context);

  @override
  Future<void> checkData(
      {required String email,
      required String password,
      required BuildContext buildContext}) {
    return _$checkDataAsyncAction.run(() => super.checkData(
        email: email, password: password, buildContext: buildContext));
  }

  late final _$sendDataAsyncAction =
      AsyncAction('LoginControllerBase.sendData', context: context);

  @override
  Future<void> sendData() {
    return _$sendDataAsyncAction.run(() => super.sendData());
  }

  late final _$LoginControllerBaseActionController =
      ActionController(name: 'LoginControllerBase', context: context);

  @override
  void toggleSuccess() {
    final _$actionInfo = _$LoginControllerBaseActionController.startAction(
        name: 'LoginControllerBase.toggleSuccess');
    try {
      return super.toggleSuccess();
    } finally {
      _$LoginControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void toggleLoading() {
    final _$actionInfo = _$LoginControllerBaseActionController.startAction(
        name: 'LoginControllerBase.toggleLoading');
    try {
      return super.toggleLoading();
    } finally {
      _$LoginControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void getException(int code) {
    final _$actionInfo = _$LoginControllerBaseActionController.startAction(
        name: 'LoginControllerBase.getException');
    try {
      return super.getException(code);
    } finally {
      _$LoginControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''

    ''';
  }
}
