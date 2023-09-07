import 'package:flutter/cupertino.dart';
import 'package:mobx/mobx.dart';
import 'package:my_money/home/service/home_service.dart';
import 'package:my_money/router/app_router.dart';
import 'package:my_money/shared/helpers/date_helper.dart';
import 'package:my_money/shared/model/expense_model.dart';
import 'package:my_money/shared/storage/app_key.dart';
import 'package:my_money/shared/storage/app_secure_storage.dart';

part 'home_controller.g.dart';

class HomeController = HomeControllerBase with _$HomeController;

abstract class HomeControllerBase with Store {
  HomeService service = HomeService();

  List<ExpenseModel> expenseList = [];

  @observable
  bool isLoading = true;

  @observable
  List<ExpenseModel> expenses = [];

  @observable
  double accValue = 0;

  @observable
  double goalValue = 0;

  @observable
  double dailyExpenseBalance = 0;

  @observable
  double plannedSpentBalance = 0;

  @observable
  double expensesDay = 0;

  @observable
  int dayOfMonth = 1;

  @action
  Future<void> loadData() async {
    expenses = await _getExpenses();
    accValue = await _getAccValue();
    goalValue = await _getGoalValue();
    dailyExpenseBalance = await _getDailyExpenseBalance();
    plannedSpentBalance = await _getPlannedSpentBalance();
    expensesDay = await _getExpensesDay();
    dayOfMonth = await _getDayOfMonth();
    isLoading = false;
  }

  Future<List<ExpenseModel>> _getExpenses() async {
    expenseList = await service.getExpenses();

    return expenseList.getRange(0, 3).toList();
  }

  Future<double> _getAccValue() async {
    double totalValue = 0.0;

    for (var expense in expenseList) {
      totalValue += expense.value;
    }

    return totalValue;
  }

  Future<double> _getGoalValue() async {
    return await service.getGoalValue();
  }

  Future<double> _getDailyExpenseBalance() async {
    int daysOfMonth = 30;
    double spentBalance = goalValue - accValue;
    return (spentBalance / daysOfMonth).toDouble().floorToDouble();
  }

  Future<double> _getPlannedSpentBalance() async {
    return goalValue - accValue;
  }

  Future<double> _getExpensesDay() async {
    double totalValue = 0;
    String actualDay = DateHelper.getFormatDMY(DateTime.now());

    for (var expense in expenseList) {
      if (expense.registrationDate == actualDay) totalValue += expense.value;
    }

    return totalValue;
  }

  Future<int> _getDayOfMonth() async {
    return int.parse(DateHelper.getDayOfMonth());
  }

  void logout(BuildContext context) {
    AppSecureStorage.deleteItem(AppKey.authToken);
    AppSecureStorage.deleteItem(AppKey.userId);
    AppSecureStorage.deleteItem(AppKey.user);

    Navigator.of(context).pushReplacementNamed(
      AppRouter.login,
    );
  }

  void goSettings(BuildContext context) {
    Navigator.of(context).pushNamed(
      AppRouter.personalRegister,
    );
  }
}
