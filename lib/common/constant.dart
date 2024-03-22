import 'package:flutter/material.dart';

class Constants {
  static const verticalPadding = 15.0;
  static const horizontalPadding = 15.0;

  static verticalSpace(double vertical) {
    return SizedBox(
      height: vertical,
    );
  }

  static horizontalSpace(double horizontal) {
    return SizedBox(
      width: horizontal,
    );
  }
}
