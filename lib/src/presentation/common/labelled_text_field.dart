// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable
import 'package:agroguru/src/utils/styles/text_styles.dart';
import 'package:flutter/material.dart';

import 'package:agroguru/src/presentation/common/text_field.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LabelledTextField extends StatelessWidget {
  String hintText;
  String label;
  void Function(String) onChanged;
  LabelledTextField({
    Key? key,
    required this.hintText,
    required this.label,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.only(
            top: 8.h,
            bottom: 8.h,
            left: 29.w,
          ),
          child: Text(
            label,
            style: TextStyles.body()
          ),
        ),
        CustomTextField(
          onChanged: onChanged,
          hintText: hintText,
        ),
        SizedBox(height: 8.h,)
      ],
    );
  }
}
