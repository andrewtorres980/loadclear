import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:loadclear/common/app_bar%20_component.dart';
import 'package:loadclear/view/Components/popup_menu_map.dart';
import 'package:loadclear/view/bottom_bar_nav.dart';
import 'package:loadclear/view_model/themecontroller.dart';

class OfflineMapViewScreen extends StatefulWidget {
  const OfflineMapViewScreen({super.key});

  @override
  State<OfflineMapViewScreen> createState() => _OfflineMapViewScreenState();
}

class _OfflineMapViewScreenState extends State<OfflineMapViewScreen> {
  final _controller = Get.put(ThemeController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(60),
          child: AppBarComponent(
            title: 'Map Screen',
            leftp: 0,
            trailingIcon: CustomPopupMenu(
              onClick: () {
                print('objectasad');
                Get.offAll(const BottomNavBar(
                  index: 2,
                ));
              },
            ),
          )),
      body: AnnotatedRegion(
          value: SystemUiOverlayStyle(
            statusBarColor: Theme.of(context).scaffoldBackgroundColor,
            statusBarIconBrightness: Theme.of(context).brightness,
            systemNavigationBarColor: Theme.of(context).scaffoldBackgroundColor,
          ),
          child: Padding(
              padding: const EdgeInsets.only(top: 70.0, bottom: 140.0),
              child: SizedBox(
                width: Get.width,
                child: Image.asset(
                 _controller.isDarkModeEnabled.value? 'assets/images/dark_map.jpg': 'assets/images/map.png',
                  fit: BoxFit.cover,
                ),
              ))),
    );
  }
}
