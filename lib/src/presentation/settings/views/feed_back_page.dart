import 'package:agroguru/src/presentation/common/appbar.dart';
import 'package:agroguru/src/presentation/common/text_button.dart';
import 'package:agroguru/src/utils/styles/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../../utils/styles/borders.dart';

class FeedBackPage extends StatefulWidget {
  const FeedBackPage({super.key});

  @override
  State<FeedBackPage> createState() => _FeedBackPageState();
}

class _FeedBackPageState extends State<FeedBackPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(),
      body: Container(
        height: 844.h,
        margin: EdgeInsets.symmetric(horizontal: 27.w, vertical: 16.h),
        child: Column(
          children: [
            Container(
              height: 320.h,
              child: TextField(
                expands: true,
                minLines: null,
                maxLines: null,
                textAlignVertical: TextAlignVertical.top,
                decoration: InputDecoration(
                  counter: null,
                  counterText: '',
                  hintText: "Feedback",
                  hintStyle: TextStyles.of(context).body(color: Colors.grey),
                  border: normalBorder(),
                  contentPadding: EdgeInsets.only(
                    top: 20.h,
                    bottom: 20.h,
                    left: 29.w,
                    right: 36.w,
                  ),
                  filled: true,
                  fillColor: HexColor('#1315131A'),
                  enabledBorder: normalBorder(),
                  focusedBorder: normalBorder(),
                  errorBorder: errorBorder(),
                ),
              ),
            ),
            SizedBox(
              height: 16.h,
            ),
            CustomTextButton(
              width: 336.w,
              onPressed: () {},
              text: 'Submit',
              textColor: Colors.white,
              color: Colors.green,
            ),
          ],
        ),
      ),
    );
  }
}
