import 'package:app_no_smoke/language/language_global_var.dart';
import 'package:app_no_smoke/service/setting_service.dart';
import 'package:app_no_smoke/ui/components/common/styled_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'common_page.dart';

class SettingPage extends GetView<SettingService> {
  const SettingPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CommonPage(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            IconButton(
              onPressed: () {
                Get.back();
              },
              icon: Icon(
                Icons.close,
                size: 50,
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            StyledText.labelLarge("${LanguageGlobalVar.language.tr}: "),
            SizedBox(
              width: 10,
            ),
            Get.locale?.languageCode == 'en'
                ? OutlinedButton(
                    onPressed: () {},
                    child: Text(LanguageGlobalVar.english.tr),
                  )
                : ElevatedButton(
                    onPressed: () {
                      controller.setLanguageCode('en');
                    },
                    child: Text(LanguageGlobalVar.english.tr),
                  ),
            SizedBox(
              width: 10,
            ),
            Get.locale?.languageCode == 'es'
                ? OutlinedButton(
                    onPressed: () {},
                    child: Text(LanguageGlobalVar.spanish.tr),
                  )
                : ElevatedButton(
                    onPressed: () {
                      controller.setLanguageCode('es');
                    },
                    child: Text(LanguageGlobalVar.spanish.tr),
                  ),
          ],
        ),
        SizedBox(
          height: 10,
        ),
        Obx(
          () => Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              StyledText.labelLarge("${LanguageGlobalVar.darkMode.tr}: "),
              SizedBox(
                width: 10,
              ),
              controller.darkMode.value
                  ? OutlinedButton(
                      onPressed: () {},
                      child: Text(LanguageGlobalVar.yes.tr),
                    )
                  : ElevatedButton(
                      onPressed: () {
                        controller.toggleDarkMode();
                      },
                      child: Text(LanguageGlobalVar.yes.tr),
                    ),
              SizedBox(
                width: 10,
              ),
              !controller.darkMode.value
                  ? OutlinedButton(
                      onPressed: () {},
                      child: Text(LanguageGlobalVar.no.tr),
                    )
                  : ElevatedButton(
                      onPressed: () {
                        controller.toggleDarkMode();
                      },
                      child: Text(LanguageGlobalVar.no.tr),
                    ),
            ],
          ),
        ),
      ],
    ));
  }
}
