import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({Key? key}) : super(key: key);

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          width: double.infinity,
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.all(10.sp),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'user name',
                      style: TextStyle(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
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
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.grey,
                    ),
                  ),
                  showData('Posts', '0'),
                  showData('Followers', '0'),
                  showData('Following', '0'),
                ],
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
                          child: Image.network('https://www.google.com/search?q=coursera&sxsrf=ALiCzsbhOv0xp9pzeeRnDdBEXEmb3U1awQ:1667995686278&source=lnms&tbm=isch&sa=X&ved=2ahUKEwjy-veSiKH7AhXLCOwKHb5sBuoQ_AUoAnoECAEQBA&biw=908&bih=873&dpr=0.75#imgrc=Ke8GDqG5av7lpM',
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
    return Container(
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
