import 'package:agroguru/src/config/router.dart';
import 'package:agroguru/src/utils/constants/strings/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

Future main() async {
  await AppRouter.init().then(
    (_) {
      runApp(const MyApp());
    },
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [...AppRouter.allBlocProviders()],
      child: ScreenUtilInit(
        designSize: const Size(390, 844),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'AgroGuru',
          // theme: lightTheme,
          initialRoute: Routes.splash,
          onGenerateRoute: AppRouter.onGenerateRoute,
          locale: const Locale('en'),
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
        ),
      ),
    );
  }
}
