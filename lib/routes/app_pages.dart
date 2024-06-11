import 'package:app_no_smoke/bindings/setting_binding.dart';
import 'package:app_no_smoke/bindings/smoke_binding.dart';
import 'package:app_no_smoke/ui/pages/setting_page.dart';
import 'package:app_no_smoke/ui/pages/smoke/smoke_page.dart';
import 'package:get/get.dart';

import '../bindings/splash_binding.dart';
import '../ui/pages/splash/splash_page.dart';

part './app_routes.dart';

abstract class AppPages {
  static final pages = [
    GetPage(
      name: Routes.splash,
      page: () => const SplashPage(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: Routes.smoke,
      page: () => SmokePage(),
      binding: SmokeBinding(),
    ),
    GetPage(
      name: Routes.setting,
      page: () => SettingPage(),
      binding: SettingBinding(),
    ),
  ];
}
