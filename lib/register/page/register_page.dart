import 'package:flutter/material.dart';
import 'package:my_money/shared/colors/app_colors.dart';
import 'package:my_money/shared/components/app_button.dart';
import 'package:my_money/shared/components/app_logo_title.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.secondary,
        elevation: 0,
      ),
      backgroundColor: AppColors.background,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 50, left: 25, right: 25),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const AppLogoTitle(
                    title: 'Cadastro My Money',
                    titleSize: 20,
                    iconSize: 50,
                  ),
                  TextFormField(
                    autofocus: false,
                    enabled: true,
                    keyboardType: TextInputType.text,
                    textAlign: TextAlign.start,
                    decoration: const InputDecoration(
                      label: Text("Nome Completo"),
                    ),
                  ),
                  TextFormField(
                    autofocus: false,
                    enabled: true,
                    keyboardType: TextInputType.text,
                    textAlign: TextAlign.start,
                    decoration: const InputDecoration(
                      label: Text("E-mail"),
                    ),
                  ),
                  TextFormField(
                    autofocus: false,
                    enabled: true,
                    keyboardType: TextInputType.text,
                    obscureText: true,
                    textAlign: TextAlign.start,
                    decoration: const InputDecoration(
                      label: Text("Senha"),
                    ),
                  ),
                  TextFormField(
                    autofocus: false,
                    enabled: true,
                    keyboardType: TextInputType.text,
                    obscureText: true,
                    textAlign: TextAlign.start,
                    decoration: const InputDecoration(
                      label: Text("Confirmar senha"),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: AppButton(
                      action: () {},
                      label: "Cadastrar",
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
