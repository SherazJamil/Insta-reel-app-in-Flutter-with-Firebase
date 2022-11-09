import 'package:firebase_auth/firebase_auth.dart';

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
}