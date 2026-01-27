import 'package:get/get.dart';
import 'package:resumebuilder/features/splash/screens/splash_screen.dart';
import 'package:resumebuilder/routes/routes.dart';

class UAppRoutes {
  static final screens = [
    GetPage(name: URoutes.splash, page: () => const SplashScreen()),
  ];
}
