import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class EditVehicleController extends GetxController {
  TextEditingController nameController = TextEditingController();
  TextEditingController typeController = TextEditingController();
  TextEditingController weightController = TextEditingController();
  TextEditingController height = TextEditingController();
  TextEditingController length = TextEditingController();
  TextEditingController width = TextEditingController();
  TextEditingController typeOfVehicle = TextEditingController();

  FocusNode nameFocus = FocusNode();
  FocusNode typeFocus = FocusNode();
  FocusNode weightFocus = FocusNode();
  FocusNode heightFocus = FocusNode();
  FocusNode lengthFocus = FocusNode();
  FocusNode widthFocus = FocusNode();
  FocusNode typeOfVehicleFocus = FocusNode();

  RxString selectedOptionVehicleType = 'Option 1'.obs;
  final RxList<String> optionsVehichleType =
      ['Option 1', 'Option 2', 'Option 3'].obs;
  var selectImagePath = ''.obs;
  var selectedImageSize = ''.obs;
  RxString selectedOptionWeightofVehicle = 'lbs'.obs;
  final RxList<String> optionsWeight = ['lbs', 'Tons'].obs;

  RxString selectedvehicleHeightMeasurement = 'Feet'.obs;
  final RxList<String> vehicleHeightMeasurement = ['Feet', 'Inchs'].obs;

  RxString selectedvehicleLengthMeasurement = 'Feet'.obs;
  final RxList<String> vehicleLengthMeasurement = ['Feet', 'Inchs'].obs;

  RxString selectedvehicleWidthMeasurement = 'Feet'.obs;
  final RxList<String> vehicleWidthMeasurement = ['Feet', 'Inchs'].obs;

  void getImage(
    ImageSource imageSource,
  ) async {
    final pickedFile = await ImagePicker().pickImage(source: imageSource);
    if (pickedFile != null) {
      selectImagePath.value = pickedFile.path;
      selectedImageSize.value =
          "${(((File(selectImagePath.value)).lengthSync() / 1024 / 1024)).toStringAsFixed(2)} Mb";

      print('image size : ${selectedImageSize.value}');
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
