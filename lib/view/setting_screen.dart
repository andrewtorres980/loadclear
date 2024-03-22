import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:loadclear/common/app_bar%20_component.dart';
import 'package:loadclear/common/constant.dart';
import 'package:loadclear/view/auth/change_pw_screen.dart';
import 'package:loadclear/view/auth/delete_account_screen.dart';
import 'package:loadclear/view_model/themecontroller.dart';

class SettingScreen extends StatelessWidget {
  SettingScreen({super.key});
  final _controller = Get.put(ThemeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: PreferredSize(
            preferredSize: const Size.fromHeight(60),
            child: AppBarComponent(
              title: 'Settings',
              isBackButton: true,
            )),
        body: AnnotatedRegion(
          value: SystemUiOverlayStyle(
            statusBarColor: Theme.of(context).scaffoldBackgroundColor,
            statusBarIconBrightness: Theme.of(context).brightness,
            systemNavigationBarColor: Theme.of(context).scaffoldBackgroundColor,
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: Constants.horizontalPadding),
            child: Column(
              children: [
                Constants.verticalSpace(30.0),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  height: 55.0.h,
                  width: Get.width,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      border: Border.all(
                          color: Theme.of(context).hoverColor, width: 1.0)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Theme Mode',
                        style: TextStyle(
                            fontSize: 15.0.sp,
                            fontWeight: FontWeight.w400,
                            color: Theme.of(context).secondaryHeaderColor),
                      ),
                      Obx(
                        () => Switch(
                          value: _controller.isDarkModeEnabled.value,
                          onChanged: (value) {
                            _controller.toggleTheme();
                            print(
                                'object ${_controller.isDarkModeEnabled.value}');
                          },
                          activeColor: Theme.of(context).primaryColor,
                        ),
                      ),
                    ],
                  ),
                ),
                //heheheheh
                Constants.verticalSpace(20.0),
                GestureDetector(
                  onTap: () {
                    Get.to(() => ChangePwScreen());
                  },
                  child: Container(
                    alignment: Alignment.centerLeft,
                    height: 55.0.h,
                    width: Get.width,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0),
                        border: Border.all(
                            color: Theme.of(context).hoverColor, width: 1.0)),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                      child: Text(
                        'Change Password',
                        style: TextStyle(
                            color: Theme.of(context).secondaryHeaderColor,
                            fontSize: 15.0.h,
                            fontFamily: 'poppin',
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                  ),
                ),
                Constants.verticalSpace(20.0),
                GestureDetector(
                  onTap: () {
                    Get.to(() => DeleteAcountScreen());
                  },
                  child: Container(
                    alignment: Alignment.centerLeft,
                    height: 55.0.h,
                    width: Get.width,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0),
                        border: Border.all(
                            color: Theme.of(context).hoverColor, width: 1.0)),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                      child: Text(
                        'Delete Account',
                        style: TextStyle(
                            color: Theme.of(context).secondaryHeaderColor,
                            fontSize: 15.0.h,
                            fontFamily: 'poppin',
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
