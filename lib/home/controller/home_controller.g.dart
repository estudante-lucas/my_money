// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$HomeController on HomeControllerBase, Store {
  late final _$isLoadingAtom =
      Atom(name: 'HomeControllerBase.isLoading', context: context);

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  late final _$expensesAtom =
      Atom(name: 'HomeControllerBase.expenses', context: context);

  @override
  List<ExpenseModel> get expenses {
    _$expensesAtom.reportRead();
    return super.expenses;
  }

  @override
  set expenses(List<ExpenseModel> value) {
    _$expensesAtom.reportWrite(value, super.expenses, () {
      super.expenses = value;
    });
  }

  late final _$accValueAtom =
      Atom(name: 'HomeControllerBase.accValue', context: context);

  @override
  double get accValue {
    _$accValueAtom.reportRead();
    return super.accValue;
  }

  @override
  set accValue(double value) {
    _$accValueAtom.reportWrite(value, super.accValue, () {
      super.accValue = value;
    });
  }

  late final _$goalValueAtom =
      Atom(name: 'HomeControllerBase.goalValue', context: context);

  @override
  double get goalValue {
    _$goalValueAtom.reportRead();
    return super.goalValue;
  }

  @override
  set goalValue(double value) {
    _$goalValueAtom.reportWrite(value, super.goalValue, () {
      super.goalValue = value;
    });
  }

  late final _$dailyExpenseBalanceAtom =
      Atom(name: 'HomeControllerBase.dailyExpenseBalance', context: context);

  @override
  double get dailyExpenseBalance {
    _$dailyExpenseBalanceAtom.reportRead();
    return super.dailyExpenseBalance;
  }

  @override
  set dailyExpenseBalance(double value) {
    _$dailyExpenseBalanceAtom.reportWrite(value, super.dailyExpenseBalance, () {
      super.dailyExpenseBalance = value;
    });
  }

  late final _$plannedSpentBalanceAtom =
      Atom(name: 'HomeControllerBase.plannedSpentBalance', context: context);

  @override
  double get plannedSpentBalance {
    _$plannedSpentBalanceAtom.reportRead();
    return super.plannedSpentBalance;
  }

  @override
  set plannedSpentBalance(double value) {
    _$plannedSpentBalanceAtom.reportWrite(value, super.plannedSpentBalance, () {
      super.plannedSpentBalance = value;
    });
  }

  late final _$expensesDayAtom =
      Atom(name: 'HomeControllerBase.expensesDay', context: context);

  @override
  double get expensesDay {
    _$expensesDayAtom.reportRead();
    return super.expensesDay;
  }

  @override
  set expensesDay(double value) {
    _$expensesDayAtom.reportWrite(value, super.expensesDay, () {
      super.expensesDay = value;
    });
  }

  late final _$dayOfMonthAtom =
      Atom(name: 'HomeControllerBase.dayOfMonth', context: context);

  @override
  int get dayOfMonth {
    _$dayOfMonthAtom.reportRead();
    return super.dayOfMonth;
  }

  @override
  set dayOfMonth(int value) {
    _$dayOfMonthAtom.reportWrite(value, super.dayOfMonth, () {
      super.dayOfMonth = value;
    });
  }

  late final _$loadDataAsyncAction =
      AsyncAction('HomeControllerBase.loadData', context: context);

  @override
  Future<void> loadData() {
    return _$loadDataAsyncAction.run(() => super.loadData());
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
expenses: ${expenses},
accValue: ${accValue},
goalValue: ${goalValue},
dailyExpenseBalance: ${dailyExpenseBalance},
plannedSpentBalance: ${plannedSpentBalance},
expensesDay: ${expensesDay},
dayOfMonth: ${dayOfMonth}
    ''';
  }
}
