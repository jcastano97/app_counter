import 'package:app_no_smoke/language/language.dart';
import 'package:app_no_smoke/routes/app_pages.dart';
import 'package:app_no_smoke/service/setting_service.dart';
import 'package:app_no_smoke/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'database/database.dart';

Future<void> main() async {
  print("main");
  Get.put(await SettingService().init());
  WidgetsFlutterBinding.ensureInitialized();
  Get.put(AppDatabase());

  SettingService settingsService = Get.find<SettingService>();
  runApp(GetMaterialApp(
    title: 'App no smoke',
    debugShowCheckedModeBanner: false,
    locale: Locale(settingsService.languageCode.value),
    fallbackLocale: Locale('en'),
    translations: Languages(),
    initialRoute: Routes.splash,
    theme: AppTheme.light,
    darkTheme: AppTheme.dark,
    themeMode:
        settingsService.darkMode.value ? ThemeMode.dark : ThemeMode.light,
    defaultTransition: Transition.fadeIn,
    getPages: AppPages.pages,
  ));
}
