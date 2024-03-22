import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChangePwController extends GetxController {
  final crntPassword = TextEditingController();
  final crntPasswordFocus = FocusNode();

  final newPassword = TextEditingController();
  final newPasswordFocus = FocusNode();
  final confrmPassword = TextEditingController();
  final confrmPasswordFocus = FocusNode();
  final FocusNode reEnterPassFocus = FocusNode();

  final changePasswordKey = GlobalKey<FormState>();
}
