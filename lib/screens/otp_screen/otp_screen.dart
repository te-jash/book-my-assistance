import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:project/const.dart';
import 'package:project/controllers/controller_otp.dart';
import 'package:project/screens/login_screen/login.dart';
import 'package:project/screens/register_screen/register_screen.dart';

class OTP extends StatelessWidget {
  final String phone;
  const OTP({super.key, required this.phone});

  @override
  Widget build(BuildContext context) {
    final ControllerOTP controllerOTP = Get.put(ControllerOTP());

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

    return WillPopScope(
      onWillPop: onWillPop,
      child: SafeArea(
        child: Scaffold(
          resizeToAvoidBottomInset: true,
          body: Container(
            padding:
                const EdgeInsets.only(left: 0, right: 0, top: 52, bottom: 20),
            height: Get.height,
            width: Get.width,
            decoration: const BoxDecoration(color: whiteColor),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Container(
                        margin: const EdgeInsets.only(bottom: 8),
                        padding: const EdgeInsets.all(0),
                        width: Get.width * .85,
                        child: const Text(
                          'Verify your number',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w600),
                        )),
                    Container(
                        padding: const EdgeInsets.all(0),
                        width: Get.width * .85,
                        child: Row(
                          children: [
                            Text(
                              'OTP Sent to $phone  ',
                              style: const TextStyle(
                                  fontSize: 12, fontWeight: FontWeight.w500),
                            ),
                            GestureDetector(
                              onTap: () => Get.to(() => const Login()),
                              child: const Text(
                                'Edit number ',
                                style: TextStyle(
                                    color: primaryColor,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                            GestureDetector(
                                onTap: () => Get.to(() => const Login()),
                                child: const Icon(
                                  color: primaryColor,
                                  Icons.edit_outlined,
                                  size: 14,
                                )),
                          ],
                        )),
                    Obx(
                      () => Container(
                          margin: const EdgeInsets.only(top: 25, bottom: 15),
                          padding: const EdgeInsets.all(0),
                          width: Get.width * .85,
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 12),
                            alignment: Alignment.centerLeft,
                            height: 55,
                            width: Get.width * .8,
                            decoration: BoxDecoration(
                                border: Border.all(
                                    color: controllerOTP.errOTP.value
                                        ? errColor
                                        : borderColor),
                                borderRadius: BorderRadius.circular(12)),
                            child: TextFormField(
                              style: const TextStyle(
                                  letterSpacing: 10,
                                  color: blackColor,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 14),
                              controller: controllerOTP.otpController,
                              keyboardType: TextInputType.phone,
                              maxLength: 6,
                              onChanged: (value) {
                                if (value.isEmpty ||
                                    value.length != 6 ||
                                    !RegExp(r"^[0-9]+$").hasMatch(value)) {
                                  controllerOTP.changeErrOTP(true);
                                } else {
                                  controllerOTP.changeErrOTP(false);
                                }
                              },
                              decoration: const InputDecoration(
                                counterText: '',
                                isDense: true,
                                hintText: "Enter 6 digit OTP",
                                hintStyle: TextStyle(
                                    letterSpacing: 0,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 14,
                                    color: Color.fromARGB(255, 168, 168, 168)),
                                border: InputBorder.none,
                              ),
                              cursorColor: const Color.fromARGB(0, 0, 0, 0),
                            ),
                          )),
                    ),
                    Container(
                      margin: const EdgeInsets.only(bottom: 0),
                      width: Get.width * .85,
                      child: Row(
                        children: [
                          const Text("Didn’t receive the OTP ?",
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                                color: Color(0xFF000000),
                              )),
                          GestureDetector(
                            onTap: () {
                              if (controllerOTP.resend.value) {
                                controllerOTP.i.value = 60;
                                // controllerOTP.sendToOTP(phone);
                                controllerOTP.onInit();
                              }
                            },
                            child: Obx(
                              () => Text(
                                  controllerOTP.resend.value
                                      ? ' Resend'
                                      : ' Resend in ${(controllerOTP.i.value).toString()} sec',
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                    color: controllerOTP.resend.value
                                        ? primaryColor
                                        : const Color(0xFF000000),
                                  )),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                Column(
                  children: [
                    Container(
                        padding: const EdgeInsets.all(0),
                        width: Get.width * .85,
                        child: GestureDetector(
                          onTap: () async {
                            if (controllerOTP.errOTP.value) {
                              await EasyLoading.showError(
                                  'OTP must be of 6 digit');
                            } else {
                              await EasyLoading.show(status: 'Verifying OTP');
                              Timer(const Duration(seconds: 2), () async {
                                await EasyLoading.showSuccess('Verified');
                                Get.to(() => RegisterScreen(phone: phone));
                              });
                            }
                            // controllerOTP.onVerifyTap();
                          },
                          child: Container(
                            alignment: Alignment.center,
                            width: Get.width * .75,
                            height: 55,
                            decoration: const BoxDecoration(
                                color: primaryColor,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(12))),
                            child: const Text(
                              'Verify',
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                  color: whiteColor),
                            ),
                          ),
                        )),
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
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
