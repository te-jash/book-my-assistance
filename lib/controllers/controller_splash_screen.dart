import 'dart:async';
import 'package:get/get.dart';
import 'package:project/screens/onboard_screen/onboard_screen.dart';

class ControllerSplashScreen extends GetxController {
  @override
  void onInit() {
    super.onInit();
    Timer(const Duration(seconds: 2), () {
      Get.to(() => const Onboard());
    });
  }
}
