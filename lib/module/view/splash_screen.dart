import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/module/view/home/home.dart';
import 'package:movies_app/utils/constants/colors.dart';
import 'package:movies_app/utils/helpers/helper_functions.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = ZHelperFunctions.isDarkMode(context);
    return Scaffold(
      body: Center(
        child: AnimatedSplashScreen(
          duration: 1500,
          splash: Image.asset(
            'assets/images/logo.png',
            filterQuality: FilterQuality.high,
          ),
          nextScreen: const HomeScreen(),
          splashTransition: SplashTransition.slideTransition,
          animationDuration: const Duration(seconds: 2),
          backgroundColor: isDark ? ZColors.dark : ZColors.light,
        ),
      ),
    );
  }
}
