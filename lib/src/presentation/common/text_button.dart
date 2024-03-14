// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable
import 'package:agroguru/src/utils/styles/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextButton extends StatelessWidget {
  void Function() onPressed;
  String text;
  Color color;
  Color? textColor;
  double? width;
  CustomTextButton({
    Key? key,
    required this.onPressed,
    required this.text,
    this.textColor,
    this.width,
    required this.color,
  }) : super(key: key);

  // late double deviceHeight, deviceWidth;

  @override
  Widget build(BuildContext context) {
    // deviceHeight = MediaQuery.of(context).size.height;
    // deviceWidth = MediaQuery.of(context).size.width;
    return MaterialButton(
      elevation: 0,
      minWidth: width ?? 320.w,
      height: 64.h,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(32.r),
      ),
      onPressed: onPressed,
      color: color,
      child: Text(
        text,
        style: TextStyles.heading6(color: textColor ?? Colors.black),
      ),
    );
  }
}
