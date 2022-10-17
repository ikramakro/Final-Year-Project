import 'package:alan_voice/alan_voice.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fyp/Util/Colors.dart';
import 'package:fyp/Screen/Home_Screen/HomeScreen.dart';

import '../../Components/MyText.dart';
import '../Onboarding_Screen/Onboarding_Screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  // _LoginScreenState() {
  //   AlanVoice.addButton(
  //       "9676b13daf7882290767b6aebab788782e956eca572e1d8b807a3e2338fdd0dc/stage");
  //   AlanVoice.onCommand.add((command) {
  //     debugPrint("got new command ${command.toString()}");
  //   });
  // }
  @override
  void initState() {
    super.initState();
    alanAisetup();
  }

  alanAisetup() {
    AlanVoice.addButton(
        "9676b13daf7882290767b6aebab788782e956eca572e1d8b807a3e2338fdd0dc/stage");
    AlanVoice.onCommand.add((command) {
      debugPrint("got new command ${command.toString()}");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(left: 30, right: 30, top: 50),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 120.h,
                width: 120.w,
                child: Image.asset('Assets/Icons/burgerout.png'),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                  padding: EdgeInsets.only(right: 230.w, bottom: 10.h),
                  child: MyText(
                    text: 'Login',
                    size: 30,
                  )),
              Padding(
                  padding: EdgeInsets.only(right: 155.w),
                  child: MyText(text: 'Add your detail to login')),
              SizedBox(
                height: 25.h,
              ),
              TextFormField(
                decoration: InputDecoration(
                    fillColor: Colors.grey[200],
                    filled: true,
                    prefixIcon: Padding(
                      padding: EdgeInsets.only(left: 20.w),
                      child: const Icon(Icons.email_outlined),
                    ),
                    hintText: '   Enter your Email Here',
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(40),
                      borderSide: const BorderSide(
                          color: AppColors.Maincolor, style: BorderStyle.solid),
                    ),
                    focusColor: AppColors.Maincolor,
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20))),
              ),
              SizedBox(
                height: 10.h,
              ),
              TextFormField(
                obscureText: true,
                decoration: InputDecoration(
                    fillColor: Colors.grey[200],
                    filled: true,
                    prefixIcon: Padding(
                      padding: EdgeInsets.only(left: 20.w),
                      child: const Icon(Icons.lock),
                    ),
                    hintText: '   Enter your Password Here',
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: const BorderSide(
                          color: AppColors.Maincolor, style: BorderStyle.solid),
                    ),
                    focusColor: AppColors.Maincolor,
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20))),
              ),
              SizedBox(
                height: 20.h,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Onboarding_Screen()));
                },
                child: Container(
                  height: 60.h,
                  width: 320.w,
                  decoration: BoxDecoration(
                      color: AppColors.Maincolor,
                      borderRadius: BorderRadius.circular(30)),
                  child: Center(
                    child: MyText(
                      text: 'Login',
                      size: 18.sp,
                      weight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              Padding(
                  padding:
                      EdgeInsets.only(left: 190.h, bottom: 20.w, top: 10.h),
                  child: MyText(
                    text: 'Forget Password',
                    color: Colors.blue,
                  )),
              MyText(
                text:
                    '------------------------- Or Login With ------------------------',
                weight: FontWeight.bold,
              ),
              SizedBox(
                height: 25.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 60.h,
                    width: 60.w,
                    decoration: BoxDecoration(
                        // color: Color(0xff3e4f86),
                        borderRadius: BorderRadius.circular(30)),
                    child: Image.asset('Assets/Icons/facebook1.png'),
                  ),
                  SizedBox(
                    width: 45.h,
                  ),
                  Container(
                    height: 60.h,
                    width: 60.w,
                    decoration: BoxDecoration(
                        // color: Color(0xff3e4f86),
                        borderRadius: BorderRadius.circular(30)),
                    child: Image.asset('Assets/Icons/google.png'),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Wrap(children: [
                MyText(text: 'Dont\'t have account '),

                ///TODO
                MyText(
                  text: 'SignUp',
                  color: AppColors.Maincolor,
                )
              ])
            ],
          ),
        ),
      ),
    );
  }
}
