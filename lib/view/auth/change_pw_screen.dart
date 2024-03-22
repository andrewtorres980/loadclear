import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:loadclear/common/app_bar%20_component.dart';
import 'package:loadclear/common/button_component.dart';
import 'package:loadclear/common/constant.dart';
import 'package:loadclear/common/textfield_component.dart';
import 'package:loadclear/utils/validations.dart';
import 'package:loadclear/view/setting_screen.dart';
import 'package:loadclear/view_model/auth/change_pw_controller.dart';
import 'package:loadclear/view_model/themecontroller.dart';

class ChangePwScreen extends StatelessWidget {
  ChangePwScreen({super.key});
  final ThemeController _controller = Get.put(ThemeController());
  final ChangePwController _changePwController = Get.put(ChangePwController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: PreferredSize(
            preferredSize: const Size.fromHeight(60),
            child: AppBarComponent(
              title: 'Change Password',
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
            child: Form(
              key: _changePwController.changePasswordKey,
              child: LayoutBuilder(
                builder: (context, constraints) {
                  return SingleChildScrollView(
                    child: ConstrainedBox(
                      constraints: BoxConstraints(
                          minWidth: constraints.maxWidth,
                          minHeight: constraints.maxHeight),
                      child: IntrinsicHeight(
                        child: Column(
                          children: [
                            Constants.verticalSpace(30.0),
                            TextFieldComponent(
                              _changePwController.crntPassword,
                              currentFocus:
                                  _changePwController.crntPasswordFocus,
                              nextFocus: _changePwController.reEnterPassFocus,
                              keyboardType: TextInputType.text,
                              isPassword: true,
                              hintText: "Current Password",
                              hintLabelText: "Current Password",
                              borderColor: _controller.isDarkModeEnabled.value
                                  ? Theme.of(context).highlightColor
                                  : Theme.of(context).hoverColor,
                              hintTextStyle: TextStyle(
                                color: _controller.isDarkModeEnabled.value
                                    ? Theme.of(context).secondaryHeaderColor
                                    : Theme.of(context).hintColor,
                                fontSize: 14,
                              ),
                            ),
                            Constants.verticalSpace(10.0),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10.0),
                              child: Text(
                                'You must enter current password in order to change your password.',
                                style: TextStyle(
                                    color: Theme.of(context).hoverColor,
                                    fontSize: 14.0.h,
                                    fontFamily: 'poppin',
                                    fontWeight: FontWeight.w400),
                              ),
                            ),
                            Constants.verticalSpace(20.0),
                            TextFieldComponent(
                              _changePwController.newPassword,
                              currentFocus:
                                  _changePwController.newPasswordFocus,
                              keyboardType: TextInputType.text,
                              validator: validatePassword,
                              isPassword: true,
                              hintText: "New Password",
                              hintLabelText: "New Password",
                              borderColor: _controller.isDarkModeEnabled.value
                                  ? Theme.of(context).highlightColor
                                  : Theme.of(context).hoverColor,
                              hintTextStyle: TextStyle(
                                color: _controller.isDarkModeEnabled.value
                                    ? Theme.of(context).secondaryHeaderColor
                                    : Theme.of(context).hintColor,
                                fontSize: 14,
                              ),
                            ),
                            const SizedBox(
                              height: 13,
                            ),
                            TextFieldComponent(
                              _changePwController.confrmPassword,
                              currentFocus:
                                  _changePwController.confrmPasswordFocus,
                              keyboardType: TextInputType.text,
                              borderColor: _controller.isDarkModeEnabled.value
                                  ? Theme.of(context).highlightColor
                                  : Theme.of(context).hoverColor,
                              isPassword: true,
                              validator: (value) {
                                if (_changePwController.newPassword.text
                                        .compareTo(_changePwController
                                            .confrmPassword.text) ==
                                    0) {
                                  return null;
                                } else {
                                  return "Password does not match";
                                }
                              },
                              hintText: "Re-enter Password",
                              hintLabelText: "Re-enter Password",
                              hintTextStyle: TextStyle(
                                color: _controller.isDarkModeEnabled.value
                                    ? Theme.of(context).secondaryHeaderColor
                                    : Theme.of(context).hintColor,
                                fontSize: 14,
                              ),
                            ),
                            const Spacer(),
                            ButtonComponent(
                              text: 'Update',
                              onPressed: () {
                                if (_changePwController
                                    .changePasswordKey.currentState!
                                    .validate()) {
                                  Get.to(const showSuccessChangePass());
                                  Timer(const Duration(seconds: 2), () {
                                    Get.to( SettingScreen());
                                  });
                                }
                              },
                            ),
                            Constants.verticalSpace(40.0),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ));
  }
}

class showSuccessChangePass extends StatelessWidget {
  const showSuccessChangePass({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: Get.height,
        width: Get.width,
        color: Theme.of(context).scaffoldBackgroundColor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset('assets/images/sucess_tick.png'),
            Constants.verticalSpace(40.0.h),
            Text(
              'Password Updated',
              style: TextStyle(
                  color: Theme.of(context).secondaryHeaderColor,
                  fontWeight: FontWeight.w600,
                  fontFamily: 'poppin',
                  fontSize: 28.0.sp),
            ),
            Constants.verticalSpace(20.0.h),
            Text(
              'Your password has been updated\n successfully!',
              style: TextStyle(
                  color: Theme.of(context).secondaryHeaderColor,
                  fontWeight: FontWeight.w400,
                  fontFamily: 'poppin',
                  fontSize: 14.0.sp),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
