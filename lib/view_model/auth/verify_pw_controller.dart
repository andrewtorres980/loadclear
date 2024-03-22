import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VerifyPwController extends GetxController {
  final pinController = TextEditingController();
  RxInt countDown = 15.obs;
  final focusNode = FocusNode();

  final formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    pinController.dispose();
    focusNode.dispose();
    super.dispose();
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    codeTimer();
  }

  codeTimer() {
    countDown.value = 15;
    Timer.periodic(const Duration(seconds: 1), (timer) {
      if (countDown.value > 0) {
        countDown.value--;
      } else {
        timer.cancel();
      }
    });
  }
}
