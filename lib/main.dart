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

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  MyAppState createState() => MyAppState();
}

class MyAppState extends State<MyApp> with SingleTickerProviderStateMixin {
  // StreamSubscription? _sub;

  // @override
  // void initState() {
  //   super.initState();
  //   _handleIncomingLinks();
  //   _handleInitialUri();
  // }

  // @override
  // void dispose() {
  //   _sub?.cancel();
  //   super.dispose();
  // }

  // void _handleIncomingLinks() {
  //   if (!kIsWeb) {
  //     _sub = uriLinkStream.listen((Uri? uri) {
  //       if (!mounted) return;
  //       print('got uri: $uri');
  //       if (uri!.path.isNotEmpty) {
  //         Get.toNamed(Routes.detailsScreen, arguments: {'id': uri.path});
  //       } else {
  //         Get.offNamed(Routes.homeScreen);
  //       }
  //     }, onError: (Object err) {
  //       if (!mounted) return;
  //       print('got err: $err');
  //     });
  //   }
  // }

  // Future<void> _handleInitialUri() async {
  //   if (!_initialUriIsHandled) {
  //     _initialUriIsHandled = true;
  //     try {
  //       final uri = await getInitialUri();

  //       print('got initial uri: $uri');
  //       if (!mounted) return;
  //     } on PlatformException {
  //       print('falied to get initial uri');
  //     } on FormatException catch (err) {
  //       if (!mounted) return;
  //       print('malformed initial uri $err');
  //     }
  //   }
  // }

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
