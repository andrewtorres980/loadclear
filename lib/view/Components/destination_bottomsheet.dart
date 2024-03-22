import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:loadclear/view_model/themecontroller.dart';
import '../../common/constant.dart';
import '../../common/custom_dailogbox.dart';
import '../destination_screen.dart';
import '../direction_start_screen.dart';

class DestinationBottomSheet extends StatelessWidget {
  DestinationBottomSheet({super.key});

  final _controller = Get.put(ThemeController());

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
          color: Theme.of(context).scaffoldBackgroundColor,
          border: Border.all(color: Theme.of(context).hoverColor),
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Elite Motors Repair",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).secondaryHeaderColor,
                ),
              ),
              GestureDetector(
                onTap: () {
                  Get.back();
                },
                child: Container(
                  padding: const EdgeInsets.all(5.0),
                  decoration: BoxDecoration(
                      border: Border.all(
                        color: Theme.of(context).secondaryHeaderColor,
                      ),
                      shape: BoxShape.circle),
                  child: Icon(
                    Icons.close,
                    size: 20.sp,
                    color: Theme.of(context).secondaryHeaderColor,
                  ),
                ),
              ),
            ],
          ),
          Constants.verticalSpace(8.sp),
          Text(
            'Bike repair shop . 38 38th street',
            style: TextStyle(fontSize: 16, color: Theme.of(context).hintColor),
          ),
          Constants.verticalSpace(10.sp),
          RichText(
              text: TextSpan(children: [
            TextSpan(
              text: 'Closed  ',
              style: TextStyle(
                color: Theme.of(context).indicatorColor,
                fontSize: 16.sp,
              ),
            ),
            TextSpan(
              text: 'Opens 10 am',
              style: TextStyle(
                color: Theme.of(context).hintColor,
                fontSize: 16.sp,
              ),
            ),
          ])),
          const SizedBox(height: 16),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () {
                  Get.to(const DestinationScreen());
                },
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  decoration: BoxDecoration(
                      color: Theme.of(context).highlightColor,
                      border: Border.all(
                          color: _controller.isDarkModeEnabled.value
                              ? Theme.of(context).highlightColor
                              : Theme.of(context).hoverColor.withOpacity(0.7)),
                      borderRadius: BorderRadius.circular(15)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(right: 8.h),
                        child: Image.asset(
                          'assets/images/direction.png',
                          height: 24.h,
                          width: 24.h,
                        ),
                      ),
                      Text(
                        'Directions',
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          color: _controller.isDarkModeEnabled.value
                              ? Theme.of(context).secondaryHeaderColor
                              : Theme.of(context).primaryColor,
                          fontSize: 16.sp,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Get.to(const DirectionStartScreen());
                },
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  decoration: BoxDecoration(
                      color: Theme.of(context).highlightColor,
                      border: Border.all(
                          color: _controller.isDarkModeEnabled.value
                              ? Theme.of(context).highlightColor
                              : Theme.of(context).hoverColor),
                      borderRadius: BorderRadius.circular(15)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(right: 8.h),
                        child: Image.asset(
                          'assets/images/start.png',
                          height: 24.h,
                          width: 24.h,
                        ),
                      ),
                      Text(
                        'Start',
                        style: TextStyle(
                          color: _controller.isDarkModeEnabled.value
                              ? Theme.of(context).secondaryHeaderColor
                              : Theme.of(context).primaryColor,
                          fontSize: 16.sp,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {},
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  decoration: BoxDecoration(
                      color: Theme.of(context).highlightColor,
                      border: Border.all(
                          color: _controller.isDarkModeEnabled.value
                              ? Theme.of(context).highlightColor
                              : Theme.of(context).hoverColor),
                      borderRadius: BorderRadius.circular(15)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(right: 8.h),
                        child: Image.asset(
                          'assets/images/save.png',
                          height: 20.h,
                          width: 20.h,
                        ),
                      ),
                      Text(
                        'Save',
                        style: TextStyle(
                          color: _controller.isDarkModeEnabled.value
                              ? Theme.of(context).secondaryHeaderColor
                              : Theme.of(context).primaryColor,
                          fontSize: 16.sp,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
