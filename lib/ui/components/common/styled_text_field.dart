import 'package:app_no_smoke/service/setting_service.dart';
import 'package:app_no_smoke/utils/form_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class StyledTextField extends StatelessWidget {
  final settingService = Get.find<SettingService>();
  final TextEditingController controller;
  final String label;
  final bool required;
  final TextInputType keyboardType;

  StyledTextField({
    required this.controller,
    required this.label,
    this.required = false,
    this.keyboardType = TextInputType.text,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        labelText: label.tr,
      ),
      validator: required ? FormUtil.validateRequired : null,
      keyboardType: keyboardType,
      inputFormatters: keyboardType == TextInputType.number
          ? [FilteringTextInputFormatter.digitsOnly]
          : [],
    );
  }
}
