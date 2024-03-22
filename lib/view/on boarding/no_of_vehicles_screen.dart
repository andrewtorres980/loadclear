import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:loadclear/common/onboarding_text_component.dart';
import 'package:loadclear/view_model/themecontroller.dart';
import 'package:loadclear/view_model/on%20boarding/no_of_vehicles_screen_controller.dart';

import '../../common/button_component.dart';
import '../../common/constant.dart';
import 'edit_vehicle_screen.dart';

class NoOfVehiclesScreen extends StatelessWidget {
  NoOfVehiclesScreen({super.key});

  final NoOfVehicleScreenController controller =
      Get.put(NoOfVehicleScreenController());

  final ThemeController homeController = Get.put(ThemeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding:
            const EdgeInsets.symmetric(horizontal: Constants.horizontalPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Constants.verticalSpace(83.h),
            Center(child: OnBoardingTextComponent(text: 'Enter details')),
            Constants.verticalSpace(64.h),
            Text(
              'Number of vehicles',
              style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 12.sp,
                  color: Theme.of(context).secondaryHeaderColor),
            ),
            Constants.verticalSpace(4.h),
            Obx(
              () => TextFormField(
                readOnly: true,
                maxLines: 1,
                controller: TextEditingController(
                    text: controller.val.value.toString()),
                style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 16.sp,
                    color: Theme.of(context).secondaryHeaderColor),
                decoration: InputDecoration(
                    fillColor: Theme.of(context).highlightColor,
                    filled: true,
                    suffixIcon: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () => controller.increment(),
                          child: Image.asset(
                            'assets/images/up.png',
                            height: 16.h,
                            width: 16.w,
                            color: homeController.isDarkModeEnabled.value
                                ? Theme.of(context).secondaryHeaderColor
                                : Theme.of(context).secondaryHeaderColor,
                          ),
                        ),
                        GestureDetector(
                          onTap: () => controller.decrement(),
                          child: Image.asset(
                            'assets/images/down.png',
                            height: 16.h,
                            width: 16.w,
                            color: homeController.isDarkModeEnabled.value
                                ? Theme.of(context).secondaryHeaderColor
                                : Theme.of(context).secondaryHeaderColor,
                          ),
                        ),
                      ],
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 13, horizontal: 24),
                    //EdgeInsets.only(left: 15, top: 20, bottom: 0),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: homeController.isDarkModeEnabled.value
                                ? Theme.of(context).highlightColor
                                : Theme.of(context).hoverColor),
                        borderRadius: BorderRadius.circular(8.r)),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: homeController.isDarkModeEnabled.value
                                ? Theme.of(context).highlightColor
                                : Theme.of(context).hoverColor),
                        borderRadius: BorderRadius.circular(8.r)),
                    border: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: homeController.isDarkModeEnabled.value
                                ? Theme.of(context).highlightColor
                                : Theme.of(context).hoverColor),
                        borderRadius: BorderRadius.circular(8.r))),
              ),
            ),
            Constants.verticalSpace(4.h),
            Text(
              'You can add maximum 5 vechicles',
              style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 12.sp,
                  color: Theme.of(context).cardColor),
            ),
            const Spacer(),
            ButtonComponent(
              text: 'Next',
              onPressed: () => Get.to(() => EditVehicleScreen(),
                  arguments: 'from add vehicles'),
            ),
            Constants.verticalSpace(104.h),
          ],
        ),
      ),
    );
  }
}
