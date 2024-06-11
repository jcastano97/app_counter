import 'package:app_no_smoke/controllers/smoke/smoke_controller.dart';
import 'package:app_no_smoke/language/language_global_var.dart';
import 'package:app_no_smoke/routes/app_pages.dart';
import 'package:app_no_smoke/ui/components/common/box_scroll.dart';
import 'package:app_no_smoke/ui/components/common/styled_card.dart';
import 'package:app_no_smoke/ui/components/common/styled_text.dart';
import 'package:app_no_smoke/ui/pages/common_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SmokePage extends GetView<SmokeController> {
  const SmokePage({super.key});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    return CommonPage(
      child: Stack(
        children: [
          SizedBox(
            height: screenHeight,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                StyledText.displayLarge(LanguageGlobalVar.smokeTitle.tr),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        Obx(() => StyledCard(
                              name: controller.dayCounter.value.toString(),
                            )),
                        StyledText.labelLarge(LanguageGlobalVar.days.tr)
                      ],
                    ),
                    Column(
                      children: [
                        Obx(() => StyledCard(
                              name: controller.hourCounter.value.toString(),
                            )),
                        StyledText.labelLarge(LanguageGlobalVar.hours.tr)
                      ],
                    ),
                    Column(
                      children: [
                        Obx(() => StyledCard(
                              name: controller.minuteCounter.value.toString(),
                            )),
                        StyledText.labelLarge(LanguageGlobalVar.minutes.tr)
                      ],
                    ),
                    Column(
                      children: [
                        Obx(() => StyledCard(
                              name: controller.secondCounter.value.toString(),
                            )),
                        StyledText.labelLarge(LanguageGlobalVar.seconds.tr)
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                StyledText.headlineLarge(
                  LanguageGlobalVar.smokeAsk.tr,
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        controller.yes();
                      },
                      child: Text(
                        LanguageGlobalVar.yes.tr,
                        style: TextStyle(
                          fontSize: 30,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        controller.no();
                      },
                      child: Text(
                        LanguageGlobalVar.no.tr,
                        style: TextStyle(
                          fontSize: 30,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                controller.data.isNotEmpty
                    ? Obx(() => StyledText.labelLarge(
                            LanguageGlobalVar.lastAnswer.trParams({
                          'date': controller.data.first.createdAt.toString()
                        })))
                    : Container(),
                SizedBox(
                  height: 20,
                ),
                BoxScroll(
                  child: Obx(
                    () => Column(
                      children: controller.data
                          .map((e) => Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  StyledText.labelLarge(e.value
                                      ? LanguageGlobalVar.yes.tr
                                      : LanguageGlobalVar.no.tr),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  StyledText.labelLarge(e.createdAt.toString()),
                                ],
                              ))
                          .toList(),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: 30,
            right: 10,
            child: IconButton(
              onPressed: () {
                Get.toNamed(Routes.setting);
              },
              icon: Icon(
                Icons.settings,
                size: 50,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
