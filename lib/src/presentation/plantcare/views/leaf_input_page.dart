import 'package:agroguru/src/utils/constants/strings/strings.dart';
import 'package:agroguru/src/utils/styles/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../common/back_button.dart';
import '../../common/text_button.dart';

class LeafInputPage extends StatefulWidget {
  const LeafInputPage({super.key});

  @override
  State<LeafInputPage> createState() => _LeafInputPageState();
}

class _LeafInputPageState extends State<LeafInputPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: const CustomBackButton(),
        leadingWidth: 96.w,
      ),
      body: Container(
        width: 1080.w,
        height: 1920.h,
        margin: EdgeInsets.symmetric(horizontal: 27.w),
        // color: Colors.amber,
        child: Column(
          children: [
            SizedBox(
              height: 16.h,
            ),
            Container(
              height: 320.h,
              width: 320.h,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(32.r),
                child: Image.network(
                  Strings.imagePlaceholder,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 16.h),
              height: 64.h,
              // color: Colors.red,
              child: Center(
                child: CustomTextButton(
                  textColor: Colors.white,
                  color: Colors.green,
                  onPressed: () {
                    showModalBottomSheet(
                      context: context,
                      builder: (context) {
                        return Container(
                          height: 196.h,
                          width: 1080.w,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              GestureDetector(
                                onTap: () {},
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      padding: EdgeInsets.all(8.h),
                                      height: 96.h,
                                      width: 96.h,
                                      child: ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(16.r),
                                        child: Image.network(Strings.camera),
                                      ),
                                    ),
                                    Text(
                                      'Camera',
                                      style: TextStyles.heading6(),
                                    )
                                  ],
                                ),
                              ),
                              GestureDetector(
                                onTap: () {},
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      padding: EdgeInsets.all(8.h),
                                      height: 96.h,
                                      width: 96.h,
                                      child: ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(16.r),
                                        child: Image.network(Strings.gallery),
                                      ),
                                    ),
                                    Text(
                                      'Gallery',
                                      style: TextStyles.heading6(),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    );
                  },
                  text: 'Select Image',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
