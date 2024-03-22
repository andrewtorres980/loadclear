import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:loadclear/common/button_component.dart';
import 'package:loadclear/common/constant.dart';
import 'package:loadclear/common/onboarding_text_component.dart';
import 'package:loadclear/common/soicial_signin_component.dart';
import 'package:loadclear/common/textfield_component.dart';
import 'package:loadclear/utils/app_colors.dart';
import 'package:loadclear/utils/validations.dart';
import 'package:loadclear/view/auth/email_verify_screen.dart';
import 'package:loadclear/view/auth/signup_screen.dart';
import 'package:loadclear/view/bottom_bar_nav.dart';
import 'package:loadclear/view/privacy_policy_screen.dart';
import 'package:loadclear/view/term_condition_screen.dart';
import 'package:loadclear/view_model/auth/signin_screen_controller.dart';
import 'package:loadclear/view_model/themecontroller.dart';

class SigninScreen extends StatelessWidget {
  SigninScreen({super.key});

  final SigninScreenController controller = Get.put(SigninScreenController());
  final ThemeController _controller = Get.put(ThemeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: true,
        body: AnnotatedRegion(
          value: SystemUiOverlayStyle(
            statusBarColor: Theme.of(context).scaffoldBackgroundColor,
            statusBarIconBrightness: Theme.of(context).brightness,
            systemNavigationBarColor: Theme.of(context).scaffoldBackgroundColor,
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Constants.verticalSpace(83.h),
                Center(child: OnBoardingTextComponent(text: 'Welcome back!')),
                Constants.verticalSpace(64.h),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: Constants.horizontalPadding),
                  child: Column(
                    //crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      TextFieldComponent(
                        fillColor: Theme.of(context).highlightColor,
                        labelColor: Theme.of(context).secondaryHeaderColor,
                        labelText: 'Email',
                        hintLabelText: 'Enter your email',
                        hintTextStyle: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 12.sp,
                            color: _controller.isDarkModeEnabled.value
                                ? Theme.of(context).secondaryHeaderColor
                                : Theme.of(context).hintColor),
                        borderColor: _controller.isDarkModeEnabled.value
                            ? Theme.of(context).highlightColor
                            : Theme.of(context).hoverColor,
                        controller.emailController,
                        validator: validateEmail,
                        currentFocus: controller.emailFocus,
                      ),
                      Constants.verticalSpace(27.h),
                      TextFieldComponent(
                        fillColor: Theme.of(context).highlightColor,
                        controller.passController,
                        currentFocus: controller.passFocus,
                        labelColor: Theme.of(context).secondaryHeaderColor,
                        labelText: 'Password',
                        hintLabelText: 'Enter your password',
                        isPassword: true,
                        hintTextStyle: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 12.sp,
                            color: _controller.isDarkModeEnabled.value
                                ? Theme.of(context).secondaryHeaderColor
                                : Theme.of(context).hintColor),
                        borderColor: _controller.isDarkModeEnabled.value
                            ? Theme.of(context).highlightColor
                            : Theme.of(context).hoverColor,
                        validator: validatePassword,
                      ),
                      Constants.verticalSpace(4.h),
                      GestureDetector(
                        onTap: () {
                          Get.to(() => const EmailVerifyScreen());
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              'Forgot password?',
                              style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 12.sp,
                                  color: _controller.isDarkModeEnabled.value
                                      ? Theme.of(context).primaryColor
                                      : Theme.of(context).hintColor),
                            ),
                          ],
                        ),
                      ),
                      Constants.verticalSpace(20.h),
                      ButtonComponent(
                        text: 'Login',
                        onPressed: () {
                          Get.offAll(() => const BottomNavBar());
                        },
                      ),
                      Constants.verticalSpace(20.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Don\'t have an account? ',
                            style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 12.sp,
                                color: _controller.isDarkModeEnabled.value
                                    ? AppColors.lightTextColor
                                    : Theme.of(context).secondaryHeaderColor),
                          ),
                          GestureDetector(
                            onTap: () => Get.offAll(() => SignupScreen()),
                            child: Text(
                              'Signup',
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 12.sp,
                                  color: Theme.of(context).primaryColor),
                            ),
                          )
                        ],
                      ),
                      Constants.verticalSpace(19.h),
                      RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                              text: 'Our ',
                              style: TextStyle(
                                  fontFamily: 'Gilroy',
                                  fontSize: 14.sp,
                                  color: Theme.of(context).secondaryHeaderColor,
                                  fontWeight: FontWeight.w400),
                              children: [
                                TextSpan(
                                    text: 'Terms & Conditions',
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () {
                                        // controller.openTermsAndConditions();
                                        Get.to(
                                            () => const TermConditionScreen());
                                      },
                                    style: TextStyle(
                                        fontFamily: 'Gilroy',
                                        fontSize: 14.sp,
                                        color: Theme.of(context).primaryColor,
                                        fontWeight: FontWeight.w600)),
                                TextSpan(
                                    text: ' and',
                                    style: TextStyle(
                                        fontFamily: 'Gilroy',
                                        fontSize: 14.sp,
                                        color: Theme.of(context)
                                            .secondaryHeaderColor,
                                        fontWeight: FontWeight.w400)),
                                TextSpan(
                                    text: ' Privacy Policy',
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () {
                                        //controller.openPrivacyPolicy();
                                        Get.to(
                                            () => const PrivacyPolicyScreen());
                                      },
                                    style: TextStyle(
                                        fontFamily: 'Gilroy',
                                        fontSize: 14.sp,
                                        color: Theme.of(context).primaryColor,
                                        fontWeight: FontWeight.w600)),
                                TextSpan(
                                    text: '.',
                                    style: TextStyle(
                                        fontFamily: 'Gilroy',
                                        fontSize: 14.sp,
                                        color: Theme.of(context)
                                            .secondaryHeaderColor,
                                        fontWeight: FontWeight.w400))
                              ])),
                      Constants.verticalSpace(50.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'or continue with',
                            style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 10.sp,
                                color: Theme.of(context).hintColor),
                          ),
                        ],
                      ),
                      Constants.verticalSpace(14.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          SocialSigninComponent(
                              color: _controller.isDarkModeEnabled.value,
                              image: 'assets/images/facebook_logo.png'),
                          const SocialSigninComponent(
                              image: 'assets/images/google_logo.png'),
                          SocialSigninComponent(
                              color: _controller.isDarkModeEnabled.value,
                              image: 'assets/images/apple_logo.png'),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
