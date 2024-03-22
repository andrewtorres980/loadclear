import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:loadclear/common/constant.dart';
import 'package:loadclear/view_model/themecontroller.dart';

import 'Components/popup_menu_map.dart';
import 'download_map_screen.dart';
import 'offlinemap_view_screen.dart';

class OfflineMapScreen extends StatefulWidget {
  const OfflineMapScreen({super.key});

  @override
  State<OfflineMapScreen> createState() => _OfflineMapScreenState();
}

class _OfflineMapScreenState extends State<OfflineMapScreen> {
  final _controller = Get.put(ThemeController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Constants.verticalSpace(100.h),
                ListTile(
                  onTap: () {
                    Get.to(DownloadMapScreen());
                  },
                  contentPadding: EdgeInsets.zero,
                  leading: Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: _controller.isDarkModeEnabled.value
                            ? Theme.of(context).hintColor
                            : Theme.of(context).primaryColor.withOpacity(0.1)),
                    child: Icon(
                      Icons.add,
                      color: _controller.isDarkModeEnabled.value
                          ? Colors.white
                          : Theme.of(context).shadowColor,
                    ),
                  ),
                  title: Text(
                    'Select own map',
                    style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600,
                        color: Theme.of(context).secondaryHeaderColor),
                  ),
                ),
                Constants.verticalSpace(20.h),
                Text(
                  'Downloaded maps',
                  style: TextStyle(
                      fontSize: 16.sp,
                      color: Theme.of(context).hintColor,
                      fontWeight: FontWeight.w600),
                ),
                // Constants.verticalSpace(20.h),
                Expanded(
                  child: ListView.builder(
                      itemCount: 5,
                      itemBuilder: (context, index) {
                        return ListTile(
                          onTap: () {
                            Get.to(OfflineMapViewScreen());
                          },
                          contentPadding: EdgeInsets.zero,
                          leading: Container(
                            padding: EdgeInsets.all(15),
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Theme.of(context).shadowColor),
                            child: Icon(
                              Icons.location_on,
                              color: Colors.white,
                            ),
                          ),
                          title: Text(
                            'Map name $index',
                            style: TextStyle(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w600,
                                color: Theme.of(context).secondaryHeaderColor),
                          ),
                          subtitle: Text(
                            'Downloaded . ${index} March 2024',
                            style: TextStyle(
                                fontSize: 14.sp,
                                color: Theme.of(context).hoverColor),
                          ),
                          trailing: CustomPopupMenu(onClick: (){
                            Get.back();
                          },),
                        );
                      }),
                )
              ],
            ),
          )),
    );
  }
}
