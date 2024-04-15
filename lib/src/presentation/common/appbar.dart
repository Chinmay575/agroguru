import 'package:agroguru/src/presentation/common/back_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

AppBar customAppBar({void Function()? onPressed}) {
  return AppBar(
    automaticallyImplyLeading: false,
    leading: CustomBackButton(
      onPressed: onPressed,
    ),
    leadingWidth: 96.w,
  );
}
