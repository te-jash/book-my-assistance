// ignore_for_file: non_constant_identifier_names

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:project/const.dart';
import 'package:project/controllers/controller_binding.dart';

final ControllerBinding controllerBinding = Get.put(ControllerBinding());
widget_dialog(context, int index) {
  return showDialog(
    context: context,
    builder: (BuildContext context) {
      return Dialog(
          child: Container(
        padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              'Select Date',
              style: TextStyle(
                  fontSize: 14,
                  color: primaryColor,
                  fontWeight: FontWeight.w600),
            ),
            // Container(
            //   margin: const EdgeInsets.only(top: 15),
            //   // padding: const EdgeInsets.symmetric(horizontal: 12),
            //   alignment: Alignment.centerLeft,
            //   height: 55,
            //   width: Get.width * .85,

            //   child: TextFormField(
            //     style: const TextStyle(
            //         letterSpacing: 0,
            //         color: blackColor,
            //         fontWeight: FontWeight.w400,
            //         fontSize: 14),
            //     // controller: signupController.nameController,
            //     onChanged: (value) {},
            //     decoration: InputDecoration(
            //       floatingLabelBehavior: FloatingLabelBehavior.auto,
            //       label: const Text('Label name'),
            //       labelStyle: const TextStyle(
            //           letterSpacing: 0,
            //           fontWeight: FontWeight.w400,
            //           fontSize: 14,
            //           color: Color.fromARGB(255, 168, 168, 168)),
            //       counterText: '',
            //       isDense: true,
            //       border: OutlineInputBorder(
            //         borderRadius: BorderRadius.circular(12),
            //         borderSide: const BorderSide(color: borderColor),
            //       ),
            //       focusedBorder: OutlineInputBorder(
            //         borderRadius: BorderRadius.circular(12),
            //         borderSide: const BorderSide(color: borderColor),
            //       ),
            //       enabledBorder: OutlineInputBorder(
            //         borderRadius: BorderRadius.circular(12),
            //         borderSide: const BorderSide(color: borderColor),
            //       ),
            //     ),
            //     cursorColor: const Color.fromARGB(0, 0, 0, 0),
            //   ),
            // ),

            Container(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                alignment: Alignment.centerLeft,
                height: 55,
                width: Get.width * .85,
                decoration: BoxDecoration(
                    border: Border.all(color: borderColor),
                    borderRadius: BorderRadius.circular(12)),
                child: TextFormField(
                  controller: controllerBinding.dateController,
                  style: const TextStyle(
                      letterSpacing: 0,
                      color: blackColor,
                      fontWeight: FontWeight.w400,
                      fontSize: 12), //editing controller of this TextField
                  decoration: const InputDecoration(
                    hintText: 'Date',
                    isDense: true,
                    border: InputBorder.none,
                    iconColor: primaryColor,
                    fillColor: primaryColor,
                    focusColor: primaryColor,
                    icon: Icon(Icons.calendar_today), //icon of text field
                  ),
                  readOnly: true,

                  onTap: () async {
                    DateTime? pickedDate = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now().add(const Duration(days: 1)),
                      firstDate: DateTime(DateTime.now()
                          .add(const Duration(days: 1))
                          .year), //DateTime.now() - not to allow to choose before today.
                      lastDate: DateTime.now().add(const Duration(days: 10)),
                      builder: (BuildContext context, Widget? child) {
                        return Theme(
                          data: ThemeData.light().copyWith(
                            colorScheme:
                                const ColorScheme.light(primary: primaryColor),
                          ),
                          child: child!,
                        );
                      },
                    );

                    if (pickedDate != null) {
                      String formattedDate =
                          DateFormat('MM-dd-yyyy').format(pickedDate);

                      controllerBinding.employee[index]['date'] = formattedDate;

                      controllerBinding.dateController.text = formattedDate;
                    } else {}
                  },
                )),
            GestureDetector(
              onTap: () async {
                if (controllerBinding.dateController.text.isNotEmpty) {
                  await EasyLoading.show(status: 'Hold on');
                  // var data = controllerBinding.employee[index];
                  controllerBinding.bookedEmployee
                      .add(controllerBinding.employee[index]);
                  controllerBinding.employee
                      .remove(controllerBinding.employee[index]);

                  Timer(const Duration(seconds: 2), () async {
                    Get.back();
                    Get.back();
                    controllerBinding.changeCurrentIndex(1);
                    await EasyLoading.showSuccess('Done');
                  });
                } else {
                  await EasyLoading.showError('Please select date');
                }
              },
              child: Container(
                margin: const EdgeInsets.only(bottom: 10, top: 25),
                alignment: Alignment.center,
                width: Get.width * .85,
                height: 55,
                decoration: const BoxDecoration(
                    color: primaryColor,
                    borderRadius: BorderRadius.all(Radius.circular(12))),
                child: const Text(
                  'Hire',
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: whiteColor),
                ),
              ),
            ),
          ],
        ),
      ));
    },
  );
}
