// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$HomeController on HomeControllerBase, Store {
  late final _$_expensesAtom =
      Atom(name: 'HomeControllerBase._expenses', context: context);

  @override
  List<ExpenseModel> get _expenses {
    _$_expensesAtom.reportRead();
    return super._expenses;
  }

  @override
  set _expenses(List<ExpenseModel> value) {
    _$_expensesAtom.reportWrite(value, super._expenses, () {
      super._expenses = value;
    });
  }

  late final _$_accValueAtom =
      Atom(name: 'HomeControllerBase._accValue', context: context);

  @override
  double get _accValue {
    _$_accValueAtom.reportRead();
    return super._accValue;
  }

  @override
  set _accValue(double value) {
    _$_accValueAtom.reportWrite(value, super._accValue, () {
      super._accValue = value;
    });
  }

  late final _$_goalValueAtom =
      Atom(name: 'HomeControllerBase._goalValue', context: context);

  @override
  double get _goalValue {
    _$_goalValueAtom.reportRead();
    return super._goalValue;
  }

  @override
  set _goalValue(double value) {
    _$_goalValueAtom.reportWrite(value, super._goalValue, () {
      super._goalValue = value;
    });
  }

  late final _$loadDataAsyncAction =
      AsyncAction('HomeControllerBase.loadData', context: context);

  @override
  Future loadData() {
    return _$loadDataAsyncAction.run(() => super.loadData());
  }

  @override
  String toString() {
    return '''

    ''';
  }
}
