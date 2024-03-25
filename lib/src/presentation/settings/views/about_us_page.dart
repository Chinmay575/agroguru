import 'package:agroguru/src/presentation/common/appbar.dart';
import 'package:agroguru/src/utils/constants/strings/strings.dart';
import 'package:agroguru/src/utils/styles/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AboutUsPage extends StatefulWidget {
  const AboutUsPage({super.key});

  @override
  State<AboutUsPage> createState() => _AboutUsPageState();
}

class _AboutUsPageState extends State<AboutUsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 27.w),
        child: Column(
          children: [
            GridView(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 8.w,
                crossAxisSpacing: 8.w,
              ),
              shrinkWrap: true,
              children: [
                Container(
                  // color: Colors.amber,
                  child: Column(
                    children: [
                      Image.network(
                        Strings.avatar,
                        height: 128.h,
                        width: 128.h,
                      ),
                      Text(
                        'Chinmay Singh Modak',
                        style: TextStyles.body(),
                      )
                    ],
                  ),
                ),
                Container(
                  // color: Colors.amber,
                  child: Column(
                    children: [
                      Image.network(
                        Strings.avatar,
                        height: 128.h,
                        width: 128.h,
                      ),
                      Text(
                        'Abhinav Singh',
                        style: TextStyles.body(),
                      )
                    ],
                  ),
                ),
                Container(
                  // color: Colors.amber,
                  child: Column(
                    children: [
                      Image.network(
                        Strings.avatar,
                        height: 128.h,
                        width: 128.h,
                      ),
                      Text(
                        'Omkar Bajantri',
                        style: TextStyles.body(),
                      )
                    ],
                  ),
                ),
                Container(
                  // color: Colors.amber,
                  child: Column(
                    children: [
                      Image.network(
                        Strings.avatar,
                        height: 128.h,
                        width: 128.h,
                      ),
                      Text(
                        'Aman Sharma',
                        style: TextStyles.body(),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
