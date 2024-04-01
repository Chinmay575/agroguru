import 'package:agroguru/src/config/bloc/global_bloc.dart';
import 'package:agroguru/src/domain/repository/auth_repository.dart';
import 'package:agroguru/src/utils/constants/strings/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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

    WidgetsBinding.instance.addPostFrameCallback(
      (_) => BlocProvider.of<GlobalBloc>(context).add(
        GetSavedPreferences(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  AppLocalizations.of(context)!.agro,
                  style: TextStyles.of(context).heading1(),
                ),
                Text(
                  AppLocalizations.of(context)!.guru,
                  style: TextStyles.of(context).heading1(
                    color: Theme.of(context).primaryColor,
                  ),
                ),
              ],
            ),
            Text(
              AppLocalizations.of(context)!.tagline,
              style: TextStyles.of(context).body(color: HexColor('#BF131513')),
            ),
          ],
        ),
      ),
    );
  }
}
