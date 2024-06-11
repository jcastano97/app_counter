import 'package:app_no_smoke/service/setting_service.dart';
import 'package:app_no_smoke/utils/form_util.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StyledSelect extends StatelessWidget {
  final settingService = Get.find<SettingService>();
  final RxString controller;
  final String label;
  final List<String> options;
  final bool required;

  StyledSelect({
    required this.controller,
    required this.label,
    this.required = false,
    this.options = const [],
  });

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => DropdownButtonFormField<String>(
        decoration: InputDecoration(
          labelText: label.tr,
        ),
        isExpanded: true,
        value: controller.value != '' ? controller.value : null,
        icon: const Icon(Icons.arrow_downward),
        onChanged: (String? value) {
          controller.value = value ?? '';
        },
        style: settingService.darkMode.value
            ? TextStyle(color: Colors.black)
            : null,
        items: options.map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value.tr),
          );
        }).toList(),
        validator: required ? FormUtil.validateRequired : null,
      ),
    );
  }
}
