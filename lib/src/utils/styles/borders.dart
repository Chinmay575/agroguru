import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

InputBorder normalBorder({double? borderRadius}) {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(borderRadius ?? 32.r),
    borderSide: BorderSide.none,
  );
}

InputBorder errorBorder({double? borderRadius}) {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(borderRadius ?? 32.r),
    borderSide: const BorderSide(
      color: Colors.red,
    ),
  );
}
