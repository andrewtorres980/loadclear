import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ThemeController extends GetxController {
  // Rx<ThemeMode> currentTheme = ThemeMode.system.obs;
  RxBool isDarkModeEnabled = false.obs;
  void toggleTheme() {
    isDarkModeEnabled.value = !isDarkModeEnabled.value;
    Get.changeThemeMode(
        isDarkModeEnabled.value ? ThemeMode.dark : ThemeMode.light);
    // Save the theme mode preference here
  }

  // function to switch between themes
  // void switchTheme() {
  //   currentTheme.value = currentTheme.value == ThemeMode.light
  //       ? ThemeMode.dark
  //       : ThemeMode.light;
  //       updateFeatureState();
  // }

  // Function to update the feature state based on the theme
  // void updateFeatureState() {
  //   isDarkModeEnabled.value = currentTheme.value == ThemeMode.dark;
  // }
  //  Container(
  //                 height: 70,
  //                 width: 70,
  //                 color: Colors.white,
  //                 child: Obx(
  //                   () => Switch(
  //                     value: _controller.currentTheme.value == ThemeMode.dark,
  //                     onChanged: (value) {
  //                       _controller.switchTheme();
  //                       Get.changeThemeMode(_controller.currentTheme.value);
  //                     },
  //                     activeColor: Theme.of(context).scaffoldBackgroundColor,
  //                   ),
  //                 ),
  //               ),
}
