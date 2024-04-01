import 'package:agroguru/src/utils/styles/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CustomBackButton extends StatelessWidget {
  const CustomBackButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      // width: 58.w,
      // height: 19.h,
      margin: EdgeInsets.only(left: 31.w),
      child: MaterialButton(
        // color: Colors.amber,
        padding: EdgeInsets.zero,
        minWidth: 58.w,
        height: 19.h,
        elevation: 0,
        // color: Colors.white,
        onPressed: () {
          Navigator.pop(context);
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.only(right: 8.w),
              child: Icon(
                Icons.arrow_back,
                size: 16.w,
              ),
            ),
            Container(
              padding: EdgeInsets.only(
                top: (AppLocalizations.of(context)?.localeName == 'hi')
                    ? 2.5.h
                    : 0.h,
              ),
              child: Text(
                AppLocalizations.of(context)!.back,
                style: TextStyles.of(context).body(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
