import 'package:agroguru/firebase_options.dart';
import 'package:agroguru/src/data/models/route.dart';
import 'package:agroguru/src/domain/repository/auth_repository.dart';
import 'package:agroguru/src/presentation/error/error_page.dart';
import 'package:agroguru/src/presentation/feed/feed_page.dart';
import 'package:agroguru/src/presentation/create_post/create_post_page.dart';
import 'package:agroguru/src/presentation/home/bloc/home_bloc.dart';
import 'package:agroguru/src/presentation/home/home_page.dart';
import 'package:agroguru/src/presentation/login/bloc/login_bloc.dart';
import 'package:agroguru/src/presentation/login/login_page.dart';
import 'package:agroguru/src/presentation/login/views/email_login.dart';
import 'package:agroguru/src/presentation/login/views/verify_email.dart';
import 'package:agroguru/src/presentation/navigation/bloc/navigation_bloc.dart';
import 'package:agroguru/src/presentation/navigation/navigation_page.dart';
import 'package:agroguru/src/presentation/profile/bloc/profile_bloc.dart';
import 'package:agroguru/src/presentation/profile/profile_page.dart';
import 'package:agroguru/src/presentation/register/register_page.dart';
import 'package:agroguru/src/presentation/settings/bloc/settings_bloc.dart';
import 'package:agroguru/src/presentation/settings/settings_page.dart';
import 'package:agroguru/src/presentation/store/store_page.dart';
import 'package:agroguru/src/presentation/weather/bloc/weather_bloc.dart';
import 'package:agroguru/src/presentation/weather/weather_page.dart';
import 'package:agroguru/src/utils/constants/strings/routes.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../presentation/create_post/bloc/create_post_bloc.dart';
import '../presentation/notifications/notifications_page.dart';

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
        AppRoute(
          name: Routes.loginUsingEmail,
          view: const LoginUsingEmail(),
        ),
        AppRoute(
          name: Routes.verifyEmail,
          view: const VerifyEmailPage(),
        ),
        AppRoute(
          name: Routes.weatherInfo,
          view: const WeatherPage(),
        ),
        AppRoute(
          name: Routes.navigationFrame,
          view: const NavigationPage(),
        ),
        AppRoute(
          name: Routes.profile,
          view: const ProfilePage(),
        ),
        AppRoute(
          name: Routes.settings,
          view: const SettingsPage(),
        ),
        AppRoute(
          name: Routes.notifications,
          view: const NotificationsPage(),
        ),
        AppRoute(
          name: Routes.store,
          view: const StorePage(),
        ),
        AppRoute(
          name: Routes.feed,
          view: const FeedPage(),
        ),
        AppRoute(
          name: Routes.createPost,
          view: const CreatePostPage(),
        ),
      ];

  static Route onGenerateRoute(RouteSettings settings) {
    if (settings.name != null) {
      String nextRoute = settings.name!;

      if (AuthRepository.isAuthenticated) {
        List<String> disAllowedRoutes = [
          Routes.login,
          Routes.loginUsingEmail,
          Routes.register,
        ];
        if (disAllowedRoutes.contains(nextRoute)) {
          nextRoute = Routes.home;
        }
      } else if (!AuthRepository.isAuthenticated) {
        List<String> allowedRoutes = [
          Routes.login,
          Routes.loginUsingEmail,
          Routes.register,
        ];
        if (!allowedRoutes.contains(nextRoute)) {
          nextRoute = Routes.login;
        }
      }
      List<String> pages = [
        Routes.home,
      ];
      if (pages.contains(nextRoute)) {
        nextRoute = Routes.navigationFrame;
      }

      Iterable<AppRoute> result =
          routes().where((element) => element.name == nextRoute);

      if (result.isNotEmpty) {
        return MaterialPageRoute(
          builder: (context) => result.first.view,
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
        ),
        BlocProvider(
          create: (context) => HomeBloc(),
        ),
        BlocProvider(
          create: (context) => WeatherBloc()..add(WeatherInitialEvent()),
        ),
        BlocProvider(
          create: (context) => NavigationBloc(),
        ),
        BlocProvider(
          create: (context) => CreatePostBloc(),
        ),
        BlocProvider(
          create: (context) => SettingsBloc()..add(SettingsInitialEvent()),
        ),
        BlocProvider(
          create: (context) => ProfileBloc()..add(ProfileInitialEvent()),
        ),
      ];

  static Future init() async {
    WidgetsFlutterBinding.ensureInitialized();

    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );

    // await AuthRepository.auth.signOut();
    await AuthRepository.checkAuthStatus();

    // print(AuthRepository.isAuthenticated);

    // print(AuthRepository.curUser?.toMap());

    // print(await LocationRepository.getCurrentCity());
  }
}
