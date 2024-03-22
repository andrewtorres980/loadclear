import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:loadclear/utils/app_colors.dart';
import 'view/auth/splash_screen.dart';
import 'view_model/themecontroller.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final ThemeController _controller = Get.put(ThemeController());
  @override
  Widget build(BuildContext context) {
    // if (MediaQuery.of(context).platformBrightness == Brightness.dark) {
    //   _controller.isDarkModeEnabled.value = true;
    // } else {
    //   _controller.isDarkModeEnabled.value = false;
    // }
    return ScreenUtilInit(
        designSize: const Size(437, 969),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (_, child) {
          return GetMaterialApp(
            debugShowCheckedModeBanner: false,
            theme: AppColors.lightTheme,
            darkTheme: AppColors.darkTheme,
            themeMode: _controller.isDarkModeEnabled.value
                ? ThemeMode.dark
                : ThemeMode.light,
            home: SplashScreen(),
          );
        });
  }
}
