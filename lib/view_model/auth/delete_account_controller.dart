import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DeleteAccountController extends GetxController {
  final passwordController = TextEditingController();
  final passwordFocus = FocusNode();

  final deleteAccountKey = GlobalKey<FormState>();
}
