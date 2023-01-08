// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AlanCommand extends StatelessWidget {
  const AlanCommand({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Alan Command")),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 20.w),
        child: ListView(
          children: [
            Text(
              'Navigation OR Routing ',
              style: TextStyle(fontSize: 28.sp, fontWeight: FontWeight.bold),
            ),
            Text(
              "1) Open the Home Screen",
              style: TextStyle(fontSize: 18.sp),
            ),
            Text(
              "2) Open the burger Screen",
              style: TextStyle(fontSize: 18.sp),
            ),
            Text(
              "3) Open the Pizza Screen",
              style: TextStyle(fontSize: 18.sp),
            ),
            Text(
              "4) Open the Cart Screen",
              style: TextStyle(fontSize: 18.sp),
            ),
            Text(
              "e.t.c",
              style: TextStyle(fontSize: 22.sp, fontWeight: FontWeight.bold),
            ),
            Text(
              'Order Somthing  ',
              style: TextStyle(fontSize: 28.sp, fontWeight: FontWeight.bold),
            ),
            Text(
              "1) order me a burger",
              style: TextStyle(
                fontSize: 18.sp,
              ),
            ),
            Text(
              "2) order me a Item Name",
              style: TextStyle(
                fontSize: 18.sp,
              ),
            ),
            Text(
              "3) Add to cart Item Name",
              style: TextStyle(
                fontSize: 18.sp,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
