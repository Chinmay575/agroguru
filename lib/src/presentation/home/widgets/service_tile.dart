// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../../utils/styles/text_styles.dart';

class ServicesTile extends StatelessWidget {
  String image;
  String title;
  void Function() onTap;
  ServicesTile({
    Key? key,
    required this.onTap,
    required this.image,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: 16.h),
              child: Divider(
                height: 1.h,
                color: HexColor('#1315130D'),
              ),
            ),
            Row(
              children: [
                Container(
                  height: 32.h,
                  width: 32.h,
                  margin: EdgeInsets.only(left: 8.w, right: 16.w),
                  child: Image.asset(
                    image,
                    fit: BoxFit.contain,
                  ),
                ),
                Text(
                  title,
                  style: TextStyles.of(context).heading6(),
                  overflow: TextOverflow.fade,
                  textAlign: TextAlign.center,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
