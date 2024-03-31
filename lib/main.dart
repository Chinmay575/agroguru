import 'package:agroguru/src/config/router.dart';
import 'package:agroguru/src/utils/constants/strings/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'src/config/bloc/global_bloc.dart';

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
        child: BlocConsumer<GlobalBloc, GlobalState>(
          listener: (context, state) {},
          builder: (context, state) {
            print(state.mode);
            print(state.appLanguage.toString());
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'AgroGuru',
              theme: ThemeData(),
              darkTheme: ThemeData.dark(),
              themeMode: state.mode,
              initialRoute: Routes.splash,
              onGenerateRoute: AppRouter.onGenerateRoute,
              locale: Locale(
                state.appLanguage.toString(),
              ),
              localizationsDelegates: AppLocalizations.localizationsDelegates,
              supportedLocales: AppLocalizations.supportedLocales,
            );
          },
        ),
      ),
    );
  }
}
