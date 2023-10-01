// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project/const.dart';
import 'package:project/controllers/controller_splash_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final ControllerSplashScreen controllerSplashScreen =
        Get.put(ControllerSplashScreen());
    return SafeArea(
      child: Scaffold(
        body: Container(
          height: Get.height,
          width: Get.width,
          color: whiteColor,
          child: Stack(
            alignment: Alignment.center,
            children: [
              // Positioned(
              //   bottom: Get.height * .6,
              //   child: Image.asset(
              //     'assets/images/logo.png',
              //     width: 85,
              //   ),
              //   // height: 118,
              // ),
              Positioned(
                  bottom: Get.height * .7,
                  child: const Text(
                    'App icon',
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF939393)),
                  )
                  // height: 118,
                  ),
              Positioned(
                bottom: Get.height * .12,
                child: ShaderMask(
                    child: Image(
                      image: const AssetImage('assets/images/india_gate.png'),
                      height: Get.height * .36,
                      width: 286,
                    ),
                    shaderCallback: (Rect bounds) {
                      return const LinearGradient(
                        colors: [blackColor, Color.fromARGB(0, 0, 0, 0)],
                        end: Alignment.bottomCenter,
                        begin: Alignment.center,
                      ).createShader(bounds);
                    }),
              ),
              Positioned(
                bottom: Get.height * .08,
                child: RichText(
                    text: const TextSpan(
                        text: 'Made with ',
                        style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w500,
                            color: Color(0xFF939393)),
                        children: [
                      WidgetSpan(
                          child: Icon(
                        Icons.favorite,
                        size: 15,
                        color: Color.fromARGB(255, 249, 89, 95),
                      )),
                      TextSpan(
                        text: ' in India',
                        style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w500,
                            color: Color(0xFF939393)),
                      )
                    ])),
              )
            ],
          ),
        ),
      ),
    );
  }
}
