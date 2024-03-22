import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:loadclear/common/app_bar%20_component.dart';
import 'package:loadclear/common/constant.dart';
import 'package:loadclear/common/drawer_component.dart';
import 'package:loadclear/utils/app_colors.dart';
import 'package:loadclear/view_model/themecontroller.dart';

// ignore: must_be_immutable
class SavedLocationScreen extends StatelessWidget {
  SavedLocationScreen({super.key});

  List<String> nameLocation = [
    'Elite Motors Repair',
    'Emarah Suites',
    'Elite Motors Repair',
    'Emarah Suites'
  ];
  final ThemeController _homeController = Get.put(ThemeController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Scaffold(
        appBar: PreferredSize(
            preferredSize: const Size.fromHeight(60),
            child: AppBarComponent(
              title: 'Saved locations',
              isBackButton: false,
            )),
        drawer: AppDrawerComponent(),
        resizeToAvoidBottomInset: true,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        body: AnnotatedRegion<SystemUiOverlayStyle>(
          value: SystemUiOverlayStyle(
            statusBarColor: Theme.of(context).scaffoldBackgroundColor,
            statusBarIconBrightness: Theme.of(context).brightness,
            systemNavigationBarColor: Theme.of(context).scaffoldBackgroundColor,
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: Constants.horizontalPadding, vertical: 20.0),
            child: ListView.builder(
              itemCount: nameLocation.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 20.0),
                  child: SizedBox(
                    height: 120.0.h,
                    width: Get.width,
                    child: Row(
                      children: [
                        Obx(() {
                          return Container(
                            alignment: Alignment.center,
                            height: 110.0.h,
                            width: 100.0.h,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16.0.h),
                                color: _homeController.isDarkModeEnabled.value
                                    ? Theme.of(context).highlightColor
                                    : const Color(0xffE73030).withOpacity(0.1)),
                            child: Icon(
                              Icons.location_on_rounded,
                              color: _homeController.isDarkModeEnabled.value
                                  ? Colors.white
                                  : const Color(0xffE73030),
                              size: 40.0.h,
                            ),
                          );
                        }),
                        Constants.horizontalSpace(20.0.h),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              nameLocation[index],
                              style: TextStyle(
                                  color: Theme.of(context).secondaryHeaderColor,
                                  fontSize: 16.0.h,
                                  fontFamily: 'poppin',
                                  fontWeight: FontWeight.w600),
                            ),
                            Constants.verticalSpace(5.0.h),
                            Text(
                              'Bike repair shop',
                              style: TextStyle(
                                  color: Theme.of(context).hintColor,
                                  fontSize: 14.0.h,
                                  fontFamily: 'poppin',
                                  fontWeight: FontWeight.w400),
                            ),
                            Constants.verticalSpace(5.0.h),
                            Text(
                              'Open 24 hours',
                              style: TextStyle(
                                  color: const Color(0xff296E41),
                                  fontSize: 13.0.h,
                                  fontFamily: 'poppin',
                                  fontWeight: FontWeight.w600),
                            ),
                            Constants.verticalSpace(7.0.h),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Icon(
                                  Icons.location_on_outlined,
                                  color: AppColors.buttonColor,
                                  size: 23.0.h,
                                ),
                                Constants.horizontalSpace(5.0.h),
                                Text(
                                  'Address goes here',
                                  style: TextStyle(
                                      color: Theme.of(context).hintColor,
                                      fontSize: 13.0.h,
                                      fontFamily: 'poppin',
                                      fontWeight: FontWeight.w400),
                                ),
                              ],
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
