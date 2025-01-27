import 'package:agroguru/firebase_options.dart';
import 'package:agroguru/src/config/global.dart';
import 'package:agroguru/src/data/models/route.dart';
import 'package:agroguru/src/domain/repository/auth_repository.dart';
import 'package:agroguru/src/presentation/ai_assistant/ai_assistant_page.dart';
import 'package:agroguru/src/presentation/ai_assistant/bloc/ai_bloc.dart';
import 'package:agroguru/src/presentation/common/camera.dart';
import 'package:agroguru/src/presentation/error/error_page.dart';
import 'package:agroguru/src/presentation/feed/feed_page.dart';
import 'package:agroguru/src/presentation/create_post/create_post_page.dart';
import 'package:agroguru/src/presentation/guide/bloc/guide_bloc.dart';
import 'package:agroguru/src/presentation/guide/bloc/plant_detail_bloc.dart';
import 'package:agroguru/src/presentation/guide/guide_page.dart';
import 'package:agroguru/src/presentation/guide/views/plant_detail_page.dart';
import 'package:agroguru/src/presentation/home/bloc/home_bloc.dart';
import 'package:agroguru/src/presentation/home/home_page.dart';
import 'package:agroguru/src/presentation/login/bloc/login_bloc.dart';
import 'package:agroguru/src/presentation/login/login_page.dart';
import 'package:agroguru/src/presentation/login/views/email_login.dart';
import 'package:agroguru/src/presentation/login/views/verify_email.dart';
import 'package:agroguru/src/presentation/navigation/bloc/navigation_bloc.dart';
import 'package:agroguru/src/presentation/navigation/navigation_page.dart';
import 'package:agroguru/src/presentation/plantcare/bloc/plantcare_bloc.dart';
import 'package:agroguru/src/presentation/plantcare/views/detailed_result_page.dart';
import 'package:agroguru/src/presentation/plantcare/views/leaf_input_page.dart';
import 'package:agroguru/src/presentation/plantcare/views/plant_care_home_page.dart';
import 'package:agroguru/src/presentation/plantcare/views/plant_care_tutorial_page.dart';
import 'package:agroguru/src/presentation/profile/bloc/profile_bloc.dart';
import 'package:agroguru/src/presentation/profile/profile_page.dart';
import 'package:agroguru/src/presentation/profile/views/update_profile_page.dart';
import 'package:agroguru/src/presentation/register/register_page.dart';
import 'package:agroguru/src/presentation/schemes/bloc/schemes_bloc.dart';
import 'package:agroguru/src/presentation/schemes/schemes_page.dart';
import 'package:agroguru/src/presentation/schemes/views/detailed_schemes_page.dart';
import 'package:agroguru/src/presentation/search/search_page.dart';
import 'package:agroguru/src/presentation/settings/settings_page.dart';
import 'package:agroguru/src/presentation/settings/views/about_us_page.dart';
import 'package:agroguru/src/presentation/settings/views/feed_back_page.dart';
import 'package:agroguru/src/presentation/settings/views/preferences_page.dart';
import 'package:agroguru/src/presentation/splash/splash_page.dart';
import 'package:agroguru/src/presentation/store/bloc/store_bloc.dart';
import 'package:agroguru/src/presentation/store/store_page.dart';
import 'package:agroguru/src/presentation/weather/bloc/weather_bloc.dart';
import 'package:agroguru/src/presentation/weather/weather_page.dart';
import 'package:agroguru/src/utils/constants/strings/routes.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../presentation/create_post/bloc/create_post_bloc.dart';
import '../presentation/notifications/notifications_page.dart';
import 'bloc/global_bloc.dart';

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
          view: StorePage(),
        ),
        AppRoute(
          name: Routes.feed,
          view: const FeedPage(),
        ),
        AppRoute(
          name: Routes.createPost,
          view: const CreatePostPage(),
        ),
        AppRoute(
          name: Routes.camera,
          view: const CameraPage(),
        ),
        AppRoute(
          name: Routes.guide,
          view: const GuidePage(),
        ),
        AppRoute(
          name: Routes.plantDetail,
          view: const PlantDetailPage(),
        ),
        AppRoute(
          name: Routes.plantCareHome,
          view: const PlantCareHomePage(),
        ),
        AppRoute(
          name: Routes.leafInput,
          view: const LeafInputPage(),
        ),
        AppRoute(
          name: Routes.updateProfile,
          view: const UpdateProfilePage(),
        ),
        AppRoute(
          name: Routes.schemes,
          view: const SchemesPage(),
        ),
        AppRoute(
          name: Routes.detailedScheme,
          view: const DetailedSchemesPage(),
        ),
        AppRoute(
          name: Routes.preferences,
          view: const PreferencesPage(),
        ),
        AppRoute(
          name: Routes.about,
          view: const AboutUsPage(),
        ),
        AppRoute(
          name: Routes.feedback,
          view: const FeedBackPage(),
        ),
        AppRoute(
          name: Routes.assistant,
          view: const AiAssistantPage(),
        ),
        AppRoute(
          name: Routes.splash,
          view: const SplashScreen(),
        ),
        AppRoute(
          name: Routes.tutorial,
          view: const PlantCareTutorialPage(),
        ),
        AppRoute(
          name: Routes.detailedResult,
          view: const DetailedResultPage(),
        ),
        AppRoute(
          name: Routes.search,
          view: const SearchPage(),
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
      // List<String> pages = [
      //   Routes.home,
      //   Routes.store,
      // ];
      // if (pages.contains(nextRoute)) {
      //   nextRoute = Routes.navigationFrame;
      // }
      print(nextRoute);
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
          create: (context) => PlantcareBloc()..add(GetPredictionHistory()),
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
          create: (context) => PlantDetailBloc(),
        ),
        BlocProvider(
          create: (context) => ProfileBloc()..add(ProfileInitialEvent()),
        ),
        BlocProvider(
          create: (context) => AiBloc(),
        ),
        BlocProvider(
          create: (context) => GlobalBloc()..add(GetSavedPreferences()),
        ),
        BlocProvider(
          create: (context) => GuideBloc()..add(GetPlantData()),
        ),
        BlocProvider(
          create: (context) => SchemesBloc()..add(GetSchemesEvent()),
        ),
        BlocProvider(
          create: (context) => StoreBloc()..add(LoadMockData()),
        )
      ];

  static Future init() async {
    WidgetsFlutterBinding.ensureInitialized();

    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );

    await AuthRepository.checkAuthStatus();

    print('Cur User: ${AuthRepository.curUser?.toMap()}');
    print(AuthRepository.isAuthenticated);
    await Global.init();

    // TranslateLanguage sourceLanguage = TranslateLanguage.english;
    // TranslateLanguage targetLanguage = TranslateLanguage.hindi;

    // OnDeviceTranslator onDeviceTranslator = OnDeviceTranslator(
    //   sourceLanguage: sourceLanguage,
    //   targetLanguage: targetLanguage,
    // );

    // final String response = await onDeviceTranslator.translateText('Agro Guru');
    // print(response);
  }
}
