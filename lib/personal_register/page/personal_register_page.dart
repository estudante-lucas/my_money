import 'package:flutter/material.dart';
import 'package:my_money/shared/colors/app_colors.dart';
import 'package:my_money/shared/components/app_button.dart';
import 'package:my_money/shared/components/app_logo_title.dart';

class PersonalRegisterPage extends StatefulWidget {
  const PersonalRegisterPage({super.key});

  @override
  State<PersonalRegisterPage> createState() => _PersonalRegisterPageState();
}

class _PersonalRegisterPageState extends State<PersonalRegisterPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.background,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      backgroundColor: AppColors.background,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.only(
                top: 50,
                left: 25,
                right: 25,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const AppLogoTitle(
                    title: "Meus dados",
                    titleSize: 20,
                    iconSize: 80,
                  ),
                  TextFormField(
                    enabled: true,
                    textAlign: TextAlign.start,
                    autofocus: false,
                    keyboardType: TextInputType.text,
                    decoration: const InputDecoration(
                      label: Text("Nome completo"),
                    ),
                  ),
                  TextFormField(
                    enabled: true,
                    textAlign: TextAlign.start,
                    autofocus: false,
                    keyboardType: TextInputType.text,
                    decoration: const InputDecoration(
                      label: Text("E-mail"),
                    ),
                  ),
                  TextFormField(
                    enabled: true,
                    textAlign: TextAlign.start,
                    autofocus: false,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      label: Text("Limite de gasto"),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: AppButton(
                      action: () {},
                      label: "Enviar dados",
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
