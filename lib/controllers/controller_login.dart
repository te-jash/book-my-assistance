import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ControllerLogin extends GetxController {
  final TextEditingController phoneController = TextEditingController();
  var phone = ''.obs;
  var errPhone = true.obs;
  void changeErrPhonr(value) {
    errPhone.value = value;
  }

  @override
  void onInit() {
    super.onInit();
    errPhone.value = true;
    phoneController.text = '';
  }

  //Get called when controller is removed from memory
  @override
  void onClose() {
    phoneController.dispose();
    super.onClose();
  }
}
