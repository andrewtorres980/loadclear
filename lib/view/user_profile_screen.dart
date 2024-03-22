import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:loadclear/common/app_bar%20_component.dart';
import 'package:loadclear/common/button_component.dart';
import 'package:loadclear/common/constant.dart';
import 'package:loadclear/common/textfield_component.dart';
import 'package:loadclear/view/edit_details_screen.dart';
import 'package:loadclear/view_model/edit_details_controller.dart';
import 'package:loadclear/view_model/themecontroller.dart';
import 'package:loadclear/view_model/user_profile_controller.dart';

class UserProfileScreen extends StatelessWidget {
  UserProfileScreen({super.key});
  final ThemeController _controller = Get.find<ThemeController>();
  final UserProfileController _userProfileController =
      Get.put(UserProfileController());
  final EditDetailsController _editDetailController =
      Get.put(EditDetailsController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(60),
          child: AppBarComponent(
            title: 'User profile',
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
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Constants.verticalSpace(30.0),
              Obx(
                () => Container(
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    height: 140.0.h,
                    width: 140.0.h,
                    decoration: BoxDecoration(
                        color: Colors.grey.shade200,
                        borderRadius: BorderRadius.circular(70)),
                    child: _editDetailController.image.value.isEmpty
                        ? Image.asset(
                            'assets/images/user_image.png',
                            fit: BoxFit.cover,
                          )
                        : Image.file(
                            File(
                              _editDetailController.image.value,
                            ),
                            fit: BoxFit.cover,
                          )),
              ),
              Constants.verticalSpace(60.0),
              TextFieldComponent(
                _userProfileController.nameController,
                currentFocus: _userProfileController.nameFocus,
                labelColor: Theme.of(context).secondaryHeaderColor,
                labelText: 'Name',
                readOnly: true,
                hintTextStyle: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 12.sp,
                    color: _controller.isDarkModeEnabled.value
                        ? Theme.of(context).secondaryHeaderColor
                        : Theme.of(context).hintColor),
                borderColor: _controller.isDarkModeEnabled.value
                    ? Theme.of(context).highlightColor
                    : Theme.of(context).hoverColor,
              ),
              Constants.verticalSpace(20.0),
              TextFieldComponent(
                _userProfileController.emailController,
                currentFocus: _userProfileController.emailFocus,
                labelColor: Theme.of(context).secondaryHeaderColor,
                labelText: 'Email address',
                readOnly: true,
                hintTextStyle: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 12.sp,
                    color: _controller.isDarkModeEnabled.value
                        ? Theme.of(context).secondaryHeaderColor
                        : Theme.of(context).hintColor),
                borderColor: _controller.isDarkModeEnabled.value
                    ? Theme.of(context).highlightColor
                    : Theme.of(context).hoverColor,
              ),
              Constants.verticalSpace(230.0),
              ButtonComponent(
                text: 'Edit',
                onPressed: () {
                  Get.to(() => EditDetailScreen(
                        name: _userProfileController.nameController.text,
                        emailAddress:
                            _userProfileController.emailController.text,
                      ));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
