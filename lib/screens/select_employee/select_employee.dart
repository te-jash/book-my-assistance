import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project/const.dart';
import 'package:project/controllers/controller_binding.dart';
import 'package:project/screens/home_screen/widget_dialog.dart';

class SelectEmployee extends StatelessWidget {
  final String service;
  const SelectEmployee({super.key, required this.service});

  @override
  Widget build(BuildContext context) {
    final ControllerBinding controllerBinding = Get.put(ControllerBinding());

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back_ios,
              size: 16,
              color: blackColor,
            ),
            onPressed: () {
              Get.back();
            },
          ),
          centerTitle: true,
          title: Text(
            service,
            style: const TextStyle(
                fontSize: 16, fontWeight: FontWeight.w600, color: blackColor),
          ),
        ),
        body: Container(
          width: Get.width,
          height: Get.height,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Hire",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: blackColor),
              ),
              Expanded(
                  child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: controllerBinding.employee.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () async {
                      widget_dialog(context, index);
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: secondaryColor),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(15)),
                        color: const Color.fromARGB(255, 248, 255, 234),
                      ),
                      padding: const EdgeInsets.all(10),
                      margin: const EdgeInsets.symmetric(vertical: 6),
                      child: Row(
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
                                      controllerBinding.employee[index]
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
                                          '${controllerBinding.employee[index]['experience']!} year Experience',
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
                              '₹ ${controllerBinding.employee[index]['charges']!}',
                              style: const TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.w600),
                            )
                          ]),
                    ),
                  );
                },
              )),
            ],
          ),
        ),
      ),
    );
  }
}
