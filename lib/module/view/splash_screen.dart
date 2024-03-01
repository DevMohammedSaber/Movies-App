import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movies_app/routes.dart';
import 'package:movies_app/service/deep_links.dart';
import 'package:movies_app/utils/helpers/helper_functions.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    screenRedirection();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final isDark = ZHelperFunctions.isDarkMode(context);

    return Scaffold(
      body: Center(
        child: Image.asset(
          'assets/images/logo.png',
          width: 150,
          filterQuality: FilterQuality.high,
        ),
      ),
    );
  }
}

screenRedirection() async {
  Future.delayed(const Duration(seconds: 2), () {
    if (DeepLinksService.instance.haveUri) {
      Get.offNamed(Routes.homeScreen);
      Get.toNamed(
        Routes.detailsScreen,
        arguments: {'id': DeepLinksService.instance.currentUri!.path},
      );
    } else {
      Get.offNamed(Routes.homeScreen);
    }
  });
}
