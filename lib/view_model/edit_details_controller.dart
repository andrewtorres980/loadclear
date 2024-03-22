import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class EditDetailsController extends GetxController {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final nameFocus = FocusNode();
  final emailFocus = FocusNode();

  final ImagePicker picker = ImagePicker();
  RxString image = ''.obs;

  final editDetailsKey = GlobalKey<FormState>();
  void getImage(
    ImageSource imageSource,
  ) async {
    final pickedFile = await ImagePicker().pickImage(source: imageSource);
    if (pickedFile != null) {
      image.value = pickedFile.path;
    } else {
      Get.snackbar(
        'Error',
        'No Image Picked',
        colorText: Colors.red,
        snackPosition: SnackPosition.TOP,
      );
    }
  }
}
