import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:fyp/Screen/auth/LoginScreen.dart';

import '../../UI/Components/MyText.dart';
import '../../Util/Colors.dart';
import '../Onboarding_Screen/Onboarding_Screen.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  TextEditingController emailcontroler = TextEditingController();
  TextEditingController passwordcontroler = TextEditingController();
  TextEditingController namecontroler = TextEditingController();
  TextEditingController confirmpasswordcontroler = TextEditingController();

  final _auth = FirebaseAuth.instance;
  final dbreference = FirebaseDatabase.instance.ref('User');

  GlobalKey<FormState> _formKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 30, right: 30, top: 50),
          child: Form(
            key: _formKey,
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
                    padding: EdgeInsets.only(right: 200.w, bottom: 10.h),
                    child: MyText(
                      text: 'Register',
                      size: 30,
                    )),
                Padding(
                    padding: EdgeInsets.only(right: 135.w),
                    child: MyText(text: 'Add your detail to Register')),
                SizedBox(
                  height: 25.h,
                ),
                TextFormField(
                  controller: namecontroler,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  decoration: InputDecoration(
                      fillColor: Colors.grey[200],
                      filled: true,
                      prefixIcon: Padding(
                        padding: EdgeInsets.only(left: 20.w),
                        child: const Icon(Icons.person),
                      ),
                      hintText: '   Enter your Name',
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(40),
                        borderSide: const BorderSide(
                            color: AppColors.Maincolor,
                            style: BorderStyle.solid),
                      ),
                      focusColor: AppColors.Maincolor,
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(40))),
                  validator: MultiValidator(
                      [RequiredValidator(errorText: 'Name is not provided')]),
                ),
                SizedBox(
                  height: 20.h,
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
                TextFormField(
                  controller: confirmpasswordcontroler,
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
                          .createUserWithEmailAndPassword(
                              email: emailcontroler.text.toString(),
                              password:
                                  confirmpasswordcontroler.text.toString())
                          .then((value) {
                        toastMasseges('user created');
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const Onboarding_Screen()));
                      }).onError((error, stackTrace) {
                        debugPrint(error.toString());
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
                        text: 'Register',
                        size: 18.sp,
                        weight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  MyText(text: 'I have an account'),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const LoginScreen()));
                    },
                    style: ButtonStyle(
                        padding: MaterialStateProperty.all(
                            const EdgeInsets.symmetric(
                                vertical: 2, horizontal: 2))),
                    child: const Text(
                      'Login',
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
    );
  }
}
