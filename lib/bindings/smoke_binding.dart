import 'package:app_no_smoke/controllers/smoke/smoke_controller.dart';
import 'package:get/get.dart';

class SmokeBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SmokeController>(() => SmokeController());
  }
}
