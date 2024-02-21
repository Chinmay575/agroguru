import 'package:agroguru/src/data/models/route.dart';
import 'package:agroguru/src/presentation/error/error_page.dart';
import 'package:agroguru/src/presentation/home/home_page.dart';
import 'package:agroguru/src/presentation/login/bloc/login_bloc.dart';
import 'package:agroguru/src/presentation/login/login_page.dart';
import 'package:agroguru/src/presentation/register/register_page.dart';
import 'package:agroguru/src/utils/constants/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppRouter {
  static List<AppRoute> routes() => [
        AppRoute(
          name: Routes.home,
          view: const HomePage(),
        ),
        AppRoute(
          name: Routes.login,
          view: const LoginPage(),
        ),
        AppRoute(
          name: Routes.register,
          view: const RegisterPage(),
        ),
        AppRoute(
          name: Routes.error,
          view: const ErrorPage(),
        ),
      ];

  static Route onGenerateRoute(RouteSettings settings) {
    if (settings.name != null) {
      var result = routes().where((element) => element.name == settings.name);

      if (result.isNotEmpty) {
        return MaterialPageRoute(
          builder: (context) => result.first.view,
        );
      } else {
        return MaterialPageRoute(
          builder: (context) => const ErrorPage(),
        );
      }
    }
    return MaterialPageRoute(
      builder: (context) => const ErrorPage(),
    );
  }

  static List<dynamic> allBlocProviders() => [
        BlocProvider(
          create: (context) => LoginBloc(),
        )
      ];

  static Future init() async {}
}
