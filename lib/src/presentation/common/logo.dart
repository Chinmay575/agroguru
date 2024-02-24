import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Logo extends StatelessWidget {
  const Logo({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 128.h),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                AppLocalizations.of(context)!.agro,
                style: TextStyle(
                  fontSize: 61.h,
                  fontFamily: 'Lato',
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                AppLocalizations.of(context)!.guru,
                style: TextStyle(
                  fontSize: 61.h,
                  fontFamily: 'Lato',
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).primaryColor,
                ),
              ),
            ],
          ),
          Text(
            AppLocalizations.of(context)!.tagline,
            style: TextStyle(
              fontSize: 16.h,
              fontFamily: 'Lato',
              color: HexColor('#BF131513'),
            ),
          ),
        ],
      ),
    );
  }
}
