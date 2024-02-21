import 'package:agroguru/src/config/router.dart';
import 'package:agroguru/src/utils/constants/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Future main() async {
  await AppRouter.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [...AppRouter.allBlocProviders()],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'AgroGuru',
        theme: ThemeData(
          useMaterial3: true,
        ),
        initialRoute: Routes.login,
        onGenerateRoute: AppRouter.onGenerateRoute,
      ),
    );
  }
}
