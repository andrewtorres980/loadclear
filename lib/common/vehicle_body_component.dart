import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class VechicleBodyWeightComponent extends StatelessWidget {
  final String maintext;
  final String unit;
  const VechicleBodyWeightComponent(
      {super.key, required this.maintext, required this.unit});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.h,
      padding: const EdgeInsets.symmetric(horizontal: 6),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.r),
        border: Border.all(
          color: const Color(0xFFD7D7D7),
          width: 1,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            maintext,
            style: TextStyle(
              color: Colors.black,
              fontSize: 12.sp,
              fontWeight: FontWeight.w400,
            ),
          ),
          SizedBox(
            width: 29.w,
          ),
          Text(
            unit,
            style: TextStyle(
              color: const Color(0xFF666666),
              fontSize: 10.sp,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }
}
