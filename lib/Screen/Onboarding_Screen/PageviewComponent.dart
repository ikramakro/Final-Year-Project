// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fyp/UI/Components/MyText.dart';
import 'package:lottie/lottie.dart';

class PageviewComponent extends StatelessWidget {
  String imgpath, text;

  PageviewComponent({
    Key? key,
    required this.imgpath,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 320.h, width: 320.w, child: Lottie.network(imgpath)),
          SizedBox(
            height: 20.h,
          ),
          MyText(
            text: text,
            size: 22,
            weight: FontWeight.bold,
          ),
        ],
      ),
    );
  }
}
