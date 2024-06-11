import 'package:app_no_smoke/service/setting_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

final class CommonPage extends StatelessWidget {
  final settingService = Get.find<SettingService>();
  late final Widget _child;

  CommonPage({required Widget child}) {
    _child = child;
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    return LayoutBuilder(builder: (context, constraints) {
      return Scaffold(
        body: ConstrainedBox(
          constraints: BoxConstraints(maxHeight: screenHeight),
          child: SingleChildScrollView(
            controller: settingService.scrollController,
            physics: const ClampingScrollPhysics(),
            padding: const EdgeInsets.all(15),
            child: Container(
              color: Theme.of(context).scaffoldBackgroundColor,
              child: _child,
            ),
          ),
        ),
      );
    });
  }
}
