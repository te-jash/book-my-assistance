// ignore_for_file: prefer_is_empty

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project/const.dart';
import 'package:project/controllers/controller_binding.dart';

class Bookings extends StatelessWidget {
  const Bookings({super.key});

  @override
  Widget build(BuildContext context) {
    final ControllerBinding controllerBinding = Get.put(ControllerBinding());
    return Container(
      height: Get.height,
      width: Get.width,
      color: whiteColor,
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 16),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        const Text(
          "History",
          style: TextStyle(
              fontSize: 18, fontWeight: FontWeight.w700, color: blackColor),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: controllerBinding.bookedEmployee.length,
            itemBuilder: (context, index) {
              if (controllerBinding.bookedEmployee.isEmpty ||
                  controllerBinding.bookedEmployee.length == 0) {
                return const Text(
                  "No data available",
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: blackColor),
                );
              } else {
                return Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: secondaryColor),
                    borderRadius: const BorderRadius.all(Radius.circular(15)),
                    color: const Color.fromARGB(255, 248, 255, 234),
                  ),
                  padding: const EdgeInsets.all(10),
                  margin: const EdgeInsets.symmetric(vertical: 6),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                const CircleAvatar(
                                  backgroundColor: secondaryColor,
                                ),
                                const SizedBox(
                                  width: 20,
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      controllerBinding.bookedEmployee[index]
                                          ['name']!,
                                      style: const TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600),
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    RichText(
                                        text: TextSpan(
                                      text:
                                          '${controllerBinding.bookedEmployee[index]!['experience']!} year Experience',
                                      style: const TextStyle(
                                          color: Color(0xFF727272),
                                          fontSize: 10,
                                          fontWeight: FontWeight.w400),
                                    )),
                                  ],
                                ),
                              ],
                            ),
                            Text(
                              '₹ ${controllerBinding.bookedEmployee[index]!['charges']!}',
                              style: const TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.w600),
                            )
                          ]),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            margin: const EdgeInsets.only(top: 12),
                            padding: const EdgeInsets.symmetric(
                                vertical: 2, horizontal: 12),
                            decoration: const BoxDecoration(
                                color: Colors.green,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(4))),
                            child: const Text(
                              "Hired",
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: whiteColor),
                            ),
                          ),
                          Text(
                            'Date: ${controllerBinding.bookedEmployee[index]!['date']!}',
                            style: const TextStyle(
                                fontSize: 14, fontWeight: FontWeight.w600),
                          )
                        ],
                      )
                    ],
                  ),
                );
              }
            },
          ),
        )
      ]),
    );
  }
}
