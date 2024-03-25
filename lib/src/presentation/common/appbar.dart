import 'package:agroguru/src/presentation/common/back_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

AppBar customAppBar() {
  return AppBar(
    automaticallyImplyLeading: false,
    leading: const CustomBackButton(),
    leadingWidth: 96.w,
  );
}
