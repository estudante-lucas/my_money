import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:my_money/home/repository/home_repository.dart';
import 'package:my_money/personal_register/model/personal_register_model.dart';
import 'package:my_money/shared/model/expense_model.dart';
import 'package:my_money/shared/storage/app_key.dart';
import 'package:my_money/shared/storage/app_secure_storage.dart';

class HomeService {
  HomeRepository repository = HomeRepository();

  Future<List<ExpenseModel>> getExpenses() async {
    try {
      List<ExpenseModel> expenses = [];

      String? userId = await AppSecureStorage.readItem(AppKey.userId);

      Response<List<dynamic>> responseList = await repository.getExpenses(userId!);

      responseList.data?.forEach((response) {
        expenses.add(ExpenseModel.fromJson(response));
      });

      return expenses;
    } catch (ex) {
      debugPrint(ex.toString());
      throw Exception(ex);
    }
  }

  Future<double> getGoalValue() async {
    try {
      String? userId = await AppSecureStorage.readItem(AppKey.userId);

      Response<Map<String, dynamic>> response = await repository.getGoal(userId!);

      PersonalRegisterModel personalRegister = PersonalRegisterModel.fromJson(response.data!);

      return personalRegister.limitValue;
    } catch (ex) {
      debugPrint(ex.toString());
      throw Exception(ex);
    }
  }
}
