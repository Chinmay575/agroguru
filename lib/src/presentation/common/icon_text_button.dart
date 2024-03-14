// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable
import 'package:agroguru/src/utils/styles/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hexcolor/hexcolor.dart';

class CustomIconTextButton extends StatelessWidget {
  void Function() onPressed;
  String text;
  Color color;
  Widget icon;
  CustomIconTextButton({
    Key? key,
    required this.onPressed,
    required this.icon,
    required this.text,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      minWidth: 320.w,
      height: 64.h,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(32.h),
        side: BorderSide(
          color: HexColor('#80131513'),
          width: 2,
        ),
      ),
      onPressed: onPressed,
      color: color,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: const EdgeInsets.only(right: 20),
            child: icon,
          ),
          Text(
            text,
            style: TextStyles.heading6(color: HexColor('#80131513')),
          ),
        ],
      ),
    );
  }
}
