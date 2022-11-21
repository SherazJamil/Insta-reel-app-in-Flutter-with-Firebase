import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:reel_app/edit_profile_screen/edit_profile_view.dart';
import 'package:reel_app/loading_screen/loading_screen.dart';
import 'package:reel_app/model_classes/user_model.dart';
import 'package:reel_app/profile_screen/profile_screens_function.dart';
import 'package:reel_app/search_screen/search_view.dart';
import 'package:url_launcher/url_launcher.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({Key? key}) : super(key: key);

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {

  UserModel? userModel;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getCurrentUserData();
  }

  void getCurrentUserData() async {
     userModel = await ProfileFunctions.getUserDetails();
     setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: userModel == null ? const LoadingScreen() : Scaffold(
        body: SizedBox(
          width: double.infinity,
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.all(10.sp),
                child: Row(
                  //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      userModel!.username,
                      style: TextStyle(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Expanded(child: SizedBox()),
                    IconButton(
                        onPressed: () {
                          showSearch(context: context, delegate: SearchView());
                        },
                        icon: const Icon(Icons.search_sharp)),
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.add)),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    height: 90.h,
                    width: 90.w,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.grey,
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(
                          userModel!.profileImage,
                        ),
                      ),
                    ),
                  ),
                  showData('Posts', userModel!.posts.toString()),
                  showData('Followers', userModel!.followers.toString()),
                  showData('Following', userModel!.following.toString()),
                ],
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.sp),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    userModel!.name,
                    style: TextStyle(
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.sp),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    userModel!.bio,
                    style: TextStyle(
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.sp),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: InkWell(
                    onTap: () async {
                      Uri uri = Uri.parse(userModel!.addLink);
                      if(await canLaunchUrl(uri)) {
                        launchUrl(uri);
                      } else {
                        print('Cannot launch Url');
                      }
                    },
                    child: Text(
                      userModel!.addLink,
                      style: TextStyle(
                        color: Colors.blue,
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 30.h,
              ),
              customButton(true),
              SizedBox(
                height: 30.h,
              ),
              Expanded(
                  child: GridView.builder(
                    itemCount: 15,
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                      ),
                      itemBuilder: (context, index) {
                        return SizedBox(
                          child: Image.network(
                            userModel!.profileImage,
                            fit: BoxFit.fill,
                          ),
                        );
                      }
                  )),
            ],
          ),
        ),
      ),
    );
  }

  Widget customButton(bool isCurrentUser, ) {
    return InkWell(
      onTap: () {
        if(isCurrentUser) {
          Navigator.push(context, MaterialPageRoute(builder: (context) => EditView(userModel: userModel!,)));
        } else {
          //Follow functionality
        }
      },
      child: Container(
        height: 30.h,
        width: 310.w,
        decoration: BoxDecoration(
          color: isCurrentUser ? Colors.grey.shade300 : Colors.blue,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Text(
          isCurrentUser ? 'Edit Profile' : 'Follow',
          style: TextStyle(
            fontSize: 15.sp,
            fontWeight: FontWeight.w500,
            color: isCurrentUser ? Colors.black : Colors.white,
          ),
        ),
      ),
    );
  }

  Widget showData(String title, String value) {
    return Column(
      children: [
        Text(
            value,
          style: TextStyle(
            fontSize: 22.sp,
            fontWeight: FontWeight.w500
          ),
        ),
        Text(
            title,
          style: TextStyle(
            fontSize: 17.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }

}
