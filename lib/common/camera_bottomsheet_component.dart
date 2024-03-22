import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class CameraBottomSheet extends StatelessWidget {
  final BuildContext context;
  final dynamic controller;
  final Color borderColor;
  const CameraBottomSheet(
      {super.key,
      required this.context,
      required this.controller,
      required this.borderColor});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        height: 260.h,
        margin: EdgeInsets.symmetric(horizontal: 30.w, vertical: 30.h),
        decoration: BoxDecoration(
          border: Border.all(color: borderColor),
          color: Theme.of(context).scaffoldBackgroundColor,
          borderRadius: BorderRadius.circular(20.r),
        ),
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            GestureDetector(
              onTap: () {
                controller.getImage(
                  ImageSource.gallery,
                );
                Get.back();
              },
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 18.h),
                child: Text(
                  'Choose photo',
                  style: TextStyle(
                      fontSize: 20.sp,
                      color: Theme.of(context).secondaryHeaderColor),
                ),
              ),
            ),
            Divider(
              thickness: 1.5.w,
            ),
            GestureDetector(
              onTap: () {
                controller.getImage(
                  ImageSource.camera,
                );
                Get.back();
              },
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 18.h),
                child: Text(
                  'Take photo',
                  style: TextStyle(
                      fontSize: 20.sp,
                      color: Theme.of(context).secondaryHeaderColor),
                ),
              ),
            ),
            // Divider(
            //   thickness: 1.5.w,
            // ),
            // GestureDetector(
            //   onTap: () {
            //     controller.deleteImage();
            //     Get.back();
            //   },
            //   child: Padding(
            //     padding: EdgeInsets.symmetric(vertical: 18.h),
            //     child: Text(
            //       'Delete photo',
            //       style: TextStyle(
            //           fontSize: 20.sp,
            //           color: Theme.of(context).secondaryHeaderColor),
            //     ),
            //   ),
            // ),
            Divider(
              thickness: 1.5.w,
            ),
            GestureDetector(
              onTap: () {
                Get.back();
              },
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 18.h),
                child: Text(
                  'Cancel',
                  style: TextStyle(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w600,
                      color: Theme.of(context).secondaryHeaderColor),
                ),
              ),
            ),
          ],
        ));
  }
}
