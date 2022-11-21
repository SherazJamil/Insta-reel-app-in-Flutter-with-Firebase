import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:reel_app/login_screen/login_screen_functions.dart';
import 'package:reel_app/profile_screen/profile_screen_view.dart';

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
              Navigator.push(
                  context, MaterialPageRoute(
                  builder: (context) => ProfileView(userUid: FirebaseAuth.instance.currentUser!.uid,)));
            },
            icon: const Icon(Icons.account_circle_sharp),),
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
