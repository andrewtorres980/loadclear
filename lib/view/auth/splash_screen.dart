import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:loadclear/common/button_component.dart';
import 'package:loadclear/view/auth/signin_screen.dart';
import 'package:loadclear/view_model/themecontroller.dart';

import '../../common/constant.dart';

class SplashScreen extends StatelessWidget {
  SplashScreen({super.key});
  final ThemeController _controller = Get.put(ThemeController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle(
          statusBarColor: Theme.of(context).scaffoldBackgroundColor,
          statusBarIconBrightness: Theme.of(context).brightness,
          systemNavigationBarColor: Theme.of(context).scaffoldBackgroundColor,
        ),
        child: SizedBox(
          height: Get.height,
          width: Get.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Obx(
                () => SizedBox(
                    width: Get.width,
                    child: Image.asset(_controller.isDarkModeEnabled.value
                        ? 'assets/images/logo_dark.png'
                        : 'assets/images/logo_light.png')),
              ),
              Constants.verticalSpace(150.0.h),
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: Constants.horizontalPadding),
                child: ButtonComponent(
                  text: 'Get Started',
                  onPressed: () {
                    Get.to(() => SigninScreen());
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
