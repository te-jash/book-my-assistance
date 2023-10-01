import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:project/const.dart';
import 'package:project/controllers/controller_login.dart';
import 'package:project/screens/otp_screen/otp_screen.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    final ControllerLogin controllerLogin = Get.put(ControllerLogin());

    Future<bool> onWillPop() async {
      return await showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: const Text('Exit App'),
              content: const Text('Do you want to exit an App?'),
              actions: [
                ElevatedButton(
                  style: const ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(
                          Color.fromARGB(255, 255, 255, 255))),
                  onPressed: () => Get.back(),
                  child: const Text(
                    'No',
                    style: TextStyle(color: blackColor),
                  ),
                ),
                ElevatedButton(
                  style: const ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(whiteColor)),
                  onPressed: () => SystemNavigator.pop(),
                  child: const Text('Yes'),
                ),
              ],
            ),
          ) ??
          false;
    }

    return SafeArea(
        child: WillPopScope(
      onWillPop: onWillPop,
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        body: Container(
          padding:
              const EdgeInsets.only(top: 52, left: 0, right: 0, bottom: 20),
          height: Get.height,
          width: Get.width,
          decoration: const BoxDecoration(color: whiteColor),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                children: [
                  Container(
                      padding: const EdgeInsets.all(0),
                      width: Get.width * .85,
                      child: const Text(
                        'Login',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w600),
                      )),
                  Container(
                      padding: const EdgeInsets.all(0),
                      width: Get.width * .85,
                      child: const Text(
                        'Enter 10 Digit Mobile Number',
                        style: TextStyle(
                            fontSize: 12, fontWeight: FontWeight.w600),
                      )),
                  Obx(
                    () => Container(
                      margin: const EdgeInsets.only(top: 25),
                      padding: const EdgeInsets.symmetric(horizontal: 13),
                      alignment: Alignment.center,
                      height: 55,
                      width: Get.width * .85,
                      decoration: BoxDecoration(
                          border: Border.all(
                              color: controllerLogin.errPhone.value
                                  ? errColor
                                  : borderColor),
                          borderRadius: BorderRadius.circular(12)),
                      child: Row(
                        children: [
                          const Text(
                            '+91',
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: Color(0xFF2E2E2E)),
                          ),
                          Container(
                            height: 30,
                            width: 1.5,
                            margin: const EdgeInsets.symmetric(horizontal: 5),
                            color: const Color(0xFFE3E3E3),
                          ),
                          Container(
                            color: whiteColor,
                            width: Get.width * .5,
                            child: TextFormField(
                              style: const TextStyle(
                                  color: blackColor,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 14),
                              controller: controllerLogin.phoneController,
                              keyboardType: TextInputType.phone,
                              maxLength: 10,
                              onChanged: (value) {
                                if (value.isEmpty ||
                                    value.length != 10 ||
                                    !RegExp(r'^[0-9]+$').hasMatch(value)) {
                                  controllerLogin.changeErrPhonr(true);
                                } else {
                                  controllerLogin.changeErrPhonr(false);
                                }
                              },
                              decoration: const InputDecoration(
                                counterText: '',
                                isDense: true,
                                hintText: "Enter your mobile number",
                                hintStyle: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 14,
                                    color: Color.fromARGB(255, 168, 168, 168)),
                                border: InputBorder.none,
                              ),
                              cursorColor: const Color.fromARGB(0, 0, 0, 0),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  GestureDetector(
                    onTap: () async {
                      if (controllerLogin.errPhone.value) {
                        await EasyLoading.showError(
                            'Please check the entered phone number');
                      } else {
                        await EasyLoading.show(status: 'Sending OTP');
                        Timer(const Duration(seconds: 2), () async {
                          await EasyLoading.dismiss();
                          Get.to(() => OTP(
                                phone: controllerLogin.phoneController.text,
                              ));
                        });
                      }
                    },
                    child: Container(
                      alignment: Alignment.center,
                      width: Get.width * .85,
                      height: 55,
                      decoration: const BoxDecoration(
                          color: primaryColor,
                          borderRadius: BorderRadius.all(Radius.circular(12))),
                      child: const Text(
                        'Continue',
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: whiteColor),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  GestureDetector(
                    child: RichText(
                        text: const TextSpan(
                            text: "By clicking, I accept the ",
                            style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.w400,
                              color: Color(0xFF8F8F8F),
                            ),
                            children: [
                          TextSpan(
                              text: "Terms & Conditions ",
                              style: TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.w600,
                                color: primaryColor,
                              )),
                          TextSpan(
                            text: "& ",
                            style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.w400,
                              color: Color(0xFF8F8F8F),
                            ),
                          ),
                          TextSpan(
                              text: "Privacy Policy ",
                              style: TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.w600,
                                color: primaryColor,
                              )),
                        ])),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    ));
  }
}
