import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:reel_app/login_screen/login_screen_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(builder: (context, child) {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Insta Reel',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const LoginView(),
      );
    });
  }
}