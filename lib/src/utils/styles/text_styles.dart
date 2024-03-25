import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TextStyles {
  static TextStyle heading1({
    Color? color,
    TextDecoration? decoration,
    Color? decorationColor,
  }) =>
      TextStyle(
        fontFamily: 'Lato',
        fontSize: 61.sp,
        fontWeight: FontWeight.w600,
        color: color ?? Colors.black,
        decoration: decoration,
        decorationColor: decorationColor,
      );

  static TextStyle heading2({
    Color? color,
    TextDecoration? decoration,
    Color? decorationColor,
  }) =>
      TextStyle(
        fontFamily: 'Lato',
        fontSize: 49.sp,
        fontWeight: FontWeight.w600,
        color: color ?? Colors.black,
        decoration: decoration,
        decorationColor: decorationColor,
      );
  static TextStyle heading3({
    Color? color,
    TextDecoration? decoration,
    Color? decorationColor,
  }) =>
      TextStyle(
        fontFamily: 'Lato',
        fontSize: 39.sp,
        fontWeight: FontWeight.w400,
        color: color ?? Colors.black,
        decoration: decoration,
        decorationColor: decorationColor,
      );
  static TextStyle heading4({
    Color? color,
    TextDecoration? decoration,
    Color? decorationColor,
  }) =>
      TextStyle(
        fontFamily: 'Lato',
        fontSize: 31.sp,
        fontWeight: FontWeight.w400,
        color: color ?? Colors.black,
        decoration: decoration,
        decorationColor: decorationColor,
      );
  static TextStyle heading5({
    Color? color,
    TextDecoration? decoration,
    Color? decorationColor,
  }) =>
      TextStyle(
        fontFamily: 'Lato',
        fontSize: 25.sp,
        fontWeight: FontWeight.w400,
        color: color ?? Colors.black,
        decoration: decoration,
        decorationColor: decorationColor,
      );
  static TextStyle heading6({
    Color? color,
    TextDecoration? decoration,
    Color? decorationColor,
  }) =>
      TextStyle(
        fontFamily: 'Lato',
        fontSize: 20.sp,
        fontWeight: FontWeight.w400,
        color: color ?? Colors.black,
        decoration: decoration,
        decorationColor: decorationColor,
      );
  static TextStyle body({
    Color? color,
    TextDecoration? decoration,
    Color? decorationColor,
  }) =>
      TextStyle(
        fontFamily: 'Lato',
        fontSize: 16.sp,
        fontWeight: FontWeight.w400,
        color: color ?? Colors.black,
        decoration: decoration,
        decorationColor: decorationColor,
      );
  static TextStyle small({
    Color? color,
    TextDecoration? decoration,
    Color? decorationColor,
  }) =>
      TextStyle(
        fontFamily: 'Lato',
        fontSize: 13.sp,
        fontWeight: FontWeight.w400,
        color: color ?? Colors.black,
        decoration: decoration,
        decorationColor: decorationColor,
      );
}
