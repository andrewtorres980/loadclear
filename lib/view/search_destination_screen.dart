import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:loadclear/common/constant.dart';
import '../common/textfield_component.dart';
import '../view_model/themecontroller.dart';
import 'Components/search_destination_list_sheet.dart';

class SearchDestinationScreen extends StatefulWidget {
  const SearchDestinationScreen({super.key});

  @override
  State<SearchDestinationScreen> createState() =>
      _SearchDestinationScreenState();
}

class _SearchDestinationScreenState extends State<SearchDestinationScreen> {
  final _controller = Get.put(ThemeController());
  final searchController = TextEditingController();
  final FocusNode searchFocus = FocusNode();
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnnotatedRegion(
        value: SystemUiOverlayStyle(
          statusBarColor: Theme.of(context).scaffoldBackgroundColor,
          statusBarIconBrightness: Theme.of(context).brightness,
          systemNavigationBarColor: Theme.of(context).scaffoldBackgroundColor,
        ),
        child: Stack(
          children: [
            Container(
              height: double.infinity,
              width: double.infinity,
              child: Image.asset(
                _controller.isDarkModeEnabled.value
                    ? 'assets/images/map_marker_d.jpg'
                    : 'assets/images/map_marker_l.jpg',
                fit: BoxFit.fill,
              ),
            ),
            Positioned(
              // width: MediaQuery.of(context).size.width,
              top: 50.h,
              left: 0,
              child: GestureDetector(
                onTap: () {
                  Get.back();
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(
                    Platform.isIOS ? Icons.arrow_back_ios : Icons.arrow_back,
                    size: 24,
                    color: Theme.of(context).secondaryHeaderColor,
                  ),
                ),
              ),
            ),
            Positioned(
              width: MediaQuery.of(context).size.width,
              top: 100.h,
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: Constants.horizontalPadding),
                child: TextFieldComponent(
                  searchController,
                  currentFocus: searchFocus,
                  labelColor: Theme.of(context).secondaryHeaderColor,
                  hintLabelText: 'Destination point',
                  hintTextStyle: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 15.sp,
                      color: _controller.isDarkModeEnabled.value
                          ? Theme.of(context).secondaryHeaderColor
                          : Theme.of(context).hintColor),
                  borderColor: _controller.isDarkModeEnabled.value
                      ? Theme.of(context).highlightColor
                      : Theme.of(context).hoverColor,
                  //  validator: validatePassword,
                  onEditingCompleted: () {
                    if (searchController.text.isNotEmpty) {
                      isLoading = true;
                      Get.bottomSheet(
                          backgroundColor: Theme.of(context).hoverColor,
                          SearchDestinationListSheet());
                    } else {
                      Get.snackbar(
                          backgroundColor:
                              Theme.of(context).indicatorColor.withOpacity(0.7),
                          'Error',
                          "Please Enter Destination");
                    }
                  },
                  suffixIcon: Icon(
                    Icons.close,
                    color: Theme.of(context).hintColor,
                    size: 24.sp,
                  ),
                  onSuffixPressed: () {
                    searchController.clear();
                  },
                ),
              ),
            ),

        isLoading? Positioned(
                  width: MediaQuery.of(context).size.width,
                  top: 170.h,
                  left: 20.h,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                        decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                  color: Theme.of(context)
                                      .hintColor
                                      .withOpacity(0.5),
                                  offset: Offset(0.12, 0.5),
                                  blurRadius: 3)
                            ],
                            color: Theme.of(context).highlightColor,
                            border: Border.all(
                                color: _controller.isDarkModeEnabled.value
                                    ? Theme.of(context).highlightColor
                                    : Theme.of(context).hoverColor,
                                width: 1),
                            borderRadius: BorderRadius.circular(8)),
                        child: Center(
                          child: Text(
                            'Open Now',
                            style: TextStyle(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w400,
                                color: _controller.isDarkModeEnabled.value
                                    ? Theme.of(context).secondaryHeaderColor
                                    : Theme.of(context).hintColor),
                          ),
                        ),
                      ),
                      Constants.horizontalSpace(10.h),
                      Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                        decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                  color: Theme.of(context)
                                      .hintColor
                                      .withOpacity(0.5),
                                  offset: Offset(0.12, 0.5),
                                  blurRadius: 3)
                            ],
                            color: Theme.of(context).highlightColor,
                            border: Border.all(
                                color: _controller.isDarkModeEnabled.value
                                    ? Theme.of(context).highlightColor
                                    : Theme.of(context).hoverColor,
                                width: 1),
                            borderRadius: BorderRadius.circular(8)),
                        child: Center(
                          child: Text(
                            'Nearby',
                            style: TextStyle(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w400,
                                color: _controller.isDarkModeEnabled.value
                                    ? Theme.of(context).secondaryHeaderColor
                                    : Theme.of(context).hintColor),
                          ),
                        ),
                      ),
                    ],
                  ),
                ):SizedBox.shrink()
          ],
        ),
      ),
    );
  }
}
