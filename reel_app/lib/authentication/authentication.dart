import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:reel_app/home_screen/home_screen_view.dart';
import 'package:reel_app/login_screen/login_screen_view.dart';

class Authentication extends StatelessWidget {
   Authentication({Key? key}) : super(key: key);

  FirebaseAuth auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    if(auth.currentUser != null) {
      return const HomeView();
    } else {
      return const LoginView();
    }
  }
}
