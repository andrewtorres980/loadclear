import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:loadclear/common/app_bar%20_component.dart';
import 'package:loadclear/common/button_component.dart';
import 'package:loadclear/common/constant.dart';
import 'package:loadclear/common/textfield_component.dart';
import 'package:loadclear/utils/validations.dart';
import 'package:loadclear/view/auth/signin_screen.dart';
import 'package:loadclear/view_model/auth/delete_account_controller.dart';

import '../../view_model/themecontroller.dart';

class DeleteAcountScreen extends StatelessWidget {
  DeleteAcountScreen({super.key});
  final ThemeController _controller = Get.put(ThemeController());
  final DeleteAccountController _deleteAccountController =
      Get.put(DeleteAccountController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: PreferredSize(
            preferredSize: const Size.fromHeight(60),
            child: AppBarComponent(
              title: 'Delete Account',
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
                Form(
                  key: _deleteAccountController.deleteAccountKey,
                  child: TextFieldComponent(
                    _deleteAccountController.passwordController,
                    currentFocus: _deleteAccountController.passwordFocus,
                    keyboardType: TextInputType.text,
                    validator: validatePassword,
                    isPassword: true,
                    hintText: "Password",
                    hintLabelText: "Password",
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
                ),
                Constants.verticalSpace(10.0),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Text(
                    'You must enter current password in order to delete your account',
                    style: TextStyle(
                        color: Theme.of(context).hoverColor,
                        fontSize: 14.0.h,
                        fontFamily: 'poppin',
                        fontWeight: FontWeight.w400),
                  ),
                ),
                const Spacer(),
                ButtonComponent(
                  text: 'Delete',
                  buttonColor: const Color(0xffE84444),
                  onPressed: () {
                    if (_deleteAccountController.deleteAccountKey.currentState!
                        .validate()) {
                      showDeleteDialog(context);
                    }
                  },
                ),
                Constants.verticalSpace(40.0),
              ],
            ),
          ),
        ));
  }

  void showDeleteDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        // titlePadding: EdgeInsets.only(top: Constants.verticalPadding,left: Constants.horizontalPadding),
        // contentPadding: EdgeInsets.only(right: Constants.horizontalPadding),
        backgroundColor: _controller.isDarkModeEnabled.value
            ? Theme.of(context).highlightColor
            : Theme.of(context).scaffoldBackgroundColor,
        title: Text(
          'Delete',
          style: TextStyle(
              fontSize: 20.sp,
              color: Theme.of(context).secondaryHeaderColor,
              fontWeight: FontWeight.w600),
        ),
        content: Text('Are you sure you want to delete?',
            style: TextStyle(
                fontSize: 14.sp,
                color: _controller.isDarkModeEnabled.value
                    ? Theme.of(context).secondaryHeaderColor
                    : Theme.of(context).hintColor,
                fontWeight: FontWeight.w600)),
        actions: [
          TextButton(
            onPressed: () {
              Get.to(SigninScreen());
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
  }
}
