// ignore: file_names
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:fyp/Screen/Login%20And%20SignUp/LoginScreen.dart';
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
    return Material(
      child: Stack(
        children: [
          PageView(
            controller: _controller,
            //TODO
            onPageChanged: (value) {
              setState(() {
                onlastpage = (value == 2);
              });
            },
            children: [
              PageviewComponent(
                  imgpath: 'Assets/Images/voice_assistance.png',
                  text: 'Search your food with your voice',
                  description: 'khan'),
              PageviewComponent(
                  imgpath: 'Assets/Images/Voice.png',
                  text: 'Search your food',
                  description: 'khan'),
              PageviewComponent(
                  imgpath: 'Assets/Images/Voice ass hand.png',
                  text: 'Search your food',
                  description: 'khan'),
            ],
          ),
          Container(
            alignment: const Alignment(0.0, 0.90),
            child: SmoothPageIndicator(
              controller: _controller,
              count: 3,
              effect: const WormEffect(dotHeight: 10, dotWidth: 10),
            ),
          ),
          Positioned(
            top: 40,
            left: 285,
            child: OutlinedButton(
              onPressed: () {
                _controller.jumpToPage(2);
              },
              child: const Text('Skip'),
            ),
          ),
          Positioned(
              top: 670,
              left: 285,
              child: OutlinedButton(
                  onPressed: () {
                    onlastpage
                        ? Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const HomeScreen()))
                        : _controller.nextPage(
                            duration: const Duration(seconds: 2),
                            curve: Curves.linear);
                  },
                  child: onlastpage ? const Text('Done') : const Text('Next')))
        ],
      ),
    );
  }
}
