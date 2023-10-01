import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:project/const.dart';
import 'package:project/controllers/controller_onboard_screen.dart';

class Onboard extends StatelessWidget {
  const Onboard({super.key});

  @override
  Widget build(BuildContext context) {
    final ControllerOnboard controllerOnboard = Get.put(ControllerOnboard());

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
          body: Container(
            height: Get.height,
            width: Get.width,
            color: whiteColor,
            child: Stack(
              alignment: Alignment.center,
              children: [
                Positioned(
                    bottom: 100,
                    child: GestureDetector(
                      onTap: () async {
                        // signupController.onSignupTap();
                      },
                      child: Container(
                          alignment: Alignment.center,
                          width: Get.width * .85,
                          height: 55,
                          decoration: const BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(12))),
                          child: Obx(() => DotsIndicator(
                                onTap: (position) {
                                  controllerOnboard.changePageIndex(position);
                                },
                                dotsCount: 4,
                                position: controllerOnboard.pageIndex.value,
                                decorator: const DotsDecorator(
                                    color: Color.fromARGB(
                                        171, 188, 188, 188), // Inactive color
                                    activeColor: primaryColor,
                                    activeSize: Size.square(10)),
                              ))),
                    )),
                Container(
                  width: Get.width,
                  height: Get.height,
                  color: const Color.fromARGB(0, 0, 0, 0),
                  child: PageView(
                    controller: controllerOnboard.pageController,
                    onPageChanged: (value) {
                      controllerOnboard.changePageIndex(value);
                    },
                    physics: const BouncingScrollPhysics(),
                    children: [
                      Container(
                        margin: const EdgeInsets.symmetric(
                            vertical: 165, horizontal: 43),
                        child: const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 29,
                            ),
                            Text(
                              'Cleanliness\nOne Click Away',
                              style: TextStyle(
                                color: blackColor,
                                fontSize: 30,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Text(
                              'Cleaning',
                              style: TextStyle(
                                color: Color(0xFFFB8B24),
                                fontSize: 19,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(
                            vertical: 165, horizontal: 43),
                        child: const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Image.asset('assets/images/onboard2.png'),
                            SizedBox(
                              height: 29,
                            ),
                            Text(
                              'Unlock Your Best\nLook',
                              style: TextStyle(
                                color: blackColor,
                                fontSize: 30,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Text(
                              'Grooming',
                              style: TextStyle(
                                color: Color(0xFFFB8B24),
                                fontSize: 19,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(
                            vertical: 165, horizontal: 43),
                        child: const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 29,
                            ),
                            Text(
                              'Your Appliance\nOur Priority',
                              style: TextStyle(
                                color: blackColor,
                                fontSize: 30,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Text(
                              'Servicing',
                              style: TextStyle(
                                color: Color(0xFFFB8B24),
                                fontSize: 19,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(
                            vertical: 165, horizontal: 43),
                        child: const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 29,
                            ),
                            Text(
                              'Discover the\nJoy of Seamless\nServices',
                              style: TextStyle(
                                color: blackColor,
                                fontSize: 30,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Text(
                              '& many more with Us',
                              style: TextStyle(
                                color: Color(0xFFFB8B24),
                                fontSize: 19,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  right: 26,
                  top: 30,
                  child: TextButton(
                    onPressed: () {
                      controllerOnboard.onSkipTap();
                    },
                    child: const Text(
                      'Skip >',
                      style: TextStyle(
                          fontSize: 11,
                          fontWeight: FontWeight.w600,
                          color: blackColor),
                    ),
                  ),
                ),
                Positioned(
                    bottom: 40,
                    child: GestureDetector(
                      onTap: () async {
                        if (controllerOnboard.pageIndex.value == 0) {
                          controllerOnboard.changePageIndex(1);
                          controllerOnboard.pageController.animateToPage(1,
                              duration: const Duration(milliseconds: 500),
                              curve: Curves.linear);
                        } else if (controllerOnboard.pageIndex.value == 1) {
                          controllerOnboard.changePageIndex(2);
                          controllerOnboard.pageController.animateToPage(2,
                              duration: const Duration(milliseconds: 500),
                              curve: Curves.linear);
                        } else if (controllerOnboard.pageIndex.value == 2) {
                          controllerOnboard.changePageIndex(3);
                          controllerOnboard.pageController.animateToPage(3,
                              duration: const Duration(milliseconds: 500),
                              curve: Curves.linear);
                        } else if (controllerOnboard.pageIndex.value == 3) {
                          controllerOnboard.onSkipTap();
                        }
                      },
                      child: Container(
                        alignment: Alignment.center,
                        width: Get.width * .85,
                        height: 55,
                        decoration: const BoxDecoration(
                            color: primaryColor,
                            borderRadius:
                                BorderRadius.all(Radius.circular(12))),
                        child: const Text(
                          'Continue',
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: whiteColor),
                        ),
                      ),
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
