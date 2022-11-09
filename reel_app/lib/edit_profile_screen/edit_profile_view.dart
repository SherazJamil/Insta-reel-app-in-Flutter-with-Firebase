import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EditView extends StatefulWidget {
  const EditView({Key? key}) : super(key: key);

  @override
  State<EditView> createState() => _EditViewState();
}

class _EditViewState extends State<EditView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'Edit Profile',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.close,
            color: Colors.black,
          ),
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.done,
              color: Colors.blue,
              ),),
        ],
      ),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          children: [
            SizedBox(
              height: 20.h,
            ),
            Container(
              height: 90.h,
              width: 90.w,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.grey,
              ),
              child: Icon(
                Icons.account_circle_sharp,
              size: 90.sp,
              ),
            ),
            TextButton(
                onPressed: () {},
                child: Text(
                  'Change profile picture',
                  style: TextStyle(
                    fontSize: 18.sp,
                    color: Colors.blue,
                  ),
                ),
            ),
            customTextField('Name'),
            customTextField('Username'),
            customTextField('Bio'),
            customTextField('Add Link'),
            ],
        ),
      ),
    );
  }

  Widget customTextField(String hintText) {
    return Padding(
      padding: EdgeInsets.all(10.sp),
      child: TextField(
        decoration: InputDecoration(
          hintText: hintText
        ),
      ),
    );
  }

}
