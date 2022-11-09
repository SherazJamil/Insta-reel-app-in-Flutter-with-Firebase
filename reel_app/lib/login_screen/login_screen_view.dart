import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {

  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Insta Reel',
              style: TextStyle(
                fontSize: 40.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            customTextField('Email', email),
            customTextField('Password', password),
            SizedBox(
              height: 10.h,
            ),
            customButton(),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        height: 50.h,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'New User?',
              style: TextStyle(
                fontSize: 15.sp,
              ),
            ),
            InkWell(
              onTap: () {},
              child: Text(
                'SignUp',
                style: TextStyle(
                  fontSize: 15.sp,
                  color: Colors.blue,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget customTextField(String hintText, TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 15),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          hintText: hintText,
          border: const OutlineInputBorder(),
        ),
      ),
    );
  }

  Widget customButton() {
    return Container(
      height: 40.h,
      width: 320.w,
      color: Colors.blue,
      alignment: Alignment.center,
      child: Text(
        'Login',
        style: TextStyle(
          color: Colors.white,
          fontSize: 18.sp,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }

}
