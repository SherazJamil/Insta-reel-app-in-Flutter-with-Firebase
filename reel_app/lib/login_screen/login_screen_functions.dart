import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:reel_app/authentication/authentication.dart';

class LoginFunctions {
  static FirebaseAuth auth = FirebaseAuth.instance;

  static Future<bool> login(String email, String password) async {
    try {
      final result =
      await auth.signInWithEmailAndPassword(email: email, password: password);
      if(result.user != null) {
        return true;
      } else {
        return false;
      }
    }
        catch(e) {
      print(e);
      return false;
        }
  }

  static Future<void> logout(BuildContext context) async {
    await auth.signOut().then((value) => {
      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => Authentication()), (route) => false),
    });
  }
}