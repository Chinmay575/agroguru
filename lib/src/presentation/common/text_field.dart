// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hexcolor/hexcolor.dart';

class CustomTextField extends StatelessWidget {
  void Function(String) onChanged;
  String hintText;
  double? height;
  double? width;
  String? Function(String?)? validator;
  late double deviceHeight, deviceWidth;
  EdgeInsets? margin;
  EdgeInsets? padding;
  EdgeInsets? contentPadding;
  double? borderRadius;
  bool? filled;
  Color? fillColor;
  CustomTextField({
    Key? key,
    required this.onChanged,
    required this.hintText,
    this.height,
    this.width,
    this.validator,
    this.padding,
    this.margin,
    this.fillColor,
    this.filled,
    this.contentPadding,
    this.borderRadius,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    deviceHeight = MediaQuery.of(context).size.height;
    deviceWidth = MediaQuery.of(context).size.width;
    return Container(
      height: height ?? 64.h,
      width: width ?? 320.w,
      margin: margin ?? const EdgeInsets.symmetric(),
      padding: padding,
      child: TextFormField(
        onChanged: onChanged,
        style: TextStyle(
          fontSize: 16.h,
          fontFamily: 'Lato',
          fontWeight: FontWeight.w400,
        ),
        decoration: InputDecoration(
          hintText: hintText,
          border: normalBorder(),
          contentPadding: contentPadding ??
              EdgeInsets.only(
                top: 22.h,
                bottom: 23.h,
                left: 29.w,
                right: 36.w,
              ),
          filled: filled ?? true,
          fillColor: fillColor ?? HexColor('#1315131A'),
          enabledBorder: normalBorder(),
          focusedBorder: normalBorder(),
          errorBorder: errorBorder(),
        ),
        validator: validator,
      ),
    );
  }

  InputBorder normalBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(borderRadius ?? 32.r),
      borderSide: BorderSide.none,
    );
  }

  InputBorder errorBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(borderRadius ?? 32.r),
      borderSide: const BorderSide(
        color: Colors.red,
      ),
    );
  }
}
