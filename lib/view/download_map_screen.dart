import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:loadclear/common/constant.dart';
import 'package:loadclear/view/bottom_bar_nav.dart';
import 'package:loadclear/view_model/themecontroller.dart';

class DownloadMapScreen extends StatefulWidget {
  const DownloadMapScreen({super.key});

  @override
  State<DownloadMapScreen> createState() => _DownloadMapScreenState();
}

class _DownloadMapScreenState extends State<DownloadMapScreen> {
  final controllerOffline = Get.put(());
  final _controller = Get.put(ThemeController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnnotatedRegion(
          value: SystemUiOverlayStyle(
            statusBarColor: Theme.of(context).scaffoldBackgroundColor,
            statusBarIconBrightness: Theme.of(context).brightness,
            systemNavigationBarColor: Theme.of(context).scaffoldBackgroundColor,
          ),
          child: Stack(
            children: [
              // Image.asset(
              //   height: double.infinity,
              //   'assets/images/map.png',fit: BoxFit.fitHeight,),
              Stack(
                children: [
                  // Background image
                  Image.asset(
                    'assets/images/map.png',
                    fit: BoxFit.cover,
                    width: double.infinity,
                    height: double.infinity,
                  ),
                  // Blur overlay
                  BackdropFilter(
                    filter: ImageFilter.blur(
                        sigmaX: 10, sigmaY: 10), // Adjust blur intensity
                    child: Container(
                      color: Colors.transparent,
                      width: double.infinity,
                      height: double.infinity,
                    ),
                  ),
                  // Center area with no blur
                  Center(
                    child: ClipRect(
                      child: Container(
                        width: 250,
                        height: 300,
                        decoration: BoxDecoration(
                            border: Border.all(
                                color: Theme.of(context).shadowColor,
                                width: 2)),
                        child: Image.asset(
                          'assets/images/map.png',
                          fit: BoxFit.cover,
                          width: double.infinity,
                          height: double.infinity,
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              Positioned(
                width: MediaQuery.of(context).size.width,
                bottom: 0.h,
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 30.sp),
                  decoration: BoxDecoration(
                      color: Theme.of(context).scaffoldBackgroundColor,
                      border: Border.all(color: Theme.of(context).hoverColor),
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20))),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Get.back();
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 15, vertical: 8),
                          decoration: BoxDecoration(
                              color: _controller.isDarkModeEnabled.value
                                  ? Theme.of(context).highlightColor
                                  : Theme.of(context)
                                      .hoverColor
                                      .withOpacity(0.2),
                              borderRadius: BorderRadius.circular(20)),
                          child: Text(
                            'Cancel',
                            style: TextStyle(
                                color: Theme.of(context).secondaryHeaderColor,
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                      ),
                      Constants.horizontalSpace(50.h),
                      GestureDetector(
                        onTap: () {
                          showEditNameDialog(context);
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 15, vertical: 8),
                          decoration: BoxDecoration(
                              color: Theme.of(context).shadowColor,
                              borderRadius: BorderRadius.circular(20)),
                          child: Text(
                            'Download',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          )),
    );
  }

  void showEditNameDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor:_controller.isDarkModeEnabled.value
            ? Theme.of(context).highlightColor
            : Theme.of(context).scaffoldBackgroundColor,
        // title: Text('Set Name',style: TextStyle(fontSize: 20.sp,color: Theme.of(context).secondaryHeaderColor,fontWeight: FontWeight.w600),),
        content: TextField(
          style: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.w400,
              color: Theme.of(context).secondaryHeaderColor),
          decoration: const InputDecoration(
            hintText: 'Enter new name',
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              // Navigator.of(context).pop();
              Get.offAll(() => BottomNavBar(
                    index: 2,
                  ));
            },
            child: Text('Save',
                style: TextStyle(
                    fontSize: 16.sp,
                    color: Theme.of(context).shadowColor,
                    fontWeight: FontWeight.w600)),
          ),
        ],
      ),
    );
  }
}
