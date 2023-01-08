// ignore_for_file: file_names

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:fyp/Screen/Onboarding_Screen/Onboarding_Screen.dart';
import 'package:fyp/UI/Components/Login/Topsection.dart';
import 'package:fyp/Util/Colors.dart';
import '../../UI/Components/MyText.dart';
import 'SingupScreen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  // _LoginScreenState() {
  //   AlanVoice.addButton(

  //       "9676b13daf7882290767b6aebab788782e956eca572e1d8b807a3e2338fdd0dc/stage");
  //   AlanVoice.onCommand.add((command) => _handlecommand(command.data));
  // }
  // @override
  // void initState() {
  //   super.initState();
  //   alanAisetup();
  // }

  // alanAisetup() {
  //   AlanVoice.addButton(
  //       "9676b13daf7882290767b6aebab788782e956eca572e1d8b807a3e2338fdd0dc/stage");
  //   AlanVoice.onCommand.add((command) => _handlecommand(command.data));
  // }

  // _handlecommand(Map<String, dynamic> command) {
  //   switch (command['command']) {
  //     case 'forward':
  //       {
  //         print('opning screen');
  //         Navigator.push(
  //             context,
  //             MaterialPageRoute(
  //               builder: (context) => const HomeScreen(),
  //             ));
  //         break;
  //       }
  //   }
  // }

  TextEditingController emailcontroler = TextEditingController();
  TextEditingController passwordcontroler = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey();

  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        SystemNavigator.pop();
        return true;
      },
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 30, right: 30, top: 50),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const TopSectionOfLogin(),
                  SizedBox(
                    height: 25.h,
                  ),
                  TextFormField(
                    controller: emailcontroler,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
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
                              color: AppColors.Maincolor,
                              style: BorderStyle.solid),
                        ),
                        focusColor: AppColors.Maincolor,
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(40))),
                    validator: MultiValidator([
                      EmailValidator(errorText: 'Invalid Email'),
                      RequiredValidator(errorText: 'Email is not provided')
                    ]),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  TextFormField(
                    controller: passwordcontroler,
                    keyboardType: TextInputType.text,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
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
                              color: AppColors.Maincolor,
                              style: BorderStyle.solid),
                        ),
                        focusColor: AppColors.Maincolor,
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(40))),
                    validator: MultiValidator([
                      RequiredValidator(errorText: 'Password is Required'),
                      MinLengthValidator(6,
                          errorText: 'Password Must be 6 character'),
                    ]),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  GestureDetector(
                    onTap: () {
                      if (_formKey.currentState!.validate()) {
                        _auth
                            .signInWithEmailAndPassword(
                                email: emailcontroler.text.toString(),
                                password: passwordcontroler.text.toString())
                            .then((value) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const Onboarding_Screen()));
                          toastMasseges('Login Sucsefully');
                        }).onError((error, stackTrace) {
                          toastMasseges(error.toString());
                        });
                      }
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
                        '---------------------------------------------------------------',
                    weight: FontWeight.bold,
                  ),
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                    MyText(text: 'Dont\'t have account'),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const SignupScreen()));
                      },
                      style: ButtonStyle(
                          padding: MaterialStateProperty.all(
                              const EdgeInsets.symmetric(
                                  vertical: 2, horizontal: 2))),
                      child: const Text(
                        'SignUp',
                        style: TextStyle(
                          color: AppColors.Maincolor,
                        ),
                      ),
                    ),
                  ])
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

void toastMasseges(String masseg) {
  Fluttertoast.showToast(
      msg: masseg.toString(),
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.CENTER,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.red,
      textColor: Colors.white,
      fontSize: 16.0);
}
