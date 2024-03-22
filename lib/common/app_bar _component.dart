import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class AppBarComponent extends StatelessWidget {
  final String title;
  final bool isBackButton;
  final Widget? trailingIcon;
  final double leftp;
  AppBarComponent({
    super.key,
    required this.title,
    this.trailingIcon,
    this.leftp = 10.0,
    this.isBackButton = true,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: leftp),
      child: AppBar(
        surfaceTintColor: Theme.of(context).scaffoldBackgroundColor,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        actions: [trailingIcon ?? const SizedBox()],
        leading: isBackButton
            ? GestureDetector(
                onTap: () {
                  Get.back();
                },
                child: Icon(
                  Platform.isIOS ? CupertinoIcons.back : Icons.arrow_back,
                  size: 24.sp,
                  color: Theme.of(context).secondaryHeaderColor,
                ),
              )
            : GestureDetector(
                onTap: () {
                  Scaffold.of(context).openDrawer();
                },
                child: Image.asset(
                  'assets/images/menu.png',
                  color: Theme.of(context).secondaryHeaderColor,
                ),
              ),
        title: Text(
          title,
          style: TextStyle(
              color: Theme.of(context).secondaryHeaderColor,
              fontSize: 21.0.h,
              fontFamily: 'poppin',
              fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
      ),
    );
  }
}
