import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:loadclear/common/app_bar%20_component.dart';

import '../common/constant.dart';
import '../view_model/themecontroller.dart';
import '../view_model/on boarding/edit_vehicle_controller.dart';

class VehicleDetailScreen extends StatelessWidget {
  VehicleDetailScreen({super.key});

  final ThemeController homeController = Get.put(ThemeController());
  final args = Get.arguments;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: PreferredSize(
            preferredSize: const Size.fromHeight(60),
            child: AppBarComponent(
              title: args == 'from add vehicles'
                  ? 'Add vehicle'
                  : 'Vehicle details',
            )),
        body: GetBuilder<EditVehicleController>(
            init: EditVehicleController(),
            builder: (controller) {
              return SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: Constants.horizontalPadding),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Constants.verticalSpace(15.h),
                      Text(
                        'Vehicle Infromation',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w600),
                      ),
                      Constants.verticalSpace(27.h),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(12.r),
                        child: Container(
                            height: 151.h,
                            width: MediaQuery.of(context).size.width,
                            decoration: const BoxDecoration(
                                image: DecorationImage(
                              fit: BoxFit.fitWidth,
                              image: AssetImage(
                                  'assets/images/vehicle_image1.png'),
                            ))),
                      ),
                      SizedBox(
                        height: 27.h,
                      ),
                      Text(
                        'Name of vehicle',
                        style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w400,
                            color: homeController.isDarkModeEnabled.value
                                ? Theme.of(context).secondaryHeaderColor
                                : Theme.of(context).secondaryHeaderColor),
                      ),
                      Constants.verticalSpace(5.h),
                      textContainer(context, homeController, 'Ford Raptor'),
                      Constants.verticalSpace(27.h),
                      Text(
                        'Type of vehicle',
                        style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w400,
                            color: homeController.isDarkModeEnabled.value
                                ? Theme.of(context).secondaryHeaderColor
                                : Theme.of(context).secondaryHeaderColor),
                      ),
                      Constants.verticalSpace(5.h),
                      textContainer(context, homeController, 'Truck'),
                      // Constants.verticalSpace(4.h),
                      Constants.verticalSpace(27.h),

                      Text(
                        'Weight of vehicle',
                        style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w400,
                            color: homeController.isDarkModeEnabled.value
                                ? Theme.of(context).secondaryHeaderColor
                                : Theme.of(context).secondaryHeaderColor),
                      ),
                      Constants.verticalSpace(5.h),
                      textContainer(context, homeController, '500 Kg'),
                      Constants.verticalSpace(27.h),

                      Text(
                        'Vehicle body measurements',
                        style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w400,
                            color: homeController.isDarkModeEnabled.value
                                ? Theme.of(context).secondaryHeaderColor
                                : Theme.of(context).secondaryHeaderColor),
                      ),
                      Constants.verticalSpace(15.h),
                      Text(
                        'Height',
                        style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w400,
                            color: homeController.isDarkModeEnabled.value
                                ? Theme.of(context).secondaryHeaderColor
                                : Theme.of(context).secondaryHeaderColor),
                      ),
                      Constants.verticalSpace(5.h),

                      textContainer(context, homeController, '310 Feet'),
                      Constants.verticalSpace(15.h),
                      Text(
                        'Length',
                        style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w400,
                            color: homeController.isDarkModeEnabled.value
                                ? Theme.of(context).secondaryHeaderColor
                                : Theme.of(context).secondaryHeaderColor),
                      ),
                      Constants.verticalSpace(5.h),

                      textContainer(context, homeController, '100 Feet'),
                      Constants.verticalSpace(15.h),
                      Text(
                        'Width',
                        style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w400,
                            color: homeController.isDarkModeEnabled.value
                                ? Theme.of(context).secondaryHeaderColor
                                : Theme.of(context).secondaryHeaderColor),
                      ),
                      Constants.verticalSpace(5.h),

                      textContainer(context, homeController, '80 Feet'),
                      SizedBox(
                        height: 52.h,
                      ),

                      // Constants.verticalSpace(20.h)
                    ],
                  ),
                ),
              );
            }));
  }
}

Widget textContainer(BuildContext context, dynamic controller, String text) {
  return Container(
    width: MediaQuery.of(context).size.width,
    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
    decoration: BoxDecoration(
        color: Theme.of(context).highlightColor,
        border: Border.all(
          color: controller.isDarkModeEnabled.value
              ? Theme.of(context).highlightColor
              : Theme.of(context).hoverColor,
        ),
        borderRadius: BorderRadius.circular(8.r)),
    child: Text(
      text,
      style: TextStyle(
          fontWeight: FontWeight.w400,
          fontSize: 15.sp,
          color: controller.isDarkModeEnabled.value
              ? Theme.of(context).secondaryHeaderColor
              : Theme.of(context).hintColor),
    ),
  );
}
