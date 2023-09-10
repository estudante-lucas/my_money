import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:my_money/register/controller/register_controller.dart';
import 'package:my_money/shared/colors/app_colors.dart';
import 'package:my_money/shared/components/app_button.dart';
import 'package:my_money/shared/components/app_logo_title.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  RegisterController controller = RegisterController();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController passwordCheckController = TextEditingController();
  late ReactionDisposer sendDataReactionDisposer;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    reactsToSendDataSuccess();
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    passwordCheckController.dispose();
    sendDataReactionDisposer();
    super.dispose();
  }

  void reactsToSendDataSuccess() {
    sendDataReactionDisposer = reaction((_) => controller.isSuccess, (bool success) {
      if (success) Navigator.of(context).pop();
    });
  }

  void onRegister() async {
    await controller.checkData(
      buildContext: context,
      nameController: nameController.text,
      emailController: emailController.text,
      passwordController: passwordController.text,
      passwordCheckController: passwordCheckController.text,
    );
  }

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
                    controller: nameController,
                    enabled: true,
                    keyboardType: TextInputType.text,
                    textAlign: TextAlign.start,
                    decoration: const InputDecoration(
                      label: Text("Nome Completo"),
                    ),
                  ),
                  TextFormField(
                    autofocus: false,
                    controller: emailController,
                    enabled: true,
                    keyboardType: TextInputType.text,
                    textAlign: TextAlign.start,
                    decoration: const InputDecoration(
                      label: Text("E-mail"),
                    ),
                  ),
                  TextFormField(
                    autofocus: false,
                    controller: passwordController,
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
                    controller: passwordCheckController,
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
                      action: onRegister,
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
