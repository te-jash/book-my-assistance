import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:project/const.dart';
import 'package:project/controllers/controller_binding.dart';
import 'package:project/screens/select_employee/select_employee.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ControllerBinding controllerBinding = Get.put(ControllerBinding());
    return Container(
      height: Get.height,
      width: Get.width,
      color: whiteColor,
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 250,
              color: whiteColor,
              child: Stack(
                alignment: Alignment.topCenter,
                children: [
                  Container(
                    height: 180,
                    width: Get.width,
                    color: borderColor,
                  ),
                  Positioned(
                    top: 120,
                    child: Container(
                      height: 120,
                      width: Get.width * .9,
                      decoration: const BoxDecoration(
                          color: borderColor,
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.elliptical(15, 15),
                              bottomRight: Radius.elliptical(15, 15))),
                    ),
                  ),
                  Positioned(
                    top: 120,
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 26),
                      alignment: Alignment.centerLeft,
                      height: 110,
                      width: Get.width * .9,
                      decoration: const BoxDecoration(
                          color: primaryColor,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.elliptical(15, 15),
                            topRight: Radius.elliptical(15, 15),
                            bottomLeft: Radius.elliptical(2, 15),
                            bottomRight: Radius.elliptical(2, 15),
                          )),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Hello ${controllerBinding.name.value}",
                            style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w700,
                                color: whiteColor),
                          ),
                          const Text(
                            "What you’re looking for today?",
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: whiteColor),
                          )
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    top: 40,
                    child: Container(
                      height: 41,
                      width: Get.width * .9,
                      color: const Color.fromARGB(0, 255, 255, 255),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Let's Explore",
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w700,
                                color: blackColor),
                          ),
                          CircleAvatar(
                            backgroundColor: secondaryColor,
                            child: Icon(FontAwesomeIcons.person),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: const EdgeInsets.only(right: 10),
                  height: 1,
                  width: Get.width * .20,
                  color: const Color.fromARGB(255, 125, 125, 125),
                ),
                const Text(
                  "Today, I’d like to book",
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: blackColor),
                ),
                Container(
                  margin: const EdgeInsets.only(left: 10),
                  height: 1,
                  width: Get.width * .20,
                  color: const Color.fromARGB(255, 125, 125, 125),
                ),
              ],
            ),
            const SizedBox(
              height: 33,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: () {
                    Get.to(() => const SelectEmployee(
                          service: 'Spa',
                        ));
                  },
                  child: Column(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(bottom: 10),
                        height: 56,
                        width: 56,
                        decoration: BoxDecoration(
                            color: const Color(0xFFEFF1FF),
                            borderRadius: BorderRadius.circular(16)),
                        child: const Icon(Icons.spa, color: primaryColor),
                      ),
                      const Text(
                        'Spa',
                        style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.w500,
                            color: blackColor),
                      )
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Get.to(() => const SelectEmployee(
                          service: 'Grooming',
                        ));
                  },
                  child: Column(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(bottom: 10),
                        height: 56,
                        width: 56,
                        decoration: BoxDecoration(
                            color: const Color(0xFFEFF1FF),
                            borderRadius: BorderRadius.circular(16)),
                        child: const Icon(FontAwesomeIcons.scissors,
                            color: primaryColor),
                      ),
                      const Text(
                        'Grooming',
                        style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.w500,
                            color: blackColor),
                      )
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Get.to(() => const SelectEmployee(
                          service: 'Cook',
                        ));
                  },
                  child: Column(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(bottom: 10),
                        height: 56,
                        width: 56,
                        decoration: BoxDecoration(
                            color: const Color(0xFFEFF1FF),
                            borderRadius: BorderRadius.circular(16)),
                        child: const Icon(FontAwesomeIcons.bowlFood,
                            color: primaryColor),
                      ),
                      const Text(
                        'Cook',
                        style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.w500,
                            color: blackColor),
                      )
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Get.to(() => const SelectEmployee(
                          service: 'Cleaner',
                        ));
                  },
                  child: Column(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(bottom: 10),
                        height: 56,
                        width: 56,
                        decoration: BoxDecoration(
                            color: const Color(0xFFEFF1FF),
                            borderRadius: BorderRadius.circular(16)),
                        child: const Icon(FontAwesomeIcons.bucket,
                            color: primaryColor),
                      ),
                      const Text(
                        'Cleaner',
                        style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.w500,
                            color: blackColor),
                      )
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 27,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: () {
                    Get.to(() => const SelectEmployee(
                          service: 'Servicing',
                        ));
                  },
                  child: Column(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(bottom: 10),
                        height: 56,
                        width: 56,
                        decoration: BoxDecoration(
                            color: const Color(0xFFEFF1FF),
                            borderRadius: BorderRadius.circular(16)),
                        child: const Icon(FontAwesomeIcons.bolt,
                            color: primaryColor),
                      ),
                      const Text(
                        'Servicing',
                        style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.w500,
                            color: blackColor),
                      )
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Get.to(() => const SelectEmployee(
                          service: 'Day care',
                        ));
                  },
                  child: Column(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(bottom: 10),
                        height: 56,
                        width: 56,
                        decoration: BoxDecoration(
                            color: const Color(0xFFEFF1FF),
                            borderRadius: BorderRadius.circular(16)),
                        child: const Icon(FontAwesomeIcons.baby,
                            color: primaryColor),
                      ),
                      const Text(
                        'Day care',
                        style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.w500,
                            color: blackColor),
                      )
                    ],
                  ),
                ),
                GestureDetector(
                  child: Column(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(bottom: 10),
                        height: 56,
                        width: 56,
                        decoration: BoxDecoration(
                            color: whiteColor,
                            borderRadius: BorderRadius.circular(16)),
                        // child: const Icon(FontAwesomeIcons.bowlFood,
                        //     color: primaryColor),
                      ),
                      const Text(
                        '',
                        style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.w500,
                            color: blackColor),
                      )
                    ],
                  ),
                ),
                GestureDetector(
                  child: Column(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(bottom: 10),
                        height: 56,
                        width: 56,
                        decoration: BoxDecoration(
                            color: whiteColor,
                            borderRadius: BorderRadius.circular(16)),
                        // child: const Icon(FontAwesomeIcons.cartShopping,
                        //     color: primaryColor),
                      ),
                      const Text(
                        '',
                        style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.w500,
                            color: blackColor),
                      )
                    ],
                  ),
                ),
              ],
            ),
            GestureDetector(
              onTap: () {
                // Get.to(() => const AffilateOnboard());
              },
              child: Container(
                margin: const EdgeInsets.only(top: 34),
                height: 70,
                width: Get.width * .85,
                decoration: BoxDecoration(
                    color: primaryColor,
                    borderRadius: BorderRadius.circular(11)),
                child: Stack(alignment: Alignment.center, children: [
                  Positioned(
                      top: -45,
                      right: -45,
                      child: Container(
                        width: 81,
                        height: 81,
                        decoration: const BoxDecoration(
                            color: Color.fromARGB(86, 255, 255, 255),
                            shape: BoxShape.circle),
                      )),
                  Positioned(
                      left: 17,
                      child: ShaderMask(
                        shaderCallback: (Rect bounds) {
                          return const LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [Colors.red, Colors.orange],
                          ).createShader(bounds);
                        },
                        child: const Icon(
                          FontAwesomeIcons.chessKing,
                          color: Colors.white,
                          // size: 60.0,
                        ),
                      )),
                  Positioned(
                      left: 56,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Refer & Earn',
                            style: TextStyle(
                                color: whiteColor,
                                fontSize: 14,
                                fontWeight: FontWeight.w700),
                          ),
                          const SizedBox(
                            height: 2,
                          ),
                          RichText(
                              text: const TextSpan(
                            text: 'Invite & earn rewards',
                            style: TextStyle(
                                color: whiteColor,
                                fontSize: 10,
                                fontWeight: FontWeight.w400),
                          ))
                        ],
                      )),
                  Positioned(
                      right: 10,
                      bottom: 2,
                      child: IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.arrow_forward_rounded,
                          color: whiteColor,
                        ),
                      ))
                ]),
              ),
            ),
            const SizedBox(
              height: 33,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: const EdgeInsets.only(right: 10),
                  height: 1,
                  width: Get.width * .20,
                  color: const Color.fromARGB(255, 125, 125, 125),
                ),
                const Text(
                  "Explore offers",
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: blackColor),
                ),
                Container(
                  margin: const EdgeInsets.only(left: 10),
                  height: 1,
                  width: Get.width * .20,
                  color: const Color.fromARGB(255, 125, 125, 125),
                ),
              ],
            ),
            const SizedBox(
              height: 33,
            ),
          ],
        ),
      ),
    );
  }
}
