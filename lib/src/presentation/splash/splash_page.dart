import 'package:agroguru/src/domain/repository/auth_repository.dart';
import 'package:agroguru/src/utils/constants/strings/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../utils/styles/text_styles.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    AuthRepository.checkAuthStatus().then((value) {
      if (AuthRepository.isAuthenticated) {
        Navigator.pushReplacementNamed(context, Routes.home);
      } else {
        Navigator.pushReplacementNamed(context, Routes.login);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        // margin: EdgeInsets.only(top: 128.h),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  AppLocalizations.of(context)!.agro,
                  style: TextStyles.heading1(),
                ),
                Text(
                  AppLocalizations.of(context)!.guru,
                  style: TextStyles.heading1(
                      color: Theme.of(context).primaryColor),
                ),
              ],
            ),
            Text(
              AppLocalizations.of(context)!.tagline,
              style: TextStyles.body(color: HexColor('#BF131513')),
            ),
          ],
        ),
      ),
    );
  }
}
