// ignore_for_file: must_be_immutable

import 'package:agroguru/src/utils/styles/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChatTile extends StatelessWidget {
  bool isUser;
  String message;
  ChatTile({
    super.key,
    required this.message,
    required this.isUser,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
      margin: EdgeInsets.only(bottom: 16.h),
      // height: 48.h,
      decoration: BoxDecoration(
          // color: (isUser) ? Colors.amber : Colors.lightBlue,
          borderRadius: BorderRadius.circular(8.r)),
      child: Text(
        message,
        style: TextStyles.of(context).body(
          color: (isUser) ? Colors.amber : Colors.lightBlue,
        ),
        textAlign: (isUser) ? TextAlign.end : TextAlign.start,
      ),
    );
  }
}
