import 'package:flutter/material.dart';
import 'package:my_money/history/history_page.dart';
import 'package:my_money/home/page/home_page.dart';
import 'package:my_money/initial/page/initial_page.dart';
import 'package:my_money/login/page/login_page.dart';
import 'package:my_money/personal_register/page/personal_register_page.dart';
import 'package:my_money/registrar/page/registrar_page.dart';
import 'package:my_money/router/app_router.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Money',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const InitialPage(),
      debugShowCheckedModeBanner: false,
      darkTheme: ThemeData.dark(),
      routes: {
        AppRouter.login: (context) => const LoginPage(),
        AppRouter.home: (context) => const HomePage(),
        AppRouter.history: (context) => const HistoryPage(),
        AppRouter.register: (context) => const RegistrarPage(),
        AppRouter.personalRegister: (context) => const PersonalRegisterPage(),
      },
    );
  }
}
