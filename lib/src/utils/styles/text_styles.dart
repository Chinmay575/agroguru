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
        fontSize: 61.h,
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
        fontSize: 49.h,
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
        fontSize: 39.h,
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
        fontSize: 31.h,
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
        fontSize: 25.h,
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
        fontSize: 20.h,
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
        fontSize: 16.h,
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
        fontSize: 13.h,
        fontWeight: FontWeight.w400,
        color: color ?? Colors.black,
        decoration: decoration,
        decorationColor: decorationColor,
      );
}
