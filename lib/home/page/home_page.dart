import 'package:my_money/home/controller/home_controller.dart';
import 'package:my_money/shared/components/app_loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});
  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late HomeController homeController;

  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    homeController = HomeController();

    Future.delayed(const Duration(seconds: 3)).then(
      (_) => setState(() {
        isLoading = false;
      }),
    );
  }

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? const AppLoading()
        : Scaffold(
            appBar: AppBar(
              title: Text(widget.title),
              centerTitle: true,
              leading: const Icon(Icons.verified_user),
              actions: [
                IconButton(onPressed: () {}, icon: const Icon(Icons.logout))
              ],
            ),
            body: Observer(builder: (_) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Image.network(
                          "https://unisenaisc.com.br/wp-content/themes/portal-faculdades/img/logo.png"),
                    ),
                    const Text(
                      'You have pushed the button this many times:',
                    ),
                    Text(
                      '${homeController.counter}',
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                  ],
                ),
              );
            }),
            floatingActionButton: Padding(
              padding: const EdgeInsets.only(bottom: 40),
              child: FloatingActionButton(
                onPressed: homeController.incrementCounter,
                tooltip: 'Increment',
                child: const Icon(Icons.add),
              ),
            ),
            bottomSheet: Container(
                width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(
                    shape: BoxShape.rectangle, color: Colors.white),
                margin:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: ElevatedButton(
                  onPressed: homeController.reset,
                  child: const Text(
                    'Reiniciar contador',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                )),
          );
  }
}
