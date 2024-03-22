import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NoOfVehicleScreenController extends GetxController {
  final noOfVehiclesController = TextEditingController();
  final noOfVehicles = FocusNode();

  RxInt val = 1.obs;

  increment() {
    if (val.value < 5) {
      val.value++;
    }
  }

  decrement() {
    if (val.value > 1) {
      val.value--;
    }
  }
}
