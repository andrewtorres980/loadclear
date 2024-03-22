import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:loadclear/view/home_screen.dart';
import 'package:loadclear/view/offline_%20map.dart';
import 'package:loadclear/view/saved_screen.dart';
import 'package:loadclear/view_model/themecontroller.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key, this.index});

  final int? index;

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  final controller = Get.put(ThemeController());
  int _selectedIndex = 1;
  @override
  void initState() {
    if (widget.index != null) {
      setState(() {
        _selectedIndex = widget.index!;
      });
    }
    super.initState();
  }

  final List<Widget> _pages = [
    SavedLocationScreen(),
    const HomeScreen(),
    const OfflineMapScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: _pages[_selectedIndex],
        bottomNavigationBar: Theme(
          data: Theme.of(context).copyWith(
            splashColor: Colors.transparent,
            hoverColor: Colors.transparent,
          ),
          child: Obx(
            () => BottomNavigationBar(
              currentIndex: _selectedIndex,
              onTap: _onItemTapped,
              backgroundColor: Theme.of(context).highlightColor,
              unselectedItemColor: controller.isDarkModeEnabled.value
                  ? Colors.white54
                  : Color.fromARGB(255, 154, 154, 154),
              unselectedLabelStyle: TextStyle(
                  color: Colors.white54,
                  fontWeight: FontWeight.w600,
                  fontSize: 14.sp),
              selectedItemColor: controller.isDarkModeEnabled.value
                  ? Colors.white
                  : Theme.of(context).primaryColor,
              selectedLabelStyle: TextStyle(
                  color: Theme.of(context).primaryColor,
                  fontWeight: FontWeight.w600,
                  fontSize: 14.sp),
              items: [
                BottomNavigationBarItem(
                  icon: Image.asset(
                    _selectedIndex == 0
                        ? 'assets/images/map_inable.png'
                        : 'assets/images/map_disable.png',
                    width: 24.sp,
                    height: 24.sp,
                    color: controller.isDarkModeEnabled.value
                        ? _selectedIndex == 0
                            ? Colors.white
                            : null
                        : null,
                  ),
                  label: 'Saved',
                ),
                BottomNavigationBarItem(
                  icon: Image.asset(
                    _selectedIndex == 1
                        ? 'assets/images/home_inable.png'
                        : 'assets/images/home_disable.png',
                    width: 24.sp,
                    height: 24.sp,
                    color: controller.isDarkModeEnabled.value
                        ? _selectedIndex == 1
                            ? Colors.white
                            : null
                        : null,
                  ),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: Image.asset(
                    _selectedIndex == 2
                        ? 'assets/images/offline_inable.png'
                        : 'assets/images/offline_disable.png',
                    width: 24..sp,
                    height: 24.sp,
                    color: controller.isDarkModeEnabled.value
                        ? _selectedIndex == 2
                            ? Colors.white
                            : null
                        : null,
                  ),
                  label: 'Offline Maps',
                ),
              ],
            ),
          ),
        ));
  }
}
