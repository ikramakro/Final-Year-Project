import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../MyText.dart';

class TopSectionOfLogin extends StatelessWidget {
  const TopSectionOfLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
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
          padding: const EdgeInsets.only(right: 140),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              MyText(
                text: 'Login',
                size: 30,
              ),
              MyText(text: 'Add your detail to login'),
            ],
          ),
        )
      ],
    );
  }
}
