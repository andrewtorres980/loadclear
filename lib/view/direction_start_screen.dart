import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:loadclear/common/constant.dart';
import 'package:loadclear/view_model/themecontroller.dart';

import 'Components/destination_reached_sheet.dart';

class DirectionStartScreen extends StatefulWidget {
  const DirectionStartScreen({super.key});

  @override
  State<DirectionStartScreen> createState() => _DirectionStartScreenState();
}

class _DirectionStartScreenState extends State<DirectionStartScreen> {
  final _controller = Get.put(ThemeController());
  final searchController = TextEditingController();
  final destinationController = TextEditingController();
  final FocusNode searchFocus = FocusNode();
  final FocusNode destinationFocus = FocusNode();

  @override
  void initState() {
    super.initState();
     Future.delayed(Duration(seconds: 5)).then((value) {
    print('Hello Bottom Timer....................');
    Get.bottomSheet(DestinationReachedSheet());

     });
  }

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      // drawer: AppDrawerComponent(),
      body: AnnotatedRegion(
        value: SystemUiOverlayStyle(
          statusBarColor: Theme.of(context).scaffoldBackgroundColor,
          statusBarIconBrightness: Theme.of(context).brightness,
          systemNavigationBarColor: Theme.of(context).scaffoldBackgroundColor,
        ),
        child: Stack(
          children: [
            Container(
              height: double.infinity,
              width: double.infinity,
              child: Image.asset(
                _controller.isDarkModeEnabled.value
                    ? 'assets/images/route_dark.jpg'
                    : 'assets/images/route1.png',
                fit: _controller.isDarkModeEnabled.value
                    ? BoxFit.cover
                    : BoxFit.fill,
              ),
            ),
            Positioned(
              // width: MediaQuery.of(context).size.width,
              top: 50.h,
              left: 0,
              child: GestureDetector(
                onTap: () {
                  print('dsffds');
                  //scaffoldKey.currentState!.openDrawer();
                  Get.back();
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(
                    Platform.isIOS ? Icons.arrow_back_ios : Icons.arrow_back,
                    size: 24,
                    color: Theme.of(context).secondaryHeaderColor,
                  ),
                  // Image.asset(
                  //   'assets/images/menu.png',
                  //   height: 24.h,
                  //   width: 24.h,
                  //   color: _controller.isDarkModeEnabled.value
                  //       ? Colors.white
                  //       : null,
                  // ),
                ),
              ),
            ),
            Positioned(
                width: MediaQuery.of(context).size.width,
                bottom: 0.h,
                // left: 50.h,
                child: Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                      color: Theme.of(context).scaffoldBackgroundColor,
                      border: Border.all(color: Theme.of(context).hoverColor),
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20))),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Constants.verticalSpace(24.sp),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          RichText(
                              text: TextSpan(children: [
                            TextSpan(
                              text: '26 min  ',
                              style: TextStyle(
                                color: _controller.isDarkModeEnabled.value
                                    ? Theme.of(context).secondaryHeaderColor
                                    : Theme.of(context).primaryColor,
                                fontSize: 18.sp,
                              ),
                            ),
                            TextSpan(
                              text: '(24 km)',
                              style: TextStyle(
                                color: _controller.isDarkModeEnabled.value
                                    ? Theme.of(context).secondaryHeaderColor
                                    : Theme.of(context).primaryColor,
                                fontSize: 18.sp,
                              ),
                            ),
                          ])),
                          GestureDetector(
                            onTap: () {
                              Get.back();
                            },
                            child: Container(
                              padding: const EdgeInsets.all(5.0),
                              decoration: BoxDecoration(
                                  border: Border.all(
                                    color:
                                        Theme.of(context).secondaryHeaderColor,
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
                      Constants.verticalSpace(24.sp),
                    ],
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
