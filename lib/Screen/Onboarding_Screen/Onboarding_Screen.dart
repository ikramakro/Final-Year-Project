// ignore: file_names
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:fyp/Util/Colors.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../Home_Screen/HomeScreen.dart';
import 'PageviewComponent.dart';

// ignore: camel_case_types
class Onboarding_Screen extends StatefulWidget {
  const Onboarding_Screen({super.key});

  @override
  State<Onboarding_Screen> createState() => _Onboarding_ScreenState();
}

// ignore: camel_case_types
class _Onboarding_ScreenState extends State<Onboarding_Screen> {
  final PageController _controller = PageController();
  bool onlastpage = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: _controller,
            //TODO
            onPageChanged: (value) {
              setState(() {
                onlastpage = (value == 5);
              });
            },
            children: [
              PageviewComponent(
                imgpath:
                    'https://assets8.lottiefiles.com/packages/lf20_piehsefv.json',
                text: 'Activate Your Assistance by Taping the Button Below ',
              ),
              PageviewComponent(
                imgpath:
                    'https://assets6.lottiefiles.com/private_files/lf30_uetcyfgk.json',
                text: 'Meet With Your Voice Assistance ("ALAN")',
              ),
              PageviewComponent(
                imgpath:
                    'https://assets8.lottiefiles.com/private_files/lf30_ykonjgrr.json',
                text: 'Navigate between the Screen',
              ),
              PageviewComponent(
                imgpath:
                    'https://assets1.lottiefiles.com/private_files/lf30_uSbQXr.json',
                text: 'Search Your Food With Your Voice',
              ),
              PageviewComponent(
                imgpath:
                    'https://assets2.lottiefiles.com/datafiles/mJgqrjZG0XgEPTG/data.json',
                text: 'Fast Dilvery Opption ',
              ),
              PageviewComponent(
                imgpath:
                    'https://assets9.lottiefiles.com/packages/lf20_q5z1w81j.json',
                text: 'Dilver To your Location On Time',
              ),
            ],
          ),
          Container(
            alignment: const Alignment(0.0, 0.90),
            child: SmoothPageIndicator(
              controller: _controller,
              count: 6,
              effect: const WormEffect(dotHeight: 10, dotWidth: 10),
            ),
          ),
          Positioned(
            top: 40,
            left: 285,
            child: OutlinedButton(
              style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all(AppColors.Maincolor),
                  foregroundColor: MaterialStateProperty.all(Colors.white)),
              onPressed: () {
                _controller.jumpToPage(5);
              },
              child: const Text('Skip'),
            ),
          ),
          Positioned(
              top: 650,
              left: 155,
              child: GestureDetector(
                child: Container(
                    height: 80,
                    width: 80,
                    decoration: BoxDecoration(
                        color: AppColors.Maincolor,
                        borderRadius: BorderRadius.circular(50)),
                    child: onlastpage
                        ? const Icon(
                            Icons.done,
                            color: Colors.white,
                          )
                        : const Icon(
                            Icons.arrow_forward,
                            color: Colors.white,
                          )),
                onTap: () {
                  onlastpage
                      ? Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const HomeScreen()))
                      : _controller.nextPage(
                          duration: const Duration(seconds: 2),
                          curve: Curves.linear);
                },
              ))
        ],
      ),
    );
  }
}
