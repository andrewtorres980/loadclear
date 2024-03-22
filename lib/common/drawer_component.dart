import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:loadclear/common/constant.dart';
import 'package:loadclear/view/setting_screen.dart';
import 'package:loadclear/view/privacy_policy_screen.dart';
import 'package:loadclear/view/term_condition_screen.dart';
import 'package:loadclear/view/user_profile_screen.dart';
import 'package:loadclear/view/vehicle_list_screen.dart';

class DrawerController extends GetxController {
  RxInt selectedIndex = 0.obs;
}

// ignore: use_key_in_widget_constructors
class AppDrawerComponent extends StatefulWidget {
  final Color? textColor;
  final Color? backgroundColor;
  final Color? imageColor;

  const AppDrawerComponent(
      {super.key, this.backgroundColor, this.textColor, this.imageColor});

  @override
  State<AppDrawerComponent> createState() => _AppDrawerComponentState();
}

class _AppDrawerComponentState extends State<AppDrawerComponent> {
  final DrawerController drawerController = Get.put(DrawerController());

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(maxWidth: 260.w),
      child: Drawer(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        shape: BeveledRectangleBorder(borderRadius: BorderRadius.circular(0)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Constants.verticalSpace(103.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                GestureDetector(
                  onTap: () => Get.back(),
                  child: Image.asset(
                    'assets/images/cross.png',
                    height: 25.h,
                    width: 25.w,
                    color: widget.imageColor,
                  ),
                )
              ],
            ).paddingOnly(right: 22.w),
            Constants.verticalSpace(28.h),
            Image.asset(
              'assets/images/logo_light.png',
              height: 150.h,
              width: 150.w,
              color: widget.imageColor,
            ).paddingSymmetric(horizontal: 14.w),
            Constants.verticalSpace(23.h),
            buildMenuItem(
                0,
                "Vehicle Profile",
                context,
                'assets/images/truck (2).png',
                Theme.of(context).secondaryHeaderColor,
                widget.imageColor),
            //Constants.verticalSpace(4.w),
            buildMenuItem(
                1,
                "User Profile",
                context,
                'assets/images/profile.png',
                Theme.of(context).secondaryHeaderColor,
                widget.imageColor),
            //Constants.verticalSpace(4.w),
            buildMenuItem(2, "Settings", context, 'assets/images/settings.png',
                Theme.of(context).secondaryHeaderColor, widget.imageColor),
            //Constants.verticalSpace(4.w),
            buildMenuItem(
                3,
                "Terms of Services",
                context,
                'assets/images/Terms.png',
                Theme.of(context).secondaryHeaderColor,
                widget.imageColor),
            //Constants.verticalSpace(4.w),
            buildMenuItem(
                4,
                "Privacy Policy",
                context,
                'assets/images/privacy.png',
                Theme.of(context).secondaryHeaderColor,
                widget.imageColor),
            // Constants.verticalSpace(4.w),
            buildMenuItem(5, "Logout", context, 'assets/images/logout.png',
                const Color(0XFFEA2D2D), const Color(0XFFEA2D2D)),
          ],
        ),
      ),
    );
  }

  Widget buildMenuItem(int index, String title, BuildContext context,
      String image, Color? textColor, Color? imageColor) {
    return GestureDetector(
      onTap: () {
        drawerController.selectedIndex.value = index;
        navigateToScreen(index, context);
      },
      child: ListTile(
        leading:
            Image.asset(image, height: 28.h, width: 28.w, color: imageColor),
        title: Text(
          title,
          style: TextStyle(
              fontSize: 16.sp, fontWeight: FontWeight.w400, color: textColor),
        ),
      ),
    );
  }

  void navigateToScreen(int index, BuildContext context) {
    switch (index) {
      case 0:
        Get.to(() => VehicleListScreen()); // Home view
        break;
      case 1:
        Get.to(() => UserProfileScreen());
        break;
      case 2:
        Get.to(() =>  SettingScreen());
        break;
      case 3:
        Get.to(() => const TermConditionScreen());
        break;
      case 4:
        Get.to(() => const PrivacyPolicyScreen());
        break;
      case 5:
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            backgroundColor: widget.backgroundColor,
            title: Text(
              'Logout',
              style: TextStyle(
                  fontSize: 20.sp,
                  color: Theme.of(context).secondaryHeaderColor,
                  fontWeight: FontWeight.w600),
            ),
            content: Text('Are you sure you want to log out?',
                style: TextStyle(
                    fontSize: 14.sp,
                    color: widget.textColor,
                    fontWeight: FontWeight.w600)),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('Yes',
                    style: TextStyle(
                        fontSize: 16.sp,
                        color: Theme.of(context).indicatorColor,
                        fontWeight: FontWeight.w600)),
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('No',
                    style: TextStyle(
                        fontSize: 16.sp,
                        color: Theme.of(context).secondaryHeaderColor,
                        fontWeight: FontWeight.w600)),
              ),
            ],
          ),
        );
        break;

      // We can Add cases here for other menu items if needed
    }
  }
}