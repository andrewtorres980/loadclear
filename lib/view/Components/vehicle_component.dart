import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:loadclear/common/constant.dart';
import 'package:loadclear/view/on%20boarding/edit_vehicle_screen.dart';

// ignore: must_be_immutable
class VehicleComponent extends StatelessWidget {
  String vehicleImage;
  String vehicleName;
  String vehicleType;
  VoidCallback onClick;
  bool isEdit;

  VehicleComponent({
    super.key,
    required this.vehicleImage,
    required this.vehicleName,
    required this.vehicleType,
    required this.onClick,
    required this.isEdit,
  });
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onClick,
      child: Container(
          clipBehavior: Clip.antiAliasWithSaveLayer,
          height: 180.0.h,
          width: Get.width,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(vehicleImage), fit: BoxFit.cover),
              borderRadius: BorderRadius.circular(10.0)),
          child: Stack(
            children: [
              isEdit
                  ? Positioned(
                      right: 10,
                      top: 8,
                      child: GestureDetector(
                        behavior: HitTestBehavior.translucent,
                        onTap: () => Get.to(() => EditVehicleScreen(),
                            arguments: 'from edit button'),
                        child: Container(
                            height: 30.h,
                            width: 30.w,
                            decoration: const BoxDecoration(
                                color: Colors.grey, shape: BoxShape.circle),
                            child: Center(
                              child: Image.asset(
                                'assets/images/edit_icon.png',
                                color: Colors.white,
                                height: 20.h,
                                width: 20.w,
                              ),
                            )),
                      ),
                    )
                  : Container(),
              Container(
                clipBehavior: Clip.antiAliasWithSaveLayer,
                height: 90.0.h,
                width: 200.0.h,
                decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                        bottomRight: Radius.circular(50.0)),
                    gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          const Color(0xff222222),
                          const Color(0xff222222).withOpacity(0.20)
                        ])),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15.0, top: 15.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      vehicleName,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18.0.h,
                          fontFamily: 'poppin',
                          fontWeight: FontWeight.w600),
                    ),
                    Constants.verticalSpace(10.0.h),
                    Text(
                      vehicleType,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 13.0.h,
                          fontFamily: 'poppin',
                          fontWeight: FontWeight.w400),
                    ),
                    Constants.verticalSpace(10.0.h),
                  ],
                ),
              )
            ],
          )),
    );
  }
}
