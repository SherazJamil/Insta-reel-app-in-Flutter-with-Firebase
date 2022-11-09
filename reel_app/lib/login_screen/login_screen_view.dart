import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:reel_app/home_screen/home_screen_view.dart';
import 'package:reel_app/loading_screen/loading_screen.dart';
import 'package:reel_app/login_screen/login_screen_functions.dart';
import 'package:reel_app/signup_screen/signup_screen_view.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  bool isLoading = false;

  void onLogin() async {
    if (email.text.isNotEmpty && password.text.isNotEmpty) {
      setState(() {
        isLoading = true;
      });

      bool loginSuccessful = await LoginFunctions.login(email.text.trim(), password.text.trim());
      if (loginSuccessful) {
        print('Login Successfully');
        Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => const HomeView()), (route) => false);
      } else {
        print('Something went wrong');
      }

      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? const LoadingScreen()
        : Scaffold(
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
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const SignupView()));
                    },
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
    return InkWell(
      onTap: () {
        onLogin();
      },
      child: Container(
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
      ),
    );
  }
}
