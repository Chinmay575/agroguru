// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable
import 'package:agroguru/src/utils/constants/strings/assets.dart';
import 'package:agroguru/src/utils/styles/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../data/models/product.dart';

class ProductGrid extends StatelessWidget {
  Product p;
  ProductGrid({
    Key? key,
    required this.p,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(32.r),
          child: Image.asset(
            Assets.imagePlaceholder,
            height: 152.h,
            width: 152.h,
          ),
        ),
        SizedBox(
          height: 8.h,
        ),
        Text(
          p.name,
          style: TextStyles.of(context).small(),
          textAlign: TextAlign.center,
        )
      ],
    );
  }
}
