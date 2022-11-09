import 'package:flutter/material.dart';
import 'package:reel_app/login_screen/login_screen_functions.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Home',
        ),
        actions: [
          IconButton(
            onPressed: () {
              LoginFunctions.logout(context);
            },
            icon: const Icon(Icons.logout_sharp),),
        ],
      ),
    );
  }
}
