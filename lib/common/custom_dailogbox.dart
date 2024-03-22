import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:loadclear/common/constant.dart';
import 'package:loadclear/view_model/themecontroller.dart';
import '../utils/app_colors.dart';

class DestinationCustomDialog extends StatelessWidget {
  const DestinationCustomDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Align(
          alignment: Alignment.centerRight,
          child: GestureDetector(onTap: () {}, child: const Icon(Icons.close))),
      content: Padding(
        padding: EdgeInsets.symmetric(vertical: 10.h),
        child: Text(
          'You have reached your destination!',
          style: TextStyle(fontWeight: FontWeight.w400, fontSize: 20.sp),
          textAlign: TextAlign.center,
        ),
      ),
      actions: <Widget>[
        Center(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 5),
            decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                borderRadius: BorderRadius.circular(8)),
            child: Text(
              'Ok',
              style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: AppColors.fillTextColor,
                  fontSize: 18.sp),
            ),
          ),
        )
      ],
    );
  }
}

// To show the dialog:
void reachedDestinationDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return const DestinationCustomDialog();
    },
  );
}

// ignore: must_be_immutable
class CongualationDialog extends StatelessWidget {
  String title;
  String subTitle;
  CongualationDialog({super.key, required this.title, required this.subTitle});
  final ThemeController _controller = Get.put(ThemeController());

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: _controller.isDarkModeEnabled.value
          ? Theme.of(context).highlightColor
          : Theme.of(context).scaffoldBackgroundColor,
      title: Column(
        children: [
          Align(
              alignment: Alignment.centerRight,
              child: GestureDetector(
                  onTap: () {
                    Get.back();
                  },
                  child:  Icon(Icons.close,color: Theme.of(context).secondaryHeaderColor,))),
          Icon(
            Icons.check_circle,
            color: Colors.green,
            size: 50.sp,
          ),
        ],
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Constants.verticalSpace(15.h),
          Text(
            title,
            style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 20.sp,
                color: Theme.of(context).secondaryHeaderColor),
            textAlign: TextAlign.center,
          ),
          Constants.verticalSpace(15.h),
          Text(
            subTitle,
            style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 15.sp,
                color: Theme.of(context).secondaryHeaderColor),
            textAlign: TextAlign.center,
          ),
          Constants.verticalSpace(15.h),
        ],
      ),
    );
  }
}
