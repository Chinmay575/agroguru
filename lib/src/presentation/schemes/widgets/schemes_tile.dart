// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable
import 'package:agroguru/src/data/models/scheme.dart';
import 'package:agroguru/src/utils/constants/strings/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../utils/styles/text_styles.dart';

class SchemesTile extends StatelessWidget {
  GovtSchemes scheme;
  SchemesTile({
    Key? key,
    required this.scheme,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        height: 128.h,
        width: 1080.w,
        margin: EdgeInsets.symmetric(vertical: 16.h),

        // color: Colors.amber,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              scheme.name,
              overflow: TextOverflow.ellipsis,
              style: TextStyles.of(context).heading6(),
            ),
            Text(
              'Launched on ${scheme.publishDate}',
              style: TextStyles.of(context).body(),
            ),
            Text(
              'For more details',
              style: TextStyles.of(context).small(),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                (scheme.link.isNotEmpty)
                    ? Container(
                        margin: EdgeInsets.symmetric(horizontal: 8.w),
                        child: MaterialButton(
                          onPressed: () async {
                            Uri url = Uri.parse(scheme.link);
                            await launchUrl(url);
                          },
                          height: 48.h,
                          minWidth: 144.w,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(32.r),
                          ),
                          splashColor: HexColor('#1315131A'),
                          color: HexColor('#1315131A'),
                          elevation: 0,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Image.asset(
                                Assets.link,
                                height: 32.h,
                                width: 32.h,
                              ),
                              SizedBox(
                                width: 12.w,
                              ),
                              Text(
                                'Link',
                                style: TextStyles.of(context).body(),
                              ),
                            ],
                          ),
                        ),
                      )
                    : Container(),
                (scheme.relatedDocument.isNotEmpty)
                    ? Container(
                        margin: EdgeInsets.symmetric(horizontal: 8.w),
                        child: MaterialButton(
                          onPressed: () async {
                            Uri url = Uri.parse(scheme.relatedDocument);
                            await launchUrl(url);
                          },
                          height: 48.h,
                          minWidth: 144.w,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(32.r),
                          ),
                          splashColor: HexColor('#1315131A'),
                          color: HexColor('#1315131A'),
                          elevation: 0,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Image.asset(
                                Assets.pdf,
                                height: 32.h,
                                width: 32.h,
                              ),
                              SizedBox(
                                width: 12.w,
                              ),
                              Text(
                                'PDF',
                                style: TextStyles.of(context).body(),
                              ),
                            ],
                          ),
                        ),
                      )
                    : Container(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
