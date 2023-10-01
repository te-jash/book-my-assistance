import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project/screens/booking_screen/booking_screen.dart';
import 'package:project/screens/home_screen/home_screen.dart';

class ControllerBinding extends GetxController {
  var currentIndex = 0.obs;
  var name = ''.obs;
  var screens = [
    const HomeScreen(),
    const Bookings(),
  ].obs;

  void changeCurrentIndex(value) {
    currentIndex.value = value;
  }

  var employee = [
    {'name': 'Radha', 'charges': '123', 'experience': '3', 'date': ''},
    {'name': 'Suresh', 'charges': '153', 'experience': '5', 'date': ''},
    {'name': 'Kishore', 'charges': '103', 'experience': '1', 'date': ''},
    {'name': 'Madhu', 'charges': '90', 'experience': '0', 'date': ''},
    {'name': 'Leela', 'charges': '100', 'experience': '2.3', 'date': ''},
    {'name': 'Abhilash', 'charges': '200', 'experience': '6.5', 'date': ''},
    {'name': 'Aniket', 'charges': '142', 'experience': '3.3', 'date': ''},
    {'name': 'Prem', 'charges': '111', 'experience': '3', 'date': ''},
    {'name': 'Sana', 'charges': '123', 'experience': '3', 'date': ''},
    {'name': 'Kumar', 'charges': '150', 'experience': '3.9', 'date': ''}
  ];

  var bookedEmployee = [];

  TextEditingController dateController = TextEditingController();
  @override
  void onInit() {
    super.onInit();

    currentIndex.value = 0;
  }
}
