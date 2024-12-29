import 'package:flutter_nasa_apod/src/shared/app_controller.dart';
import 'package:get/get.dart';

class AppBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<AppController>(AppController(), permanent: true);
    // Get.put<ProfileController>(ProfileController(), permanent: true);
  }
}
