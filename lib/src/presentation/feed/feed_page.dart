import 'package:agroguru/src/presentation/common/text_button.dart';
import 'package:agroguru/src/utils/constants/strings/routes.dart';
import 'package:agroguru/src/utils/styles/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../common/text_field.dart';

class FeedPage extends StatefulWidget {
  const FeedPage({super.key});

  @override
  State<FeedPage> createState() => _FeedPageState();
}

class _FeedPageState extends State<FeedPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(390.w, 96.h),
        child: AppBar(
          automaticallyImplyLeading: false,
          flexibleSpace: SafeArea(
            child: Container(
              height: 64.h,
              width: 336.w,
              margin: EdgeInsets.symmetric(vertical: 16.h, horizontal: 27.w),
              child: CustomTextField(
                hintText: 'Search',
                onChanged: (val) {},
              ),
            ),
          ),
          toolbarHeight: 64.h,
          titleSpacing: 0.h,
        ),
      ),
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.symmetric(vertical: 16.h, horizontal: 27.w),
            child: Column(
              children: [
                Text(
                  'Want to share something....',
                  style: TextStyles.heading6(),
                ),
                SizedBox(
                  height: 8.h,
                ),
                CustomTextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, Routes.createPost);
                  },
                  text: 'Create Post',
                  color: Theme.of(context).primaryColor,
                  textColor: Colors.white,
                  width: 336.w,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
