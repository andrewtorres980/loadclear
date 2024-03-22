import 'package:flutter/material.dart';

class AppColors {
  static const fillTextColor = Colors.white;
  static const labelColor = Color(0xffD7D7D7);
  static const buttonColor = Color(0xff5685B9);
  static const lightTextColor = Color(0xff9A9C9D);
  static ThemeData lightTheme = ThemeData(
      primaryColor: const Color(0xff5685B9), //use for all things
      scaffoldBackgroundColor: Colors.white, // for background screen
      brightness: Brightness.dark,
      disabledColor: const Color(0xffD7D7D7),
      hintColor: const Color(0xff666666),
      hoverColor: const Color(0xffB3B3B3),
      indicatorColor: const Color(0xffB72D2A), // use for marker
      secondaryHeaderColor: Colors.black, //use for text color

      shadowColor: const Color(0xff0085FF), //Use For Offline Tabs
      // Color? dialogBackgroundColor,
      // Color? cardColor,
      // Color? dividerColor,
      // Color? primaryColorDark,
      // Color? shadowColor,
      // Color? splashColor,
      // Color? unselectedWidgetColor,
      cardColor: const Color(0XFF7E7E7E),
      unselectedWidgetColor: Colors.white,
      highlightColor: Colors.white);

  static ThemeData darkTheme = ThemeData(
      primaryColor: const Color(0xff5685B9), //use for all things
      scaffoldBackgroundColor: Colors.black, // for background screen
      //     const Color(0xff0085FF), //use for download button and for polyline, etc
      disabledColor: const Color(0xffD7D7D7),
      hintColor: const Color(0xff666666),
      hoverColor: const Color(0xffB3B3B3),
      indicatorColor: const Color(0xffB72D2A), // use for marker
      secondaryHeaderColor: Colors.white, //use for text color
      highlightColor: const Color(0xff424242), // use for textfield
      splashColor: const Color(0xffBDBDBD),
      // unselectedWidgetColor: const Color(0xff),
      shadowColor: const Color(0xff0085FF));
  // Color? dialogBackgroundColor,
  // Color? cardColor,
  // Color? dividerColor,
  // Color? primaryColorDark,
  // Color? shadowColor,
  // Color? splashColor,
  // Color? unselectedWidgetColor,
}
