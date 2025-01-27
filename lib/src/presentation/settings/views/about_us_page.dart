import 'package:agroguru/src/presentation/common/appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../widgets/about_tile.dart';

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
                mainAxisExtent: 224.h,
              ),
              shrinkWrap: true,
              children: [
                AboutTile(
                  name: 'Chinmay Singh Modak',
                  github: 'https://github.com/Chinmay575',
                  linkedin: 'https://www.linkedin.com/in/chinmay-singh-modak/',
                  gmail: 'chinmaysingh575@gmail.com',
                ),
                AboutTile(
                  linkedin: 'https://www.linkedin.com/in/abhinavsingh9240/',
                  github: 'https://github.com/abhinavsingh9240/',
                  gmail: 'abhinavsingh9240@gmail.com',
                  name: 'Abhinav Singh',
                ),
                AboutTile(
                  github: 'https://github.com/02Omkar',
                  linkedin: 'https://www.linkedin.com/in/omkar-bajantri/',
                  gmail: 'omkarbajantri10@gmail.com',
                  name: 'Omkar Bajantri',
                ),
                AboutTile(
                  github: 'https://github.com/Aman9058490490',
                  gmail: 'sharmaaman9058@gmail.com',
                  linkedin:
                      'https://www.linkedin.com/in/aman-sharma-527561221/',
                  name: 'Aman Sharma',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
