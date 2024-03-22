import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SocialSigninComponent extends StatelessWidget {
  final String image;
  final bool color;
  const SocialSigninComponent(
      {super.key, required this.image, this.color = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 18),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4.r),
          border: Border.all(color: Theme.of(context).disabledColor)),
      child: Image.asset(
        image,
        height: 24.h,
        color: color ? Colors.white : null,
        width: 24.w,
      ),
    );
  }
}
