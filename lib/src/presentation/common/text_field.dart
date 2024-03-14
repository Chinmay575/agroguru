// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable
import 'package:agroguru/src/utils/styles/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hexcolor/hexcolor.dart';

class CustomTextField extends StatelessWidget {
  void Function(String) onChanged;
  String hintText;
  double? height;
  double? width;
  String? Function(String?)? validator;
  // late double deviceHeight, deviceWidth;
  EdgeInsets? margin;
  EdgeInsets? padding;
  EdgeInsets? contentPadding;
  double? borderRadius;
  bool? filled;
  Color? fillColor;
  TextInputType? keyboardType;
  int? maxLength;
  int? maxLines;
  TextAlign? textAlign;
  FocusNode? focusNode;
  CustomTextField({
    Key? key,
    required this.onChanged,
    required this.hintText,
    this.height,
    this.width,
    this.validator,
    this.padding,
    this.margin,
    this.fillColor,
    this.filled,
    this.contentPadding,
    this.borderRadius,
    this.keyboardType, 
    this.maxLength, 
    this.maxLines, 
    this.textAlign,
    this.focusNode,  
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height ?? 64.h,
      width: width ?? 320.w,
      margin: margin ?? const EdgeInsets.symmetric(),
      padding: padding,
      child: TextFormField(
        onChanged: onChanged,
        textAlign: textAlign ?? TextAlign.start,
        style: TextStyles.body(),
        maxLength: maxLength,
        maxLines: maxLines,
        focusNode: focusNode,
        keyboardType: keyboardType ?? TextInputType.text,
        
        decoration: InputDecoration(
          counter: null,
          counterText: '',
          hintText: hintText,
          border: normalBorder(),
          contentPadding: contentPadding ??
              EdgeInsets.only(
                top: 22.h,
                bottom: 23.h,
                left: 29.w,
                right: 36.w,
              ),
          filled: filled ?? true,
          fillColor: fillColor ?? HexColor('#1315131A'),
          enabledBorder: normalBorder(),
          focusedBorder: normalBorder(),
          errorBorder: errorBorder(),
        ),
        validator: validator,
      ),
    );
  }

  InputBorder normalBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(borderRadius ?? 32.r),
      borderSide: BorderSide.none,
    );
  }

  InputBorder errorBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(borderRadius ?? 32.r),
      borderSide: const BorderSide(
        color: Colors.red,
      ),
    );
  }
}
