import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:loadclear/common/drawer_component.dart';
import '../view_model/themecontroller.dart';
import '../view_model/switch_vehicle_controller.dart';
import 'search_destination_screen.dart';
import 'switch_vehicle_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool clearAdd = false;
  final _controller = Get.put(ThemeController());
  final searchController = TextEditingController();

  final FocusNode searchFocus = FocusNode();
  final SwitchVehicleController _switchVehicleController =
      Get.put(SwitchVehicleController());
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      // floatingActionButton: Container(
      //   padding: const EdgeInsets.all(10.0),
      //   decoration: BoxDecoration(
      //       color: Theme.of(context).highlightColor, shape: BoxShape.circle),
      //   child: Icon(
      //     color: _controller.isDarkModeEnabled.value
      //         ? Colors.white
      //         : Theme.of(context).primaryColor,
      //     Icons.my_location_sharp,
      //     size: 24.sp,
      //   ),
      // ),
      drawer: AppDrawerComponent(
        backgroundColor: _controller.isDarkModeEnabled.value
            ? Theme.of(context).highlightColor
            : Theme.of(context).scaffoldBackgroundColor,
        textColor: _controller.isDarkModeEnabled.value
            ? Theme.of(context).secondaryHeaderColor
            : Theme.of(context).hintColor,
        imageColor: _controller.isDarkModeEnabled.value
            ? Theme.of(context).secondaryHeaderColor
            : null,
      ),
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
                    ? 'assets/images/dark_map.jpg'
                    : 'assets/images/map2.png',
                fit: BoxFit.fill,
              ),
            ),
            Positioned(
              width: MediaQuery.of(context).size.width,
              top: 100.h,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      print('dsfd');
                      scaffoldKey.currentState?.openDrawer();
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image.asset(
                        'assets/images/menu.png',
                        height: 24.h,
                        width: 24.h,
                        color: _controller.isDarkModeEnabled.value
                            ? Colors.white
                            : null,
                      ),
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        Get.to(() => const SearchDestinationScreen());
                      },
                      child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 10),
                          decoration: BoxDecoration(
                              color: Theme.of(context).highlightColor,
                              boxShadow: [
                                BoxShadow(
                                    color: Theme.of(context)
                                        .hintColor
                                        .withOpacity(0.5),
                                    offset: const Offset(0.12, 0.5),
                                    blurRadius: 3)
                              ],
                              border: Border.all(
                                color: _controller.isDarkModeEnabled.value
                                    ? Theme.of(context).highlightColor
                                    : Theme.of(context).hoverColor,
                              ),
                              borderRadius: BorderRadius.circular(8)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Where to',
                                style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 15.sp,
                                    color: _controller.isDarkModeEnabled.value
                                        ? Theme.of(context).secondaryHeaderColor
                                        : Theme.of(context).hintColor),
                              ),
                              Icon(
                                Icons.search,
                                color: _controller.isDarkModeEnabled.value
                                    ? Theme.of(context).secondaryHeaderColor
                                    : Theme.of(context).hintColor,
                              ),
                            ],
                          )),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.to(SwitchVehicleScreen());
                    },
                    child: Obx(() {
                      return Container(
                        margin: const EdgeInsets.symmetric(horizontal: 15),
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                            color: Colors.greenAccent,
                            border: Border.all(color: Colors.white, width: 5),
                            image: DecorationImage(
                                image: AssetImage(
                                  _switchVehicleController.imageSelected.value,
                                ),
                                fit: BoxFit.cover),
                            borderRadius: BorderRadius.circular(12)),
                      );
                    }),
                  )
                ],
              ),
            ),
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
            clearAdd
                ? SizedBox()
                : Positioned(
                    bottom: 15,
                    width: Get.width,
                    child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 15),
                      padding: EdgeInsets.zero,
                      height: 160,
                      width: Get.width,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          image: const DecorationImage(
                              image: AssetImage('assets/images/ads.png'),
                              fit: BoxFit.fitWidth)),
                      child: Align(
                        alignment: Alignment.topRight,
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              clearAdd = true;
                            });
                          },
                          child: Container(
                            margin: const EdgeInsets.all(5.0),
                            padding: const EdgeInsets.all(5.0),
                            decoration: const BoxDecoration(
                                color: Colors.white, shape: BoxShape.circle),
                            child: Icon(
                              Icons.close,
                              size: 20.sp,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                    ),
                  )
          ],
        ),
      ),
    );
  }
}
