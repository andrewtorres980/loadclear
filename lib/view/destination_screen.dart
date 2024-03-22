import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:loadclear/common/constant.dart';
import '../view_model/themecontroller.dart';
import 'direction_start_screen.dart';

class DestinationScreen extends StatefulWidget {
  const DestinationScreen({super.key});

  @override
  State<DestinationScreen> createState() => _DestinationScreenState();
}

class _DestinationScreenState extends State<DestinationScreen> {
  final _controller = Get.put(ThemeController());
  final searchController = TextEditingController();
  final destinationController = TextEditingController();
  final FocusNode searchFocus = FocusNode();
  final FocusNode destinationFocus = FocusNode();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      // drawer: AppDrawerComponent(),
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
                    ? 'assets/images/route_dark.jpg'
                    : 'assets/images/route1.png',
                fit: _controller.isDarkModeEnabled.value
                    ? BoxFit.cover
                    : BoxFit.fill,
              ),
            ),
            Positioned(
              // width: MediaQuery.of(context).size.width,
              top: 50.h,
              left: 0,
              child: GestureDetector(
                onTap: () {
                  print('dsffds');
                  //scaffoldKey.currentState!.openDrawer();
                  Get.back();
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(
                    Platform.isIOS ? Icons.arrow_back_ios : Icons.arrow_back,
                    size: 24,
                    color: Theme.of(context).secondaryHeaderColor,
                  ),
                  // Image.asset(
                  //   'assets/images/menu.png',
                  //   height: 24.h,
                  //   width: 24.h,
                  //   color: _controller.isDarkModeEnabled.value
                  //       ? Colors.white
                  //       : null,
                  // ),
                ),
              ),
            ),
            // Positioned(
            //   width: MediaQuery.of(context).size.width,
            //   top: 100.h,
            //   child: Padding(
            //     padding: EdgeInsets.symmetric(
            //         horizontal: Constants.horizontalPadding),
            //     child: Column(
            //       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            //       crossAxisAlignment: CrossAxisAlignment.center,
            //       children: [
            //         TextFieldComponent(
            //           searchController,
            //           currentFocus: searchFocus,
            //           nextFocus: destinationFocus,
            //           labelColor: Theme.of(context).secondaryHeaderColor,
            //           hintLabelText: 'My Location',
            //           hintTextStyle: TextStyle(
            //               fontWeight: FontWeight.w400,
            //               fontSize: 15.sp,
            //               color: _controller.isDarkModeEnabled.value
            //                   ? Theme.of(context).secondaryHeaderColor
            //                   : Theme.of(context).hintColor),
            //           borderColor: _controller.isDarkModeEnabled.value
            //               ? Theme.of(context).highlightColor
            //               : Theme.of(context).hoverColor,
            //           // validator: validatePassword,
            //           suffixIcon: Icon(
            //             Icons.close,
            //             color: Theme.of(context).hintColor,
            //               size: 24.sp,
            //           ),
            //           onSuffixPressed: () {
            //             searchController.clear();
            //           },
            //            onEditingCompleted: () {
            //             if(searchController.text.isNotEmpty){
            //               print('Hello');
            //             // Get.bottomSheet(DestinationBottomSheet());
            //             }else{
            //               Get.snackbar(
            //                 backgroundColor: Theme.of(context).indicatorColor.withOpacity(0.7),
            //                 'Error', "Please Enter Destination");
            //             }
            //           },
            //         ),
            //         TextFieldComponent(
            //           destinationController,
            //           currentFocus: destinationFocus,
            //           labelColor: Theme.of(context).secondaryHeaderColor,
            //           hintLabelText: 'Destination point',
            //           hintTextStyle: TextStyle(
            //               fontWeight: FontWeight.w400,
            //               fontSize: 15.sp,
            //               color: _controller.isDarkModeEnabled.value
            //                   ? Theme.of(context).secondaryHeaderColor
            //                   : Theme.of(context).hintColor),
            //           borderColor: _controller.isDarkModeEnabled.value
            //               ? Theme.of(context).highlightColor
            //               : Theme.of(context).hoverColor,
            //           //  validator: validatePassword,
            //           onEditingCompleted: () {
            //             if(destinationController.text.isNotEmpty){
            //             Get.bottomSheet(DestinationBottomSheet());
            //             }else{
            //               Get.snackbar(
            //                 backgroundColor: Theme.of(context).indicatorColor.withOpacity(0.7),
            //                 'Error', "Please Enter Destination");
            //             }
            //           },
            //           suffixIcon: Icon(
            //             Icons.close,
            //             color: Theme.of(context).hintColor,
            //             size: 24.sp,
            //           ),
            //           onSuffixPressed: () {
            //             destinationController.clear();
            //           },
            //         ),

            //         // Container(
            //         //   margin: EdgeInsets.symmetric(horizontal: 15),
            //         //   height: 50,
            //         //   width: 50,
            //         //   decoration: BoxDecoration(
            //         //       color: Colors.greenAccent,
            //         //       border: Border.all(color: Colors.white, width: 5),
            //         //       borderRadius: BorderRadius.circular(12)),
            //         //   child: Center(
            //         //     child: Image.asset('assets/images/truck.png'),
            //         //   ),
            //         // ),
            //       ],
            //     ),
            //   ),
            // ),

            // Obx(() => Positioned(
            //       width: MediaQuery.of(context).size.width,
            //       top: 170.h,
            //       left: 50.h,
            //       child: Row(
            //         mainAxisAlignment: MainAxisAlignment.start,
            //         crossAxisAlignment: CrossAxisAlignment.center,
            //         children: [
            //           Container(
            //             padding:
            //                 EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            //             decoration: BoxDecoration(
            //                 boxShadow: [
            //                   BoxShadow(
            //                       color: Theme.of(context)
            //                           .hintColor
            //                           .withOpacity(0.5),
            //                       offset: Offset(0.12, 0.5),
            //                       blurRadius: 3)
            //                 ],
            //                 color: Theme.of(context).highlightColor,
            //                 border: Border.all(
            //                     color: _controller.isDarkModeEnabled.value
            //                         ? Theme.of(context).highlightColor
            //                         : Theme.of(context).hoverColor,
            //                     width: 1),
            //                 borderRadius: BorderRadius.circular(8)),
            //             child: Center(
            //               child: Text(
            //                 'Open Now',
            //                 style: TextStyle(
            //                     fontSize: 14.sp,
            //                     fontWeight: FontWeight.w400,
            //                     color: _controller.isDarkModeEnabled.value
            //                         ? Theme.of(context).secondaryHeaderColor
            //                         : Theme.of(context).hintColor),
            //               ),
            //             ),
            //           ),
            //           Constants.horizontalSpace(10.h),
            //           Container(
            //             padding:
            //                 EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            //             decoration: BoxDecoration(
            //                 boxShadow: [
            //                   BoxShadow(
            //                       color: Theme.of(context)
            //                           .hintColor
            //                           .withOpacity(0.5),
            //                       offset: Offset(0.12, 0.5),
            //                       blurRadius: 3)
            //                 ],
            //                 color: Theme.of(context).highlightColor,
            //                 border: Border.all(
            //                     color: _controller.isDarkModeEnabled.value
            //                         ? Theme.of(context).highlightColor
            //                         : Theme.of(context).hoverColor,
            //                     width: 1),
            //                 borderRadius: BorderRadius.circular(8)),
            //             child: Center(
            //               child: Text(
            //                 'Nearby',
            //                 style: TextStyle(
            //                     fontSize: 14.sp,
            //                     fontWeight: FontWeight.w400,
            //                     color: _controller.isDarkModeEnabled.value
            //                         ? Theme.of(context).secondaryHeaderColor
            //                         : Theme.of(context).hintColor),
            //               ),
            //             ),
            //           ),
            //         ],
            //       ),
            //     )),

            Positioned(
                width: MediaQuery.of(context).size.width,
                bottom: 0.h,
                // left: 50.h,
                child: Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                      color: Theme.of(context).scaffoldBackgroundColor,
                      border: Border.all(color: Theme.of(context).hoverColor),
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20))),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // Row(
                      //   mainAxisAlignment:
                      //       MainAxisAlignment.end,
                      //   children: [

                      //     GestureDetector(
                      //       onTap: (){
                      //           Get.back();
                      //       },
                      //       child: Icon(
                      //         Icons.close,
                      //         size: 22.sp,
                      //         color:
                      //             Theme.of(context).secondaryHeaderColor,
                      //       ),
                      //     ),
                      //   ],
                      // ),

                      Constants.verticalSpace(24.sp),
                      // Text(
                      //   'Bike repair shop . 38 38th street',
                      //   style: TextStyle(
                      //       fontSize: 16,
                      //       color: Theme.of(context).hintColor),
                      // ),
                      // Constants.verticalSpace(10.sp),
                      // RichText(
                      //     text: TextSpan(children: [
                      //   TextSpan(
                      //     text: 'Closed .',
                      //     style: TextStyle(
                      //       color: Theme.of(context).indicatorColor,
                      //       fontSize: 16.sp,
                      //     ),
                      //   ),
                      //   TextSpan(
                      //     text: 'Opens 10 am',
                      //     style: TextStyle(
                      //       color: Theme.of(context).hintColor,
                      //       fontSize: 16.sp,
                      //     ),
                      //   ),
                      // ])),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          //                 GestureDetector(
                          //                   onTap: () {
                          //                     Get.to(DestinationScreen());
                          //                   },
                          //                   child: Container(
                          //                     padding: EdgeInsets.symmetric(
                          //                         horizontal: 10, vertical: 5),
                          //                     decoration: BoxDecoration(
                          //                         color:
                          //                             Theme.of(context).highlightColor,
                          //                         border: Border.all(
                          //                             color: _controller
                          //                                     .isDarkModeEnabled.value
                          //                                 ? Theme.of(context)
                          //                                     .highlightColor
                          //                                 : Theme.of(context)
                          //                                     .hoverColor.withOpacity(0.7)),
                          //                         borderRadius:
                          //                             BorderRadius.circular(15)),
                          //                     child: Row(
                          //                       mainAxisAlignment: MainAxisAlignment.start,
                          //                       children: [
                          //                         Padding(
                          //   padding: EdgeInsets.only(right: 8.h),

                          //   child: Image.asset('assets/images/direction.png',
                          //    height: 24.h,
                          //                       width: 24.h,),
                          // ),
                          //                         Text(
                          //                           'Direction',
                          //                           style: TextStyle(
                          //                             fontWeight: FontWeight.w400,
                          //                             color:  _controller
                          //                                         .isDarkModeEnabled.value
                          //                                     ?Theme.of(context).secondaryHeaderColor:Theme.of(context).primaryColor,
                          //                             fontSize: 16.sp,
                          //                           ),
                          //                         ),
                          //                       ],
                          //                     ),
                          //                   ),
                          //                 ),

                          GestureDetector(
                            onTap: () {
                              Get.to(const DirectionStartScreen());
                            },
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 5),
                              decoration: BoxDecoration(
                                  color: Theme.of(context).highlightColor,
                                  border: Border.all(
                                      color: _controller.isDarkModeEnabled.value
                                          ? Theme.of(context).highlightColor
                                          : Theme.of(context).hoverColor),
                                  borderRadius: BorderRadius.circular(15)),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(right: 8.h),
                                    child: Image.asset(
                                      'assets/images/start.png',
                                      height: 24.h,
                                      width: 24.h,
                                    ),
                                  ),
                                  Text(
                                    'Start',
                                    style: TextStyle(
                                      color: _controller.isDarkModeEnabled.value
                                          ? Theme.of(context)
                                              .secondaryHeaderColor
                                          : Theme.of(context).primaryColor,
                                      fontSize: 16.sp,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Constants.horizontalSpace(15.h),
                          RichText(
                              text: TextSpan(children: [
                            TextSpan(
                              text: '26 min  ',
                              style: TextStyle(
                                color: _controller.isDarkModeEnabled.value
                                    ? Theme.of(context).secondaryHeaderColor
                                    : Theme.of(context).primaryColor,
                                fontSize: 18.sp,
                              ),
                            ),
                            TextSpan(
                              text: '(24 km)',
                              style: TextStyle(
                                color: _controller.isDarkModeEnabled.value
                                    ? Theme.of(context).secondaryHeaderColor
                                    : Theme.of(context).primaryColor,
                                fontSize: 18.sp,
                              ),
                            ),
                          ])),
                        ],
                      ),
                    ],
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
