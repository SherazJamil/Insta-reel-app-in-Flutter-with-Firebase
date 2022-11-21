import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:reel_app/model_classes/user_model.dart';

class ProfileFunctions {
  static FirebaseAuth auth= FirebaseAuth.instance;
  static FirebaseFirestore firestore = FirebaseFirestore.instance;

  static Future<UserModel?> getUserDetails(String userUid) async {
    try {
      final result = await firestore.collection('users').doc(userUid).get();
      UserModel userModel = UserModel.fromJson(result.data()!);
      return userModel;
    }
        catch(e) {
      print(e);
        }
    return null;
  }

  static Future<void> onFollowAndUnfollow(
      bool isFollow, String profileUserUid) async {
    try {

      final currentUserProfilePreference = firestore
          .collection('users').doc(auth.currentUser!.uid);

      final profileUserProfilePreference = firestore
          .collection('users').doc(profileUserUid);

      final currentUserFollowerReference = firestore
          .collection('users').doc(auth.currentUser!.uid)
          .collection('following').doc(profileUserUid);

      final profileUserFollowerReference = firestore
          .collection('users').doc(profileUserUid)
          .collection('followers').doc(auth.currentUser!.uid);

      // await currentUserFollowerReference.set({'uid' : profileUserUid});
      //
      // await profileUserFollowerReference.set({'uid' : auth.currentUser!.uid});

      await firestore.runTransaction((transaction) async {
        final profileUser = await transaction.get(profileUserProfilePreference);

        final currentUser = await transaction.get(currentUserProfilePreference);

        int profileUserFollowerCount = profileUser['followers'];

        int currentUserFollowingCount = currentUser['following'];

        if(isFollow) {

          transaction.update(profileUserProfilePreference,
              {'followers' : profileUserFollowerCount + 1,});

          transaction.update(currentUserProfilePreference,
              {'following' : currentUserFollowingCount + 1});

          transaction.set(currentUserFollowerReference, {'uid' : profileUserUid});

          transaction.set(profileUserFollowerReference, {'uid' : auth.currentUser!.uid});
        } else {

          transaction.update(profileUserProfilePreference,
              {'followers' : profileUserFollowerCount - 1,});

          transaction.update(currentUserProfilePreference,
              {'following' : currentUserFollowingCount - 1});

          transaction.delete(currentUserFollowerReference);

          transaction.delete(profileUserFollowerReference);
        }
        });
    }
        catch(e) {
      print(e);
        }
  }

  static Future<bool> checkIfAlreadyFollowed (String profileUserUid) async {
    try {
      final result = await firestore
          .collection('users')
          .doc(profileUserUid)
          .collection('followers')
          .doc(auth.currentUser!.uid)
          .get();

      return result.exists;
    }
        catch(e) {
      print(e);
      return false;
        }
  }
}