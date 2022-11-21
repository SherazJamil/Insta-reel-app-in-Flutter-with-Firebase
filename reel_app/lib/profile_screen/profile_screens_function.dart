import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:reel_app/model_classes/user_model.dart';

class ProfileFunctions {
  static FirebaseAuth auth= FirebaseAuth.instance;
  static FirebaseFirestore firestore = FirebaseFirestore.instance;

  static Future<UserModel?> getUserDetails() async {
    try {
      final result = await firestore.collection('users').doc(auth.currentUser!.uid).get();
      UserModel userModel = UserModel.fromJson(result.data()!);
    }
        catch(e) {
      print(e);
        }
    return null;
  }
}