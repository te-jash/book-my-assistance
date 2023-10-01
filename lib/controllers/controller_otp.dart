import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ControllerOTP extends GetxController {
  final TextEditingController otpController = TextEditingController();

  var errOTP = true.obs;
  void changeErrOTP(value) {
    errOTP.value = value;
  }

  var i = 60.obs;
  var resend = false.obs;
  Timer? time;
  var loading = false.obs;

  @override
  void onInit() {
    super.onInit();

    i.value = 60;
    resend.value = false;
    time = Timer.periodic(const Duration(seconds: 1), (timer) {
      --i.value;
      if (timer.tick == 60) {
        resend.value = true;
        timer.cancel();
      }
    });
    errOTP.value = true;
    otpController.text = '';
    loading.value = false;
  }

  //Get called when controller is removed from memory
  @override
  void onClose() {
    otpController.dispose();
    time!.cancel();
    super.onClose();
  }
}
