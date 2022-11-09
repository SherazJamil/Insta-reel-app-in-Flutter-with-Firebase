import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:reel_app/model_classes/user_model.dart';

class SignupFunctions {

  static FirebaseAuth auth = FirebaseAuth.instance;
  static FirebaseFirestore firestore = FirebaseFirestore.instance;

  static Future<bool> createAccount(String email, String password) async {
    try{
      final result = await auth.createUserWithEmailAndPassword(
          email: email,
          password: password);

      if(result.user != null) {
        _saveuserdata(email);
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

  static Future<void> _saveuserdata(String email) async {
    try{
      String uid = auth.currentUser!.uid;
      UserModel userModel = UserModel(
          uid: uid,
          name: "",
          username: "",
          email: email,
          bio: "",
          addLink: "",
          profileImage: "",
          posts: 0,
          followers: 0,
          following: 0,
      );
      await firestore.collection('users').doc(uid).set(userModel.toJson());
      print('Details saved successfully');
    }
        catch(e) {
      print(e);
        }
  }
}