import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:book/Features/Authurization/presentation/views/login.view.dart';
import 'package:book/constant.dart';
import 'package:book/core/utils/assets.dart';
import 'package:flutter/material.dart';

class SplashBody extends StatelessWidget {
  const SplashBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 300.0),
            child: Image.asset(AssetsData.logo),
          ),
          const SizedBox(
            height: 5,
          ),
          SizedBox(
            height: 52,
            child: AnimatedSplashScreen(
              backgroundColor: kPrimaryColor,
              animationDuration: const Duration(seconds: 3),
              splashTransition: SplashTransition.slideTransition,
              nextScreen: const Login(),
              splash: const Text(
                'Read Free Books',
              ),
            ),
          )
        ],
      ),
    );
  }
}
