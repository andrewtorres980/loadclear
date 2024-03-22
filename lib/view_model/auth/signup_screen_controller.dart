import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignupController extends GetxController {
  final nameController = TextEditingController();
  final phoneNoController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final reenterPasswordController = TextEditingController();

  final nameFocus = FocusNode();
  final phoneFocus = FocusNode();
  final emailFocus = FocusNode();
  final passwordFocus = FocusNode();
  final reenterFocus = FocusNode();

  final signupKey = GlobalKey<FormState>();
}
