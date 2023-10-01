import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:project/const.dart';
import 'package:project/controllers/controller_binding.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

class BindingScreen extends StatelessWidget {
  final String name;
  const BindingScreen({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    final ControllerBinding controllerBinding = Get.put(ControllerBinding());
    controllerBinding.name.value = name;
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

    final List<SalomonBottomBarItem> items = [
      /// Home

      SalomonBottomBarItem(
        icon: const Icon(FontAwesomeIcons.house),
        title: const Text("Home"),
      ),

      /// Setting
      SalomonBottomBarItem(
        icon: const Icon(Icons.history_outlined),
        title: const Text("Bookings"),
      ),
    ];

    return SafeArea(
      child: WillPopScope(
        onWillPop: onWillPop,
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            bottomNavigationBar: Obx(
              () => SalomonBottomBar(
                  backgroundColor: whiteColor,
                  selectedItemColor: blackColor,
                  unselectedItemColor: const Color.fromARGB(255, 196, 196, 196),
                  items: items,
                  // currentIndex: 0,
                  currentIndex: controllerBinding.currentIndex.value,
                  onTap: (i) => controllerBinding.changeCurrentIndex(i)),
            ),
            body: Obx(() => controllerBinding
                .screens[controllerBinding.currentIndex.value])),
      ),
    );
  }
}
