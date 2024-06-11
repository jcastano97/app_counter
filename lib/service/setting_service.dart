import 'package:app_no_smoke/ui/components/common/common_menu.dart';
import 'package:app_no_smoke/utils/const.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class SettingService extends GetxService {
  final version = Const.version;
  late final RxString languageCode = Const.defaultLanguage.obs;
  late final RxBool darkMode = Const.defaultDarkMode.obs;
  final navigationSelectedIndex = 0.obs;
  final ScrollController scrollController = ScrollController();

  Future<SettingService> init() async {
    await GetStorage.init();
    languageCode.value =
        GetStorage().read('languageCode') ?? Const.defaultLanguage;
    darkMode.value = GetStorage().read('darkMode') ?? Const.defaultDarkMode;
    return this;
  }

  void setLanguageCode(String language) {
    languageCode.value = language;
    Get.updateLocale(Locale(language));
    GetStorage().write('languageCode', language);
  }

  void toggleDarkMode() {
    Get.changeThemeMode(darkMode.value ? ThemeMode.light : ThemeMode.dark);
    GetStorage().write('darkMode', !darkMode.value);
    darkMode.value = !darkMode.value;
  }

  void setNavigationSelectedIndex(int selectedIndex) {
    navigationSelectedIndex.value = selectedIndex;
    print(
        'setNavigationSelectedIndex : ${CommonMenu.navigationItemIndex[selectedIndex]['route'] as String}');
    Get.offAllNamed(
        CommonMenu.navigationItemIndex[selectedIndex]['route'] as String);
  }

  void goTo(String route) {
    for (int i = 0; i < CommonMenu.navigationItemIndex.length; i++) {
      var item = CommonMenu.navigationItemIndex[i];
      if (item['route'] as String == route) {
        navigationSelectedIndex.value = i;
        Get.offAllNamed(route);
      }
    }
  }
}

class NavigationItem {
  late final String route;
  late final IconData icon;
  late final String label;
  NavigationItem(
      {required this.route, required this.icon, required this.label});
}
