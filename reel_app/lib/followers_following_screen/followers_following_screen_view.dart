import 'package:flutter/material.dart';
import 'package:reel_app/loading_screen/loading_screen.dart';

import '../model_classes/user_model.dart';
import '../profile_screen/profile_screen_view.dart';
import 'followers_following_screen_functions.dart';

class FollowersFollowingView extends StatefulWidget {
  final String title;
  final String userUid;
  const FollowersFollowingView({super.key, required this.title, required this.userUid});

  @override
  State<FollowersFollowingView> createState() => _FollowersFollowingViewState();
}

class _FollowersFollowingViewState extends State<FollowersFollowingView> {

  List<UserModel> userModel = [];
  bool isLoading = true;

  @override

  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  void getData() async {
    userModel = await FollowerFollowingFunctions.getFollowersFollowingData(
        widget.userUid, widget.title.toLowerCase(),
    ) ?? [];

    setState(() {
      isLoading = false;
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
        title: Text(
          widget.title,
          style: const TextStyle(
            color: Colors.black,
          ),
        ),
      ),
      body: isLoading ? const LoadingScreen() : ListView.builder(
        itemCount: userModel.length,
          itemBuilder: (context, index) {
        return ListTile(
          onTap: () {
            Navigator.push(
                context, MaterialPageRoute(
                builder: (context) => ProfileView(userUid: userModel[index].uid),),);
          },
          leading: CircleAvatar(
            backgroundColor: Colors.grey,
            backgroundImage: NetworkImage(
              userModel[index].profileImage,
            ),
          ),
          title: Text(
            userModel[index].username,
          ),
        );
      }),
    );
  }
}
