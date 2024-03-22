import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:loadclear/common/button_component.dart';
import 'package:loadclear/common/constant.dart';
import 'package:loadclear/common/onboarding_text_component.dart';
import 'package:loadclear/common/textfield_component.dart';
import 'package:loadclear/utils/validations.dart';
import 'package:loadclear/view/auth/pass_verify_screen.dart';

import '../../view_model/themecontroller.dart';

// ignore: must_be_immutable
class EmailVerifyScreen extends StatefulWidget {
  const EmailVerifyScreen({super.key});

  @override
  State<EmailVerifyScreen> createState() => _EmailVerifyScreenState();
}

class _EmailVerifyScreenState extends State<EmailVerifyScreen> {
  TextEditingController emailVerify = TextEditingController();
  final FocusNode emailVerifyFocus = FocusNode();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    super.dispose();
    FocusScope.of(context).unfocus();
    emailVerifyFocus.unfocus();
  }

  final ThemeController _controller = Get.find<ThemeController>();
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
                    child: OnBoardingTextComponent(text: 'Email Verification')),
                Constants.verticalSpace(131.0.h),
                Center(
                    child: FittedBox(
                  child: OnBoardingTextComponent(
                    text: 'Enter your registered email',
                    fontsize: 16.0.sp,
                    weight: FontWeight.w400,
                  ),
                )),
                Constants.verticalSpace(10.0.h),
                Form(
                  key: _formKey,
                  child: TextFieldComponent(
                    emailVerify,
                    currentFocus: emailVerifyFocus,
                    keyboardType: TextInputType.emailAddress,
                    validator: validateEmail,
                    hintLabelText: 'ohja@gmail.com',
                    hintTextStyle: TextStyle(
                        fontSize: 14.0.sp,
                        color: _controller.isDarkModeEnabled.value
                            ? Theme.of(context).secondaryHeaderColor
                            : Theme.of(context).hintColor),
                    borderColor: _controller.isDarkModeEnabled.value
                        ? Theme.of(context).highlightColor
                        : Theme.of(context).hoverColor,
                  ),
                ),
                Constants.verticalSpace(226.0.h),
                ButtonComponent(
                  text: 'Send Code',
                  onPressed: () {
                    emailVerifyFocus.unfocus();
                    if (_formKey.currentState!.validate()) {
                      Get.to(() => PasswordVerifyScreen());
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
