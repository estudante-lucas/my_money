import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:my_money/home/components/expense_button.dart';
import 'package:my_money/home/components/expense_count.dart';
import 'package:my_money/home/controller/home_controller.dart';
import 'package:my_money/shared/colors/app_colors.dart';
import 'package:my_money/shared/components/app_button.dart';
import 'package:my_money/shared/components/app_title.dart';
import 'package:my_money/shared/components/expense_list.dart';
import 'package:my_money/shared/metrics/app_metrics.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  HomeController controller = HomeController();

  @override
  void initState() {
    controller.loadData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.background,
          centerTitle: true,
          toolbarHeight: AppMetrics.barHeight,
          elevation: 0,
          actions: [
            IconButton(
              onPressed: () => controller.logout(context),
              icon: const Icon(Icons.logout),
            )
          ],
          leading: IconButton(
            onPressed: () => controller.goSettings(context),
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
                    Padding(
                      padding: EdgeInsets.only(bottom: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          ExpenseCount(
                            title: "Gasto acumulado",
                            value: controller.accValue,
                            background: AppColors.error,
                            icon: Icons.trending_up,
                          ),
                          ExpenseCount(
                            title: "Gasto planejado",
                            value: controller.goalValue,
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
                        expenses: controller.expenses,
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
    });
  }
}
