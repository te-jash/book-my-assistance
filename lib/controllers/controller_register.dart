import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:project/binding_screen.dart';

class ControllerRegister extends GetxController {
  final TextEditingController addController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController ageController = TextEditingController();
  final TextEditingController refController = TextEditingController();
  var gender = ''.obs;
  var genderList = ['Male', 'Female', 'Others'];
  var phone = ''.obs;

  void changePhone(value) {
    phone.value = value;
  }

  var errName = true.obs;
  var errAdd = true.obs;
  var errAge = true.obs;
  var errGender = true.obs;

  void changeGender(value) {
    gender.value = value;
  }

  void chnageErrName(value) {
    errName.value = value;
  }

  void chnageErrAdd(value) {
    errAdd.value = value;
  }

  void chnageErrAge(value) {
    errAge.value = value;
  }

  void chnageErrGender(value) {
    errGender.value = value;
  }

  void onSignupTap() async {
    if (errAdd.value || errName.value || errAge.value || errGender.value) {
      await EasyLoading.showError('Check entered details');
    } else {
      await EasyLoading.show(status: 'Wait a moment');
      Timer(const Duration(seconds: 2), () async {
        await EasyLoading.showSuccess(
            'Done !!\n Welcome ${nameController.text}');
        Get.to(() => BindingScreen(
              name: nameController.text,
            ));
      });
    }
  }

  @override
  void onInit() {
    super.onInit();
    errAge.value = true;
    errAdd.value = true;
    errGender.value = true;
    errName.value = true;
    addController.text = '';
    nameController.text = '';
    ageController.text = '';
    gender.value = 'Gender';
  }

  //Get called when controller is removed from memory
  @override
  void onClose() {
    addController.dispose();
    nameController.dispose();
    ageController.dispose();
    refController.dispose();
    super.onClose();
  }
}
