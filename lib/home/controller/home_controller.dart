import 'package:flutter/cupertino.dart';
import 'package:mobx/mobx.dart';
import 'package:my_money/router/app_router.dart';
import 'package:my_money/shared/model/expense_model.dart';
import 'package:my_money/shared/storage/app_key.dart';
import 'package:my_money/shared/storage/app_secure_storage.dart';

part 'home_controller.g.dart';

class HomeController = HomeControllerBase with _$HomeController;

abstract class HomeControllerBase with Store {
  @observable
  late List<ExpenseModel> _expenses;

  @observable
  late double _accValue;

  @observable
  late double _goalValue;

  List<ExpenseModel> get expenses => _expenses;

  double get accValue => _accValue;

  double get goalValue => _goalValue;

  @action
  Future<void> loadData() async {
    _expenses = await _getExpenses();
    _accValue = await _getAccValue();
    _goalValue = await _getGoalValue();
  }

  Future<List<ExpenseModel>> _getExpenses() async {
    return <ExpenseModel>[];
  }

  Future<double> _getAccValue() async {
    return 0.0;
  }

  Future<double> _getGoalValue() async {
    return 0.0;
  }

  void logout(BuildContext context) {
    AppSecureStorage.deleteItem(AppKey.authToken);
    AppSecureStorage.deleteItem(AppKey.userId);
    AppSecureStorage.deleteItem(AppKey.user);

    Navigator.of(context).pushReplacementNamed(AppRouter.login);
  }

  void goSettings(BuildContext context) {
    Navigator.of(context).pushNamed(AppRouter.personalRegister);
  }
}
