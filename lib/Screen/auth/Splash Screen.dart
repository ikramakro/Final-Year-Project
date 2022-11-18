import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'LoginScreen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
        const Duration(seconds: 2),
        () => Navigator.push(
            context, MaterialPageRoute(builder: (context) => LoginScreen())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: Center(
          child: Stack(children: [
            Image.asset('Assets/Icons/Splash screen@2x.png'),
            Positioned(
                top: 240.h,
                left: 80.w,
                child: SizedBox(
                    height: 200.h,
                    width: 200.w,
                    child: Image.asset('Assets/Icons/burger.png')))
          ]),
        ),
      ),
    );
  }
}
