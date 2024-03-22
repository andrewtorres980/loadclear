import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:loadclear/common/app_bar%20_component.dart';
import 'package:loadclear/common/camera_bottomsheet_component.dart';
import 'package:loadclear/common/constant.dart';
import 'package:loadclear/view/bottom_bar_nav.dart';
import 'package:loadclear/view/vehicle_list_screen.dart';
import 'package:loadclear/view_model/on%20boarding/edit_vehicle_controller.dart';

import 'package:loadclear/view_model/themecontroller.dart';

import '../../common/button_component.dart';
import '../../common/dropdown_component.dart';
import '../../common/textfield_component.dart';
import '../../utils/validations.dart';

class EditVehicleScreen extends StatelessWidget {
  EditVehicleScreen({super.key});

  final ThemeController homeController = Get.put(ThemeController());
  final args = Get.arguments;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: PreferredSize(
            preferredSize: const Size.fromHeight(60),
            child: AppBarComponent(
              title: args == 'from add vehicles'
                  ? 'Add vehicle'
                  : 'Vehicle details',
            )),
        body: GetBuilder<EditVehicleController>(
            init: EditVehicleController(),
            builder: (controller) {
              return SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: Constants.horizontalPadding),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Constants.verticalSpace(15.h),
                      Text(
                        'Vehicle Infromation',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w600),
                      ),
                      Constants.verticalSpace(27.h),
                      Obx(() => controller.selectImagePath.value.isEmpty
                          ? Container(
                              height: 165.h,
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                  color:
                                      const Color(0xFFD9D9D9).withOpacity(0.3),
                                  borderRadius: BorderRadius.circular(8.r)),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  GestureDetector(
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
                                                  ? Theme.of(context)
                                                      .secondaryHeaderColor
                                                  : Theme.of(context).hintColor,
                                              controller: controller));
                                    },
                                    child: const Icon(
                                      Icons.add,
                                      color: Color(0xFF5685B9),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 6.h,
                                  ),
                                  Text(
                                    'Upload cover',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 14.sp,
                                        color: const Color(0xFF5685B9)),
                                  )
                                ],
                              ))
                          : ClipRRect(
                              borderRadius: BorderRadius.circular(12.r),
                              child: Container(
                                height: 151.h,
                                width: MediaQuery.of(context).size.width,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        fit: BoxFit.fitWidth,
                                        image: FileImage(
                                          File(
                                              controller.selectImagePath.value),
                                        ))),
                                child: Align(
                                  alignment: Alignment.topRight,
                                  child: GestureDetector(
                                    onTap: () {
                                      print('ddsf');
                                      controller.selectImagePath.value = '';
                                    },
                                    child: Container(
                                      margin: const EdgeInsets.all(5.0),
                                      padding: const EdgeInsets.all(5.0),
                                      decoration: const BoxDecoration(
                                          color: Colors.white,
                                          shape: BoxShape.circle),
                                      child: Icon(
                                        Icons.close,
                                        size: 20.sp,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                ),
                              ))),
                      SizedBox(
                        height: 27.h,
                      ),
                      TextFieldComponent(
                        labelColor: Theme.of(context).secondaryHeaderColor,
                        labelText: 'Name of vehicle',
                        hintLabelText: 'Enter the name of vehicle',
                        hintTextStyle: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 12.sp,
                            color: homeController.isDarkModeEnabled.value
                                ? Theme.of(context).secondaryHeaderColor
                                : Theme.of(context).hintColor),
                        borderColor: homeController.isDarkModeEnabled.value
                            ? Theme.of(context).highlightColor
                            : Theme.of(context).hoverColor,
                        controller.nameController,
                        validator: validateEmail,
                        currentFocus: controller.nameFocus,
                      ),
                      SizedBox(
                        height: 27.h,
                      ),
                      Text(
                        'Type of vehicle',
                        style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w400,
                            color: homeController.isDarkModeEnabled.value
                                ? Theme.of(context).secondaryHeaderColor
                                : Theme.of(context).secondaryHeaderColor),
                      ),
                      Constants.verticalSpace(4.h),
                      CustomDropdown(
                        fillColor: Theme.of(context).highlightColor,
                        borderColor: homeController.isDarkModeEnabled.value
                            ? Theme.of(context).highlightColor
                            : Theme.of(context).hoverColor,
                        iconColor: homeController.isDarkModeEnabled.value
                            ? Theme.of(context).secondaryHeaderColor
                            : Theme.of(context).secondaryHeaderColor,
                        dropDownColor: homeController.isDarkModeEnabled.value
                            ? Theme.of(context).highlightColor
                            : Theme.of(context).scaffoldBackgroundColor,
                        height: 63.h,
                        width: MediaQuery.of(context).size.width,
                        options: controller.optionsVehichleType,
                        selectedOption:
                            controller.selectedOptionVehicleType.value,
                        onChanged: (String? newValue) {
                          if (newValue != null) {
                            controller.selectedOptionVehicleType.value =
                                newValue;
                            controller.update();
                          }
                        },
                      ),
                      SizedBox(
                        height: 27.h,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Expanded(
                            child: TextFieldComponent(
                              controller.weightController,
                              currentFocus: controller.weightFocus,
                              hintLabelText: 'Enter the weight of the vehicle',
                              hintTextStyle: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 12.sp,
                                  color: homeController.isDarkModeEnabled.value
                                      ? Theme.of(context).secondaryHeaderColor
                                      : Theme.of(context).hintColor),
                              labelText: 'Weight of vehicle',
                              labelColor: homeController.isDarkModeEnabled.value
                                  ? Theme.of(context).secondaryHeaderColor
                                  : Theme.of(context).secondaryHeaderColor,
                              borderRadius: 8.r,
                              borderColor:
                                  homeController.isDarkModeEnabled.value
                                      ? Theme.of(context).highlightColor
                                      : Theme.of(context).hoverColor,
                            ),
                          ),
                          SizedBox(
                            width: 10.w,
                          ),
                          CustomDropdown(
                            borderColor: homeController.isDarkModeEnabled.value
                                ? Theme.of(context).highlightColor
                                : Theme.of(context).hoverColor,
                            fillColor: Theme.of(context).highlightColor,
                            iconColor: homeController.isDarkModeEnabled.value
                                ? Theme.of(context).secondaryHeaderColor
                                : Theme.of(context).secondaryHeaderColor,
                            dropDownColor:
                                homeController.isDarkModeEnabled.value
                                    ? Theme.of(context).highlightColor
                                    : Theme.of(context).scaffoldBackgroundColor,
                            height: 55.h,
                            width: 90.w,
                            options: controller.optionsWeight,
                            selectedOption:
                                controller.selectedOptionWeightofVehicle.value,
                            onChanged: (String? newValue) {
                              if (newValue != null) {
                                controller.selectedOptionWeightofVehicle.value =
                                    newValue;
                                controller.update();
                              }
                            },
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 26.h,
                      ),
                      SizedBox(
                        height: 4.h,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          SizedBox(
                            width: 280.w,
                            child: TextFieldComponent(
                              controller.height,
                              labelText: 'Vehicle body measurements',
                              labelColor: homeController.isDarkModeEnabled.value
                                  ? Theme.of(context).secondaryHeaderColor
                                  : Theme.of(context).secondaryHeaderColor,
                              currentFocus: controller.heightFocus,
                              borderRadius: 8.r,
                              borderColor:
                                  homeController.isDarkModeEnabled.value
                                      ? Theme.of(context).highlightColor
                                      : Theme.of(context).hoverColor,
                              hintLabelText: 'Height',
                              hintTextStyle: TextStyle(
                                  fontSize: 14.sp,
                                  color: homeController.isDarkModeEnabled.value
                                      ? Theme.of(context).secondaryHeaderColor
                                      : Theme.of(context).secondaryHeaderColor),
                            ),
                          ),
                          SizedBox(
                            width: 10.w,
                          ),
                          Expanded(
                            child: CustomDropdown(
                              dropDownColor: homeController
                                      .isDarkModeEnabled.value
                                  ? Theme.of(context).highlightColor
                                  : Theme.of(context).scaffoldBackgroundColor,
                              borderColor:
                                  homeController.isDarkModeEnabled.value
                                      ? Theme.of(context).highlightColor
                                      : Theme.of(context).hoverColor,
                              fillColor: Theme.of(context).highlightColor,
                              iconColor: homeController.isDarkModeEnabled.value
                                  ? Theme.of(context).secondaryHeaderColor
                                  : Theme.of(context).secondaryHeaderColor,
                              height: 55.h,
                              width: 90.w,
                              options: controller.vehicleHeightMeasurement,
                              selectedOption: controller
                                  .selectedvehicleHeightMeasurement.value,
                              onChanged: (String? newValue) {
                                if (newValue != null) {
                                  controller.selectedvehicleHeightMeasurement
                                      .value = newValue;
                                  controller.update();
                                }
                              },
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 14.h,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          SizedBox(
                            width: 280.w,
                            child: TextFieldComponent(
                              controller.length,
                              currentFocus: controller.lengthFocus,
                              borderRadius: 8.r,
                              hintLabelText: 'Length',
                              hintTextStyle: TextStyle(
                                  fontSize: 14.sp,
                                  color: homeController.isDarkModeEnabled.value
                                      ? Theme.of(context).secondaryHeaderColor
                                      : Theme.of(context).secondaryHeaderColor),
                              borderColor:
                                  homeController.isDarkModeEnabled.value
                                      ? Theme.of(context).highlightColor
                                      : Theme.of(context).hoverColor,
                            ),
                          ),
                          SizedBox(
                            width: 10.w,
                          ),
                          Expanded(
                            child: CustomDropdown(
                              dropDownColor: homeController
                                      .isDarkModeEnabled.value
                                  ? Theme.of(context).highlightColor
                                  : Theme.of(context).scaffoldBackgroundColor,
                              borderColor:
                                  homeController.isDarkModeEnabled.value
                                      ? Theme.of(context).highlightColor
                                      : Theme.of(context).hoverColor,
                              fillColor: Theme.of(context).highlightColor,
                              iconColor: homeController.isDarkModeEnabled.value
                                  ? Theme.of(context).secondaryHeaderColor
                                  : Theme.of(context).secondaryHeaderColor,
                              height: 55.h,
                              width: 90.w,
                              options: controller.vehicleLengthMeasurement,
                              selectedOption: controller
                                  .selectedvehicleLengthMeasurement.value,
                              onChanged: (String? newValue) {
                                if (newValue != null) {
                                  controller.selectedvehicleLengthMeasurement
                                      .value = newValue;

                                  controller.update();
                                }
                              },
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 14.h,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          SizedBox(
                            width: 280.w,
                            child: TextFieldComponent(
                              controller.width,
                              currentFocus: controller.widthFocus,
                              borderRadius: 8.r,
                              hintLabelText: 'Width',
                              hintTextStyle: TextStyle(
                                  fontSize: 14.sp,
                                  color: homeController.isDarkModeEnabled.value
                                      ? Theme.of(context).secondaryHeaderColor
                                      : Theme.of(context).secondaryHeaderColor),
                              borderColor:
                                  homeController.isDarkModeEnabled.value
                                      ? Theme.of(context).highlightColor
                                      : Theme.of(context).hoverColor,
                            ),
                          ),
                          SizedBox(
                            width: 10.w,
                          ),
                          Expanded(
                            child: CustomDropdown(
                              dropDownColor: homeController
                                      .isDarkModeEnabled.value
                                  ? Theme.of(context).highlightColor
                                  : Theme.of(context).scaffoldBackgroundColor,
                              borderColor:
                                  homeController.isDarkModeEnabled.value
                                      ? Theme.of(context).highlightColor
                                      : Theme.of(context).hoverColor,
                              fillColor: Theme.of(context).highlightColor,
                              iconColor: homeController.isDarkModeEnabled.value
                                  ? Theme.of(context).secondaryHeaderColor
                                  : Theme.of(context).secondaryHeaderColor,
                              height: 55.h,
                              width: 90.w,
                              options: controller.vehicleWidthMeasurement,
                              selectedOption: controller
                                  .selectedvehicleWidthMeasurement.value,
                              onChanged: (String? newValue) {
                                if (newValue != null) {
                                  controller.selectedvehicleWidthMeasurement
                                      .value = newValue;
                                  controller.update();
                                }
                              },
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 52.h,
                      ),
                      ButtonComponent(
                        text: 'Save',
                        onPressed: () => Get.offAll(() => const BottomNavBar()),
                        borderRadius: 8.r,
                        buttonColor: const Color(0xFF5685B9),
                      ),
                      args == 'from edit button'
                          ? Constants.verticalSpace(10.h)
                          : const SizedBox.shrink(),
                      args == 'from edit button'
                          ? Column(
                              children: [
                                ButtonComponent(
                                  text: 'Delete vehicle',
                                  buttonColor: Colors.transparent,
                                  textColor: const Color(0XFFEA2D2D),
                                  onPressed: () {
                                    showDialog(
                                      context: context,
                                      builder: (context) => AlertDialog(
                                        // titlePadding: EdgeInsets.only(top: Constants.verticalPadding,left: Constants.horizontalPadding),
                                        // contentPadding: EdgeInsets.only(right: Constants.horizontalPadding),
                                        backgroundColor: homeController
                                                .isDarkModeEnabled.value
                                            ? Theme.of(context).highlightColor
                                            : Theme.of(context)
                                                .scaffoldBackgroundColor,
                                        title: Text(
                                          'Delete',
                                          style: TextStyle(
                                              fontSize: 20.sp,
                                              color: Theme.of(context)
                                                  .secondaryHeaderColor,
                                              fontWeight: FontWeight.w600),
                                        ),
                                        content: Text(
                                            'Are you sure you want to delete?',
                                            style: TextStyle(
                                                fontSize: 14.sp,
                                                color: homeController
                                                        .isDarkModeEnabled.value
                                                    ? Theme.of(context)
                                                        .secondaryHeaderColor
                                                    : Theme.of(context)
                                                        .hintColor,
                                                fontWeight: FontWeight.w600)),
                                        actions: [
                                          TextButton(
                                            onPressed: () {
                                              Get.to(VehicleListScreen());
                                            },
                                            child: Text('Yes',
                                                style: TextStyle(
                                                    fontSize: 16.sp,
                                                    color: Theme.of(context)
                                                        .indicatorColor,
                                                    fontWeight:
                                                        FontWeight.w600)),
                                          ),
                                          TextButton(
                                            onPressed: () {
                                              Navigator.of(context).pop();
                                            },
                                            child: Text('No',
                                                style: TextStyle(
                                                    fontSize: 16.sp,
                                                    color: Theme.of(context)
                                                        .secondaryHeaderColor,
                                                    fontWeight:
                                                        FontWeight.w600)),
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                ),
                              ],
                            )
                          : const SizedBox.shrink(),
                      Constants.verticalSpace(20.h)
                    ],
                  ),
                ),
              );
            }));
  }
}
