import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:movies_app/module/view/details/details_screen.dart';
import 'package:movies_app/module/view/home/home.dart';
import 'package:movies_app/module/view/splash_screen.dart';

class Routes {
  static String splashScreen = '/splash';
  static String homeScreen = '/home';
  static String detailsScreen = '/details';
}

final getPages = [
  GetPage(
    name: Routes.splashScreen,
    page: () => const SplashScreen(),
  ),
  GetPage(
    name: Routes.homeScreen,
    page: () => const HomeScreen(),
  ),
  GetPage(
    name: Routes.detailsScreen,
    page: () => const DetailsScreen(),
  ),
];
