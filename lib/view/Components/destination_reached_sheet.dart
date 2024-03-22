import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../common/constant.dart';
import '../../view_model/themecontroller.dart';

class DestinationReachedSheet extends StatelessWidget {
  DestinationReachedSheet({super.key});

  final controller = Get.put(ThemeController());

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
          color: Theme.of(context).scaffoldBackgroundColor,
          border: Border.all(color: Theme.of(context).hoverColor),
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              GestureDetector(
                onTap: () {
                  Get.back();
                },
                child: Container(
                  padding: const EdgeInsets.all(5.0),
                  decoration: BoxDecoration(
                      border: Border.all(
                        color: Theme.of(context).secondaryHeaderColor,
                      ),
                      shape: BoxShape.circle),
                  child: Icon(
                    Icons.close,
                    size: 20.sp,
                    color: Theme.of(context).secondaryHeaderColor,
                  ),
                ),
              ),
            ],
          ),
          Constants.verticalSpace(18.sp),
          Center(
            child: Icon(Icons.location_on,
                size: 50.h, color: Theme.of(context).indicatorColor),
          ),
          Constants.verticalSpace(15.sp),
          Center(
            child: Text(
              "You’ve reached the destination",
              style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 20.sp,
                  color: Theme.of(context).secondaryHeaderColor),
            ),
          ),
          Constants.verticalSpace(18.sp),
        ],
      ),
    );
  }
}
