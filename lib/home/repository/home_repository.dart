import 'package:dio/dio.dart';
import 'package:my_money/http/app_dio.dart';
import 'package:my_money/shared/helpers/constants.dart';

class HomeRepository {
  Future<Response<List<dynamic>>> getExpenses(String userId) async {
    String url = "http://${Constants.hostname}:3099/expense/findAllByUser/$userId";

    Dio clientHTTP = await AppDio.getConnection(isAuth: true);

    return await clientHTTP.get(url);
  }

  Future<Response<Map<String, dynamic>>> getGoal(String userId) async {
    String url = "http://${Constants.hostname}:3099/goal/findByUser/$userId";

    Dio clientHTTP = await AppDio.getConnection(isAuth: true);

    return await clientHTTP.get(url);
  }
}
