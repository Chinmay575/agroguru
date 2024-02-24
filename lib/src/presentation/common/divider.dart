import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hexcolor/hexcolor.dart';

class CustomDivider extends StatelessWidget {
  CustomDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 190.w,
      margin: EdgeInsets.symmetric(vertical: 20.h),
      child: Divider(
        color: HexColor('#30131513'),
      ),
    );
  }
}
