import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserProfileController extends GetxController {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final nameFocus = FocusNode();
  final emailFocus = FocusNode();
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    nameController.text = 'David smith';
    emailController.text = 'david@gmail.com';
  }
}
