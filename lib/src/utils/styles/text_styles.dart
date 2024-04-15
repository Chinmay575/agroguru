import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TextStyles {
  BuildContext context;

  TextStyles({required this.context});

  static TextStyles of(BuildContext context) {
    return TextStyles(context: context);
  }

  TextStyle heading1({
    Color? color,
    TextDecoration? decoration,
    Color? decorationColor,
  }) =>
      TextStyle(
        fontFamily: 'Lato',
        fontSize: 61.sp,
        fontWeight: FontWeight.w600,
        color: color ??
            Theme.of(context).textTheme.displayLarge?.color ??
            Colors.black,
        decoration: decoration,
        decorationColor: decorationColor,
      );

  TextStyle heading2({
    Color? color,
    TextDecoration? decoration,
    Color? decorationColor,
  }) =>
      TextStyle(
        fontFamily: 'Lato',
        fontSize: 49.sp,
        fontWeight: FontWeight.w600,
        color: color ??
            Theme.of(context).textTheme.displayLarge?.color ??
            Colors.black,
        decoration: decoration,
        decorationColor: decorationColor,
      );
  TextStyle heading3({
    Color? color,
    TextDecoration? decoration,
    Color? decorationColor,
  }) =>
      TextStyle(
        fontFamily: 'Lato',
        fontSize: 39.sp,
        fontWeight: FontWeight.w400,
        color: color ??
            Theme.of(context).textTheme.displayLarge?.color ??
            Colors.black,
        decoration: decoration,
        decorationColor: decorationColor,
      );
  TextStyle heading4({
    Color? color,
    TextDecoration? decoration,
    Color? decorationColor,
  }) =>
      TextStyle(
        fontFamily: 'Lato',
        fontSize: 31.sp,
        fontWeight: FontWeight.w400,
        color: color ??
            Theme.of(context).textTheme.displayLarge?.color ??
            Colors.black,
        decoration: decoration,
        decorationColor: decorationColor,
      );
  TextStyle heading5({
    Color? color,
    TextDecoration? decoration,
    Color? decorationColor,
  }) =>
      TextStyle(
        fontFamily: 'Lato',
        fontSize: 25.sp,
        fontWeight: FontWeight.w400,
        color: color ??
            Theme.of(context).textTheme.displayLarge?.color ??
            Colors.black,
        decoration: decoration,
        decorationColor: decorationColor,
      );
  TextStyle heading6({
    Color? color,
    TextDecoration? decoration,
    Color? decorationColor,
    FontWeight? weight,
  }) =>
      TextStyle(
        fontFamily: 'Lato',
        fontSize: 20.sp,
        fontWeight: weight ?? FontWeight.w400,
        color: color ??
            Theme.of(context).textTheme.displayLarge?.color ??
            Colors.black,
        decoration: decoration,
        decorationColor: decorationColor,
      );
  TextStyle body({
    Color? color,
    TextDecoration? decoration,
    Color? decorationColor,
    FontWeight? weight,
  }) =>
      TextStyle(
        fontFamily: 'Lato',
        fontSize: 16.sp,
        fontWeight: weight ?? FontWeight.w400,
        color: color ??
            Theme.of(context).textTheme.displayLarge?.color ??
            Colors.black,
        decoration: decoration,
        decorationColor: decorationColor,
      );
  TextStyle small({
    Color? color,
    TextDecoration? decoration,
    Color? decorationColor,
  }) =>
      TextStyle(
        fontFamily: 'Lato',
        fontSize: 13.sp,
        fontWeight: FontWeight.w400,
        color: color ??
            Theme.of(context).textTheme.displayLarge?.color ??
            Colors.black,
        decoration: decoration,
        decorationColor: decorationColor,
      );
}
