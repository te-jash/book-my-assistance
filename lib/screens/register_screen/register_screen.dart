import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:project/const.dart';
import 'package:project/controllers/controller_register.dart';

class RegisterScreen extends StatelessWidget {
  final String phone;
  const RegisterScreen({super.key, required this.phone});

  @override
  Widget build(BuildContext context) {
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

    final ControllerRegister controllerRegister = Get.put(ControllerRegister());
    controllerRegister.changePhone(phone);
    return SafeArea(
      child: WillPopScope(
        onWillPop: onWillPop,
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          body: Container(
            padding:
                const EdgeInsets.only(left: 0, right: 0, top: 52, bottom: 20),
            height: Get.height,
            width: Get.width,
            decoration: const BoxDecoration(color: whiteColor),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: Column(
                      children: [
                        Container(
                            padding: const EdgeInsets.all(0),
                            width: Get.width * .85,
                            child: const Text(
                              'Signup',
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w600),
                            )),
                        Container(
                            padding: const EdgeInsets.all(0),
                            width: Get.width * .85,
                            child: const Text(
                              'Creat your Sity App Account',
                              style: TextStyle(
                                  fontSize: 12, fontWeight: FontWeight.w500),
                            )),
                        Container(
                          margin: const EdgeInsets.only(top: 25),
                          padding: const EdgeInsets.symmetric(horizontal: 12),
                          alignment: Alignment.center,
                          height: 55,
                          width: Get.width * .85,
                          decoration: BoxDecoration(
                              border: Border.all(color: borderColor),
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
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 5),
                                color: const Color(0xFFE3E3E3),
                              ),
                              Container(
                                color: whiteColor,
                                width: Get.width * .5,
                                child: TextFormField(
                                  readOnly: true,
                                  style: const TextStyle(
                                      color: blackColor,
                                      fontWeight: FontWeight.w400,
                                      fontSize: 14),
                                  keyboardType: TextInputType.phone,
                                  maxLength: 10,
                                  decoration: InputDecoration(
                                    counterText: '',
                                    isDense: true,
                                    hintText: phone,
                                    hintStyle: const TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 14,
                                        color: Color(0xFF2E2E2E)),
                                    border: InputBorder.none,
                                  ),
                                  cursorColor: const Color.fromARGB(0, 0, 0, 0),
                                ),
                              )
                            ],
                          ),
                        ),
                        Obx(
                          () => Container(
                            margin: const EdgeInsets.only(top: 15),
                            alignment: Alignment.centerLeft,
                            height: 55,
                            width: Get.width * .85,
                            child: TextFormField(
                              style: const TextStyle(
                                  letterSpacing: 0,
                                  color: blackColor,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 14),
                              controller: controllerRegister.addController,
                              onChanged: (value) {
                                if (value.isEmpty) {
                                  controllerRegister.chnageErrAdd(true);
                                } else {
                                  controllerRegister.chnageErrAdd(false);
                                }
                              },
                              decoration: InputDecoration(
                                floatingLabelBehavior:
                                    FloatingLabelBehavior.auto,
                                label: const Text('Address'),
                                labelStyle: const TextStyle(
                                    letterSpacing: 0,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 14,
                                    color: Color.fromARGB(255, 168, 168, 168)),
                                counterText: '',
                                isDense: true,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                  borderSide: BorderSide(
                                      color: controllerRegister.errAdd.value
                                          ? errColor
                                          : borderColor),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                  borderSide: BorderSide(
                                      color: controllerRegister.errAdd.value
                                          ? errColor
                                          : borderColor),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                  borderSide: BorderSide(
                                      color: controllerRegister.errAdd.value
                                          ? errColor
                                          : borderColor),
                                ),
                              ),
                              cursorColor: const Color.fromARGB(0, 0, 0, 0),
                            ),
                          ),
                        ),
                        Obx(
                          () => Container(
                            margin: const EdgeInsets.only(top: 15),
                            // padding: const EdgeInsets.symmetric(horizontal: 12),
                            alignment: Alignment.centerLeft,
                            height: 55,
                            width: Get.width * .85,

                            child: TextFormField(
                              style: const TextStyle(
                                  letterSpacing: 0,
                                  color: blackColor,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 14),
                              controller: controllerRegister.nameController,
                              onChanged: (value) {
                                if (value.isEmpty ||
                                    !RegExp(r"^[A-Z a-z]+$").hasMatch(value)) {
                                  controllerRegister.chnageErrName(true);
                                } else {
                                  controllerRegister.chnageErrName(false);
                                }
                              },
                              decoration: InputDecoration(
                                floatingLabelBehavior:
                                    FloatingLabelBehavior.auto,
                                label: const Text('Name'),
                                labelStyle: const TextStyle(
                                    letterSpacing: 0,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 14,
                                    color: Color.fromARGB(255, 168, 168, 168)),
                                counterText: '',
                                isDense: true,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                  borderSide: BorderSide(
                                      color: controllerRegister.errName.value
                                          ? errColor
                                          : borderColor),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                  borderSide: BorderSide(
                                      color: controllerRegister.errName.value
                                          ? errColor
                                          : borderColor),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                  borderSide: BorderSide(
                                      color: controllerRegister.errName.value
                                          ? errColor
                                          : borderColor),
                                ),
                              ),
                              cursorColor: const Color.fromARGB(0, 0, 0, 0),
                            ),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(top: 15),
                          width: Get.width * .85,
                          color: whiteColor,
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Obx(
                                  () => Container(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 12),
                                      alignment: Alignment.centerLeft,
                                      height: 55,
                                      width: Get.width * .4,
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              color: controllerRegister
                                                      .errAge.value
                                                  ? errColor
                                                  : borderColor),
                                          borderRadius:
                                              BorderRadius.circular(12)),
                                      child: TextFormField(
                                        controller:
                                            controllerRegister.ageController,
                                        style: const TextStyle(
                                            letterSpacing: 0,
                                            color: blackColor,
                                            fontWeight: FontWeight.w400,
                                            fontSize:
                                                12), //editing controller of this TextField
                                        decoration: const InputDecoration(
                                          hintText: 'DOB',
                                          isDense: true,
                                          border: InputBorder.none,
                                          iconColor: primaryColor,
                                          fillColor: primaryColor,
                                          focusColor: primaryColor,
                                          icon: Icon(Icons
                                              .cake_rounded), //icon of text field
                                        ),
                                        readOnly: true,

                                        onTap: () async {
                                          DateTime? pickedDate =
                                              await showDatePicker(
                                            context: context,
                                            initialDate: DateTime.now(),
                                            firstDate: DateTime(
                                                1900), //DateTime.now() - not to allow to choose before today.
                                            lastDate: DateTime.now(),
                                            builder: (BuildContext context,
                                                Widget? child) {
                                              return Theme(
                                                data:
                                                    ThemeData.light().copyWith(
                                                  colorScheme:
                                                      const ColorScheme.light(
                                                          primary:
                                                              primaryColor),
                                                ),
                                                child: child!,
                                              );
                                            },
                                          );

                                          if (pickedDate != null) {
                                            String formattedDate =
                                                DateFormat('MM-dd-yyyy')
                                                    .format(pickedDate);

                                            controllerRegister.ageController
                                                .text = formattedDate;
                                            controllerRegister
                                                .chnageErrAge(false);
                                          } else {}
                                        },
                                      )),
                                ),
                                Obx(
                                  () => Container(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 14),
                                      // alignment: Alignment.centerLeft,
                                      height: 55,
                                      width: Get.width * .4,
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              color: controllerRegister
                                                      .errGender.value
                                                  ? errColor
                                                  : borderColor),
                                          borderRadius:
                                              BorderRadius.circular(12)),
                                      child: DropdownButtonHideUnderline(
                                        child: DropdownButton(
                                            borderRadius:
                                                BorderRadius.circular(12),
                                            isDense: true,
                                            hint: Text(
                                              controllerRegister.gender.value,
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: 14,
                                                  color: controllerRegister
                                                              .gender.value !=
                                                          'Gender'
                                                      ? blackColor
                                                      : const Color.fromARGB(
                                                          255, 168, 168, 168)),
                                            ),
                                            icon: const Icon(
                                                Icons.keyboard_arrow_down),
                                            items: controllerRegister.genderList
                                                .map((String items) {
                                              return DropdownMenuItem(
                                                value: items,
                                                child: Text(
                                                  items,
                                                  style: const TextStyle(
                                                      letterSpacing: 0,
                                                      color: blackColor,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      fontSize: 14),
                                                ),
                                              );
                                            }).toList(),
                                            onChanged: ((String? value) {
                                              controllerRegister
                                                  .changeGender(value);
                                              controllerRegister
                                                  .errGender(false);
                                            })),
                                      )),
                                ),
                              ]),
                        ),
                      ],
                    ),
                  ),
                ),
                Column(
                  children: [
                    GestureDetector(
                      onTap: () async {
                        controllerRegister.onSignupTap();
                      },
                      child: Container(
                        margin: const EdgeInsets.only(bottom: 10, top: 25),
                        alignment: Alignment.center,
                        width: Get.width * .85,
                        height: 55,
                        decoration: const BoxDecoration(
                            color: primaryColor,
                            borderRadius:
                                BorderRadius.all(Radius.circular(12))),
                        child: const Text(
                          'Signup',
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: whiteColor),
                        ),
                      ),
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
      ),
    );
  }
}
