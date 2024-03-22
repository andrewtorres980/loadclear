import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:loadclear/common/onboarding_text_component.dart';
import 'package:loadclear/common/textfield_component.dart';
import 'package:loadclear/utils/validations.dart';
import 'package:loadclear/view/auth/signin_screen.dart';
import 'package:loadclear/view/on%20boarding/no_of_vehicles_screen.dart';
import 'package:loadclear/view/privacy_policy_screen.dart';
import 'package:loadclear/view/term_condition_screen.dart';
import 'package:loadclear/view_model/auth/signup_screen_controller.dart';
import 'package:loadclear/view_model/themecontroller.dart';

import '../../common/button_component.dart';
import '../../common/constant.dart';
import '../../common/soicial_signin_component.dart';
import '../../utils/app_colors.dart';

class SignupScreen extends StatelessWidget {
  SignupScreen({super.key});

  final SignupController controller = Get.put(SignupController());
  final ThemeController _controller = Get.put(ThemeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: true,
        body: AnnotatedRegion(
            value: SystemUiOverlayStyle(
              statusBarColor: Theme.of(context).scaffoldBackgroundColor,
              statusBarIconBrightness: Theme.of(context).brightness,
              systemNavigationBarColor:
                  Theme.of(context).scaffoldBackgroundColor,
            ),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Constants.verticalSpace(83.h),
                  Center(child: OnBoardingTextComponent(text: 'Sign up')),
                  Constants.verticalSpace(40.h),
                  Form(
                    key: controller.signupKey,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: Constants.horizontalPadding),
                      child: Column(
                        children: [
                          TextFieldComponent(
                            fillColor: Theme.of(context).highlightColor,
                            controller.nameController,
                            currentFocus: controller.nameFocus,
                            labelColor: Theme.of(context).secondaryHeaderColor,
                            labelText: 'Name',
                            hintLabelText: 'Enter your name',
                            hintTextStyle: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 12.sp,
                                color: _controller.isDarkModeEnabled.value
                                    ? Theme.of(context).secondaryHeaderColor
                                    : Theme.of(context).hintColor),
                            borderColor: _controller.isDarkModeEnabled.value
                                ? Theme.of(context).highlightColor
                                : Theme.of(context).hoverColor,
                            validator: validateName,
                          ),
                          Constants.verticalSpace(20.h),
                          TextFieldComponent(
                            fillColor: Theme.of(context).highlightColor,
                            controller.emailController,
                            currentFocus: controller.emailFocus,
                            labelColor: Theme.of(context).secondaryHeaderColor,
                            labelText: 'Email',
                            hintLabelText: 'Enter your email..',
                            hintTextStyle: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 12.sp,
                                color: _controller.isDarkModeEnabled.value
                                    ? Theme.of(context).secondaryHeaderColor
                                    : Theme.of(context).hintColor),
                            borderColor: _controller.isDarkModeEnabled.value
                                ? Theme.of(context).highlightColor
                                : Theme.of(context).hoverColor,
                            validator: validateEmail,
                          ),
                          Constants.verticalSpace(20.h),
                          TextFieldComponent(
                            fillColor: Theme.of(context).highlightColor,
                            controller.passwordController,
                            currentFocus: controller.passwordFocus,
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
                          Constants.verticalSpace(20.h),
                          TextFieldComponent(
                            fillColor: Theme.of(context).highlightColor,
                            controller.reenterPasswordController,
                            currentFocus: controller.reenterFocus,
                            labelColor: Theme.of(context).secondaryHeaderColor,
                            labelText: 'Re-enter password',
                            hintLabelText: 'Re-enter your password',
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
                            validator: (value) {
                              if (controller.reenterPasswordController.text ==
                                      '' ||
                                  controller
                                      .reenterPasswordController.text.isEmpty) {
                                return "Please Confirm your password";
                              }
                              if (controller.passwordController.value ==
                                  controller.reenterPasswordController.value) {
                                return null;
                              } else {
                                return "Password does not match";
                              }
                            },
                          ),
                          Constants.verticalSpace(50.h),
                          ButtonComponent(
                            text: 'Sign up',
                            onPressed: () =>
                                Get.offAll(() => NoOfVehiclesScreen()),
                          ),
                          Constants.verticalSpace(20.h),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Already have an account? ',
                                style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 12.sp,
                                    color: _controller.isDarkModeEnabled.value
                                        ? AppColors.lightTextColor
                                        : Theme.of(context)
                                            .secondaryHeaderColor),
                              ),
                              GestureDetector(
                                onTap: () => Get.off(() => SigninScreen()),
                                child: Text(
                                  'Login',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 12.sp,
                                      color: AppColors.buttonColor),
                                ),
                              )
                            ],
                          ),
                          Constants.verticalSpace(46.h),
                          RichText(
                              textAlign: TextAlign.center,
                              text: TextSpan(
                                  text: 'By registering, you accept our ',
                                  style: TextStyle(
                                      fontFamily: 'Gilroy',
                                      fontSize: 12.sp,
                                      color: Theme.of(context)
                                          .secondaryHeaderColor,
                                      fontWeight: FontWeight.w400),
                                  children: [
                                    TextSpan(
                                        text: 'Terms & Conditions',
                                        recognizer: TapGestureRecognizer()
                                          ..onTap = () {
                                            Get.to(const TermConditionScreen());
                                            // controller.openTermsAndConditions();
                                          },
                                        style: TextStyle(
                                            fontFamily: 'Gilroy',
                                            fontSize: 12.sp,
                                            color:
                                                Theme.of(context).primaryColor,
                                            fontWeight: FontWeight.w600)),
                                    TextSpan(
                                        text: ' and',
                                        style: TextStyle(
                                            fontFamily: 'Gilroy',
                                            fontSize: 12.sp,
                                            color: Theme.of(context)
                                                .secondaryHeaderColor,
                                            fontWeight: FontWeight.w400)),
                                    TextSpan(
                                        text: ' Privacy Policy',
                                        recognizer: TapGestureRecognizer()
                                          ..onTap = () {
                                            //controller.openPrivacyPolicy();
                                            Get.to(const PrivacyPolicyScreen());
                                          },
                                        style: TextStyle(
                                            fontFamily: 'Gilroy',
                                            fontSize: 12.sp,
                                            color:
                                                Theme.of(context).primaryColor,
                                            fontWeight: FontWeight.w600)),
                                    TextSpan(
                                        text: '.',
                                        style: TextStyle(
                                            fontFamily: 'Gilroy',
                                            fontSize: 12.sp,
                                            color: Theme.of(context)
                                                .secondaryHeaderColor,
                                            fontWeight: FontWeight.w400))
                                  ])),
                          Constants.verticalSpace(20.h),
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
                          ),
                          Constants.verticalSpace(40.h),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            )));
  }
}
