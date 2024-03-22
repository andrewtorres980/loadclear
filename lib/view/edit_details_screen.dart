import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:loadclear/common/app_bar%20_component.dart';
import 'package:loadclear/common/button_component.dart';
import 'package:loadclear/common/camera_bottomsheet_component.dart';
import 'package:loadclear/common/constant.dart';
import 'package:loadclear/common/textfield_component.dart';
import 'package:loadclear/utils/app_colors.dart';
import 'package:loadclear/utils/validations.dart';
import 'package:loadclear/view_model/edit_details_controller.dart';
import 'package:loadclear/view_model/themecontroller.dart';
import 'package:loadclear/view_model/user_profile_controller.dart';

// ignore: must_be_immutable
class EditDetailScreen extends StatelessWidget {
  String name;
  String emailAddress;
  EditDetailScreen({super.key, required this.name, required this.emailAddress});
  final ThemeController _controller = Get.find<ThemeController>();
  final EditDetailsController _editDetailsController =
      Get.put(EditDetailsController());
  final UserProfileController _userProfileController =
      Get.put(UserProfileController());
  final ThemeController homeController = Get.put(ThemeController());

  @override
  Widget build(BuildContext context) {
    _editDetailsController.nameController.text = name;
    _editDetailsController.emailController.text = emailAddress;

    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(60),
          child: AppBarComponent(
            title: 'Edit details',
          )),
      body: AnnotatedRegion(
        value: SystemUiOverlayStyle(
          statusBarColor: Theme.of(context).scaffoldBackgroundColor,
          statusBarIconBrightness: Theme.of(context).brightness,
          systemNavigationBarColor: Theme.of(context).scaffoldBackgroundColor,
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: Constants.horizontalPadding),
            child: Form(
              key: _editDetailsController.editDetailsKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Constants.verticalSpace(30.0),
                  Stack(
                    children: [
                      Obx(
                        () => Container(
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                            height: 140.0.h,
                            width: 140.0.h,
                            decoration: BoxDecoration(
                                color: Colors.grey.shade200,
                                borderRadius: BorderRadius.circular(70)),
                            child: _editDetailsController.image.value.isEmpty
                                ? Image.asset(
                                    'assets/images/user_image.png',
                                    fit: BoxFit.cover,
                                  )
                                : Image.file(
                                    File(
                                      _editDetailsController.image.value,
                                    ),
                                    fit: BoxFit.cover,
                                  )),
                      ),
                      Constants.horizontalSpace(20.0),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: GestureDetector(
                          onTap: () {
                            Get.bottomSheet(
                                elevation: 0,
                                enableDrag: true,
                                // backgroundColor:
                                //     Color(0xFFD9D9D9).withOpacity(0.3),
                                isScrollControlled: true,
                                CameraBottomSheet(
                                    context: context,
                                    borderColor: homeController
                                            .isDarkModeEnabled.value
                                        ? Theme.of(context).secondaryHeaderColor
                                        : Theme.of(context).hintColor,
                                    controller: _editDetailsController));
                          },
                          child: CircleAvatar(
                            backgroundColor: AppColors.buttonColor,
                            child: Image.asset('assets/images/edit_icon.png',
                                color: Colors.white),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Constants.verticalSpace(60.0),
                  TextFieldComponent(
                    _editDetailsController.nameController,
                    currentFocus: _editDetailsController.nameFocus,
                    labelColor: Theme.of(context).secondaryHeaderColor,
                    labelText: 'Name',
                    hintLabelText: 'Enter your name',
                    validator: validateName,
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
                    _editDetailsController.emailController,
                    currentFocus: _editDetailsController.emailFocus,
                    labelColor: Theme.of(context).secondaryHeaderColor,
                    labelText: 'Email address',
                    readOnly: true,
                    suffixIcon: Icon(
                      Icons.lock,
                      color: Theme.of(context).disabledColor,
                    ),
                    onSuffixPressed: () {},
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
                    text: 'Save',
                    onPressed: () {
                      if (_editDetailsController.editDetailsKey.currentState!
                          .validate()) {
                        _userProfileController.nameController.text =
                            _editDetailsController.nameController.text;
                        _userProfileController.emailController.text =
                            _editDetailsController.emailController.text;
                        Get.back();
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
