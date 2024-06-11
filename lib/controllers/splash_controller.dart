import 'package:app_no_smoke/utils/const.dart';
import 'package:get/get.dart';

import '../routes/app_pages.dart';

class SplashController extends GetxController with StateMixin<String> {
  final version = Const.version;

  SplashController() {
    change("", status: RxStatus.empty());
  }

  @override
  void onReady() {
    super.onReady();
    continueSplash();
  }

  void continueSplash() async {
    change(null, status: RxStatus.loading());
    try {
      await 1.delay();
      change("Continue splash", status: RxStatus.success());
      Get.offAllNamed(Routes.smoke);
    } catch (er) {
      change(null, status: RxStatus.error(er.toString()));
    }
  }
}
