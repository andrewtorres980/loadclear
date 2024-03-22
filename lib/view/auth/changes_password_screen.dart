import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:loadclear/common/constant.dart';
import 'package:loadclear/common/custom_dailogbox.dart';
import 'package:loadclear/view/auth/signin_screen.dart';
import 'package:loadclear/view_model/themecontroller.dart';

import '../../common/button_component.dart';
import '../../common/onboarding_text_component.dart';
import '../../common/textfield_component.dart';
import '../../utils/validations.dart';

class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({super.key});

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  final _formKey = GlobalKey<FormState>();

  final newPassController = TextEditingController();

  final reEnterPassController = TextEditingController();

  final FocusNode passwordFocus = FocusNode();

  final FocusNode reEnterPassFocus = FocusNode();

  @override
  void dispose() {
    super.dispose();
    FocusScope.of(context).unfocus();
    passwordFocus.unfocus();
    reEnterPassFocus.unfocus();
  }

  final ThemeController _controller = Get.find<ThemeController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              horizontal: Constants.horizontalPadding),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Constants.verticalSpace(150.0.h),
                Center(
                    child: OnBoardingTextComponent(text: 'Enter New Password')),
                Constants.verticalSpace(150.0.h),
                Form(
                  key: _formKey,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      TextFieldComponent(
                        newPassController,
                        currentFocus: passwordFocus,
                        nextFocus: reEnterPassFocus,
                        keyboardType: TextInputType.text,
                        validator: validatePassword,
                        isPassword: true,
                        hintText: "Password",
                        hintLabelText: 'Password',
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
                        reEnterPassController,
                        currentFocus: reEnterPassFocus,
                        keyboardType: TextInputType.text,
                        borderColor: _controller.isDarkModeEnabled.value
                            ? Theme.of(context).highlightColor
                            : Theme.of(context).hoverColor,
                        isPassword: true,
                        validator: (value) {
                          if (newPassController.text
                                  .compareTo(reEnterPassController.text) ==
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
                    ],
                  ),
                ),
                Constants.verticalSpace(250.0.h),
                ButtonComponent(
                  text: 'Done',
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      debugPrint('Yes ');
                      // controller.resetPassword(
                      //   password: _repasswordController.text,
                      //   email: email,
                      // );
                      showDialog(
                        context: context,
                        builder: (context) {
                          return CongualationDialog(
                            title: 'Congratulations',
                            subTitle:
                                'Your new password is locked and loaded.\n Stay secure!',
                          );
                        },
                      );
                      Timer(const Duration(seconds: 3), () {
                        Get.to(SigninScreen());
                      });
                    } else {
                      debugPrint('NO!!!!');
                    }
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
