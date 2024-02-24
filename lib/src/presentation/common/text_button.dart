// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextButton extends StatelessWidget {
  void Function() onPressed;
  String text;
  Color color;
  Color? textColor;
  CustomTextButton({
    Key? key,
    required this.onPressed,
    required this.text,
    this.textColor,
    required this.color,
  }) : super(key: key);

  // late double deviceHeight, deviceWidth;

  @override
  Widget build(BuildContext context) {
    // deviceHeight = MediaQuery.of(context).size.height;
    // deviceWidth = MediaQuery.of(context).size.width;
    return MaterialButton(
      elevation: 0,
      minWidth: 320.w,
      height: 64.h,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(32.r),
      ),
      onPressed: onPressed,
      color: color,
      child: Text(
        text,
        style: TextStyle(
          fontSize: 20.h,
          fontFamily: 'Lato',
          fontWeight: FontWeight.w400,
          color: textColor ?? Colors.black,
        ),
      ),
    );
  }
}
