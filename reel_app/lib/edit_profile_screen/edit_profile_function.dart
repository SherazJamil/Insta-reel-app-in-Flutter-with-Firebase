import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';

class EditFunction {
  static FirebaseAuth auth = FirebaseAuth.instance;
  static FirebaseFirestore firestore = FirebaseFirestore.instance;
  static FirebaseStorage storage = FirebaseStorage.instance;

  static Future<void> editProfile(Map<String, dynamic> userData) async {
    try {
      await firestore.collection('users').doc(auth.currentUser!.uid).update(userData);
    print('Your profile has been updated');
    } catch (e) {
      print(e);
    }
  }

  static Future<String?> uploadImage(File imageFile, String imageName) async {
    try {
      final refrence = storage.ref().child('images/$imageName.png');

      final uploadTask = refrence.putFile(imageFile);

      await uploadTask.whenComplete(() {});

      String downloadurl = await refrence.getDownloadURL();

      return downloadurl;
    } catch (e) {
      print(e);
      return null;
    }
  }
}