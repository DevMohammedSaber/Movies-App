import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:movies_app/routes.dart';
import 'package:movies_app/service/notification.dart';
import 'package:movies_app/utils/bindings/initial_bindinge.dart';
import 'package:movies_app/utils/theme/theme.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

// bool _initialUriIsHandled = false;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  NotificationService().initNotifications();

  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return GetMaterialApp(
          title: 'Zeus Movies',
          debugShowCheckedModeBanner: false,
          themeMode: ThemeMode.system,
          theme: ZAppTheme.lightTheme,
          initialBinding: InitialBindings(),
          darkTheme: ZAppTheme.darkTheme,
          getPages: getPages,
          initialRoute: '/splash',
        );
      },
    );
  }
}
