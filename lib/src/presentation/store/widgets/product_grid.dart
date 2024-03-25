import 'package:agroguru/src/utils/constants/strings/strings.dart';
import 'package:agroguru/src/utils/styles/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductGrid extends StatelessWidget {
  const ProductGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(32.r),
          child: Image.network(
            Strings.imagePlaceholder, 
            height: 152.h,
            width: 152.h,
          ),
        ),
        SizedBox(height: 8.h,), 
        Text(
          'Product Name or Product Heading',
          style: TextStyles.small(),
          textAlign: TextAlign.center,
        )
      ],
    );
  }
}
