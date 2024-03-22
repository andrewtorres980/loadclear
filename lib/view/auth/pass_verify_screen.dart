import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:loadclear/common/button_component.dart';
import 'package:loadclear/common/constant.dart';
import 'package:loadclear/common/onboarding_text_component.dart';
import 'package:loadclear/utils/app_colors.dart';
import 'package:loadclear/view/auth/changes_password_screen.dart';
import 'package:loadclear/view_model/auth/verify_pw_controller.dart';
import 'package:pinput/pinput.dart';
// import 'package:pinput/pinput.dart';

// ignore: must_be_immutable
class PasswordVerifyScreen extends StatelessWidget {
  PasswordVerifyScreen({super.key});
  final VerifyPwController _verifyPwController = Get.put(VerifyPwController());
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
      value: SystemUiOverlayStyle(
        statusBarColor: Theme.of(context).scaffoldBackgroundColor,
        systemNavigationBarColor: Theme.of(context).scaffoldBackgroundColor,
      ),
      child: Scaffold(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        body: Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: Constants.horizontalPadding),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Constants.verticalSpace(150.0.h),
                Center(
                    child:
                        OnBoardingTextComponent(text: 'Password Verification')),
                Constants.verticalSpace(60.0.h),
                Center(
                    child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: FittedBox(
                    child: OnBoardingTextComponent(
                      isTextAlign: true,
                      text:
                          'Enter the verification code sent to\n des*****@gmail.com',
                      fontsize: 16.0.sp,
                      weight: FontWeight.w400,
                    ),
                  ),
                )),
                Constants.verticalSpace(80.0.h),
                Form(
                  key: _verifyPwController.formKey,
                  child: Pinput(
                    focusNode: _verifyPwController.focusNode,
                    onCompleted: (pin) {
                      log('onCompleted: $pin');
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Verification code is required';
                      } else if (value.length < 6) {
                        return 'Enter 6 digits of code';
                      }
                      return null;
                    },
                    errorTextStyle: TextStyle(
                        fontSize: 12.0.sp,
                        color: Theme.of(context).indicatorColor),
                    defaultPinTheme: PinTheme(
                      width: 52,
                      height: 56,
                      textStyle: TextStyle(
                          fontSize: 20.0.sp,
                          fontFamily: 'poppin',
                          color: Theme.of(context).secondaryHeaderColor,
                          fontWeight: FontWeight.w600),
                      decoration: const BoxDecoration(
                        border: BorderDirectional(
                            bottom: BorderSide(
                                color: AppColors.labelColor, width: 2)),
                      ),
                    ),
                    keyboardType: TextInputType.number,
                    pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
                    showCursor: true,
                    controller: _verifyPwController.pinController,
                    autofocus: true,
                    length: 6,
                  ),
                ),
                Constants.verticalSpace(50.0.h),
                Center(
                  child: Text(
                    'Didn’t receive code? ',
                    style: TextStyle(
                        color: AppColors.lightTextColor,
                        fontWeight: FontWeight.w400,
                        fontFamily: 'poppin',
                        fontSize: 14.0.sp),
                  ),
                ),
                Obx(() {
                  return _verifyPwController.countDown <= 0
                      ? Center(
                          child: GestureDetector(
                            onTap: () {
                              _verifyPwController.codeTimer();
                            },
                            child: Text(
                              'Resend',
                              style: TextStyle(
                                  color: AppColors.buttonColor,
                                  fontWeight: FontWeight.w400,
                                  fontFamily: 'poppin',
                                  fontSize: 14.0.sp),
                            ),
                          ),
                        )
                      : Center(
                          child: Text.rich(TextSpan(
                              text: 'Resend code in ',
                              style: TextStyle(
                                  color: AppColors.lightTextColor,
                                  fontWeight: FontWeight.w400,
                                  fontFamily: 'poppin',
                                  fontSize: 14.0.sp),
                              children: <InlineSpan>[
                              TextSpan(
                                text:
                                    '0:${_verifyPwController.countDown.value}',
                                style: TextStyle(
                                    fontSize: 14.0.sp,
                                    fontWeight: FontWeight.w600,
                                    fontFamily: 'poppin',
                                    color: AppColors.buttonColor),
                              )
                            ])));
                }),
                Constants.verticalSpace(200.0.h),
                ButtonComponent(
                  text: 'Confirm Code',
                  onPressed: () {
                    _verifyPwController.focusNode.unfocus();
                    if (_verifyPwController.formKey.currentState!.validate()) {
                      Get.to(const ChangePasswordScreen());
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
