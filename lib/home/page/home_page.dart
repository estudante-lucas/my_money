import 'package:flutter/material.dart';
import 'package:my_money/home/components/expense_button.dart';
import 'package:my_money/home/components/expense_count.dart';
import 'package:my_money/router/app_router.dart';
import 'package:my_money/shared/colors/app_colors.dart';
import 'package:my_money/shared/components/app_button.dart';
import 'package:my_money/shared/components/app_title.dart';
import 'package:my_money/shared/components/expense_list.dart';
import 'package:my_money/shared/metrics/app_metrics.dart';
import 'package:my_money/shared/model/expense_model.dart';
import 'package:my_money/shared/storage/app_key.dart';
import 'package:my_money/shared/storage/app_secure_storage.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  onLogout() {
    AppSecureStorage.deleteItem(AppKey.authToken);
    AppSecureStorage.deleteItem(AppKey.userId);
    AppSecureStorage.deleteItem(AppKey.user);

    Navigator.of(context).pushReplacementNamed(AppRouter.login);
  }

  List<ExpenseModel> expenses = [
    ExpenseModel(
      category: "Alimentação",
      description: "Supermercado",
      value: 100.0,
      registrationDate: "01/09/2023",
    ),
    ExpenseModel(
      category: "Transporte",
      description: "Uber",
      value: 27.0,
      registrationDate: "01/09/2023",
    ),
    ExpenseModel(
      category: "Alimentação",
      description: "Padaria",
      value: 20.0,
      registrationDate: "02/09/2023",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.background,
        centerTitle: true,
        toolbarHeight: AppMetrics.barHeight,
        elevation: 0,
        actions: [
          IconButton(
            onPressed: onLogout,
            icon: const Icon(Icons.logout),
          )
        ],
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pushNamed(AppRouter.personalRegister);
          },
          icon: const Icon(Icons.settings_outlined),
        ),
      ),
      backgroundColor: AppColors.background,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.only(
                left: 25,
                right: 25,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const AppTitle(title: "Dashboard MyMoney"),
                  const Padding(
                    padding: EdgeInsets.only(bottom: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        ExpenseCount(
                          title: "Gasto acumulado",
                          value: 200.0,
                          background: AppColors.error,
                          icon: Icons.trending_up,
                        ),
                        ExpenseCount(
                          title: "Gasto planejado",
                          value: 2000.0,
                          background: Colors.lightGreen,
                          icon: Icons.trending_up,
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * 0.38,
                      decoration: const BoxDecoration(color: AppColors.secondary),
                      child: const Center(
                        child: Text(
                          "Dados de gráficos de gastos",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: ExpenseList(
                      expenses: expenses,
                      title: "Gastos recentes",
                    ),
                  ),
                  AppButton(
                    action: () {},
                    label: "Histórico",
                  )
                ],
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        child: Container(
          height: 40,
        ),
      ),
      floatingActionButton: ExpenseButton.add(context),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
