import 'package:app_no_smoke/language/language_global_var.dart';
import 'package:app_no_smoke/routes/app_pages.dart';
import 'package:app_no_smoke/service/setting_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CommonMenu extends StatelessWidget {
  static List<Map<String, Object>> navigationItemIndex = [
    {
      'route': Routes.setting,
      'icon': Icons.settings,
      'label': LanguageGlobalVar.settings.tr,
    },
  ];

  final settingService = Get.find<SettingService>();

  final double constrainMaxWidth;

  CommonMenu({required this.constrainMaxWidth});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Obx(
        () => NavigationRail(
          extended: constrainMaxWidth >= 600,
          destinations: navigationItemIndex
              .map((n) => NavigationRailDestination(
                    icon: Icon(n['icon'] as IconData?),
                    label: Text(n['label'] as String),
                  ))
              .toList(),
          selectedIndex: settingService.navigationSelectedIndex.value,
          onDestinationSelected: (value) {
            settingService.setNavigationSelectedIndex(value);
          },
        ),
      ),
    );
  }
}
