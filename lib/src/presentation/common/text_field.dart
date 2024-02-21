// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  void Function(String) onChanged;
  String hintText;
  double? height;
  double? width;
  String? Function(String?)? validator;
  late double deviceHeight, deviceWidth;
  EdgeInsets? margin;
  EdgeInsets? padding;
  EdgeInsets? contentPadding;
  double? borderRadius;
  bool? filled;
  Color? fillColor;
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
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    deviceHeight = MediaQuery.of(context).size.height;
    deviceWidth = MediaQuery.of(context).size.width;
    return Container(
      height: height ?? deviceHeight * 0.065,
      width: width ?? deviceWidth,
      margin: margin ??
          EdgeInsets.symmetric(
            horizontal: deviceWidth * 0.05,
            vertical: deviceHeight * 0.005,
          ),
      padding: padding,
      child: TextFormField(
        onChanged: onChanged,
        decoration: InputDecoration(
          hintText: hintText,
          border: normalBorder(),
          contentPadding: contentPadding ??
              EdgeInsets.symmetric(
                vertical: 2,
                horizontal: deviceWidth * 0.05,
              ),
          filled: filled ?? true,
          fillColor: fillColor ?? Colors.white,
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
      borderRadius: BorderRadius.circular(borderRadius ?? 30),
    );
  }

  InputBorder errorBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(borderRadius ?? 30),
      borderSide: BorderSide(
        color: Colors.red,
      ),
    );
  }
}
