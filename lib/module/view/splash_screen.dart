import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movies_app/routes.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> animation;
  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      value: .1,
      duration: const Duration(seconds: 3),
      vsync: this,
    );

    animation = CurvedAnimation(
      parent: controller,
      curve: Curves.easeInOut,
    );
    controller.forward();
    creenRedirection();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  creenRedirection() async {
    Future.delayed(const Duration(seconds: 3), () {
      Get.offNamed(Routes.homeScreen);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: AnimatedSize(
          duration: const Duration(seconds: 3),
          curve: Curves.bounceInOut,
          child: FadeTransition(
            opacity: animation,
            child: Image.asset(
              'assets/images/logo.png',
              height: 90,
              filterQuality: FilterQuality.high,
            ),
          ),
        ),
      ),
    );
  }
}
