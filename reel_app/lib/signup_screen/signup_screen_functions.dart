import 'package:firebase_auth/firebase_auth.dart';

class SignupFunctions {

  static FirebaseAuth auth = FirebaseAuth.instance;

  static Future<bool> createAccount(String email, String password) async {
    try{
      final result = await auth.createUserWithEmailAndPassword(
          email: email,
          password: password);

      if(result.user != null) {
        return true;
      } else {
        return false;
      }

    }
        catch (e) {
      print(e);
      return false;
        }
  }
}