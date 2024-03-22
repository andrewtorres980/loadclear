import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:loadclear/utils/app_colors.dart';

class ButtonComponent extends StatelessWidget {
  const ButtonComponent(
      {super.key,
      required this.text,
      required this.onPressed,
      this.buttonColor = AppColors.buttonColor,
      this.fontSize = 17.0,
      this.padding,
      this.borderRadius,
      this.boxShadow,
      this.border,
      this.prefixWidget,
      this.suffixIcon,
      this.suffixSvgPath,
      this.iconColor = AppColors.labelColor,
      this.textColor = AppColors.fillTextColor,
      this.isDisabled = false,
      this.fontWeight,
      this.isLoading = false});

  final String text;
  final VoidCallback onPressed;
  final Color buttonColor;
  final double fontSize;
  final FontWeight? fontWeight;
  final EdgeInsetsGeometry? padding;
  final double? borderRadius;
  final BoxShadow? boxShadow;
  final BoxBorder? border;
  final Widget? prefixWidget;
  final IconData? suffixIcon;
  final String? suffixSvgPath;
  final Color iconColor;
  final Color textColor;
  final bool isDisabled;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      decoration: BoxDecoration(
        border: border,
        boxShadow: boxShadow != null ? [boxShadow!] : null,
        borderRadius: BorderRadius.circular(borderRadius ?? 8.0),
      ),
      child: ElevatedButton(
        onPressed: isDisabled ? null : onPressed,
        style: ButtonStyle(
          elevation: const MaterialStatePropertyAll(0),
          shadowColor: const MaterialStatePropertyAll(Colors.transparent),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(borderRadius ?? 8.0)),
          ),
          backgroundColor: MaterialStatePropertyAll(
            buttonColor,
          ),
        ),
        child: Padding(
          padding: padding ?? const EdgeInsets.symmetric(vertical: 0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              prefixWidget != null
                  ? prefixWidget!
                  // Icon(
                  //     prefixIcon!,
                  //     color: iconColor,
                  //   )
                  : const SizedBox.shrink(),
              prefixWidget != null
                  ? const SizedBox(width: 10)
                  : const SizedBox.shrink(),
              isLoading
                  ? SizedBox(
                      height: 20,
                      width: 20,
                      child: CircularProgressIndicator(
                        strokeWidth: 2,
                        backgroundColor:
                            Theme.of(context).scaffoldBackgroundColor,
                        valueColor: AlwaysStoppedAnimation<Color>(
                            Theme.of(context).primaryColor),
                      ),
                    )
                  : Text(
                      text,
                      style: TextStyle(
                        fontFamily: 'poppin',
                        color: textColor,
                        fontSize: fontSize.sp,
                        fontWeight: fontWeight ?? FontWeight.w600,
                      ),
                      // style: Fonts.poppins(
                      //   fontSize: fontSize,
                      //   fontWeight: FontWeight.w500,
                      //   color: textColor,
                      // ),
                    ),
              suffixIcon != null && suffixSvgPath == null
                  ? Padding(
                      padding: const EdgeInsets.only(left: 5.0, right: 10),
                      child: Icon(
                        suffixIcon!,
                        color: iconColor,
                      ),
                    )
                  : const SizedBox.shrink(),
              suffixSvgPath != null && suffixIcon == null
                  ? SvgPicture.asset(suffixSvgPath!)
                  : const SizedBox.shrink(),
            ],
          ),
        ),
      ),
    );
  }
}
