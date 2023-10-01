import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project/screens/login_screen/login.dart';

class ControllerOnboard extends GetxController {
  PageController pageController = PageController();
  var pageIndex = 0.obs;
  changePageIndex(value) {
    pageIndex.value = value;
  }

  Future<void> onSkipTap() async {
    Get.to(() => const Login());
  }

  @override
  void onClose() {
    pageController.dispose();
    super.onClose();
  }
}
