import 'package:app_no_smoke/service/setting_service.dart';
import 'package:get/get.dart';

class SettingBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SettingService>(() => SettingService());
  }
}
