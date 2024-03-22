import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// ignore: must_be_immutable
class OnBoardingTextComponent extends StatelessWidget {
  String text;
  FontWeight? weight;
  double? fontsize;
  bool? isTextAlign;
  OnBoardingTextComponent(
      {super.key,
      required this.text,
      this.weight,
      this.fontsize,
      this.isTextAlign = false});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          fontSize: fontsize ?? 22.0.sp,
          fontWeight: weight ?? FontWeight.w600,
          fontFamily: 'poppin',
          color: Theme.of(context).secondaryHeaderColor),
      textAlign: isTextAlign == false ? TextAlign.start : TextAlign.center,
    );
  }
}
