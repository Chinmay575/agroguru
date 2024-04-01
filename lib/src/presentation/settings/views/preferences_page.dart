import 'package:agroguru/src/presentation/common/appbar.dart';
import 'package:agroguru/src/presentation/settings/widgets/language_tile.dart';
import 'package:agroguru/src/presentation/settings/widgets/theme_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


import '../../../config/bloc/global_bloc.dart';

class PreferencesPage extends StatefulWidget {
  const PreferencesPage({super.key});

  @override
  State<PreferencesPage> createState() => _PreferencesPageState();
}

class _PreferencesPageState extends State<PreferencesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(),
      body: BlocConsumer<GlobalBloc, GlobalState>(
        listener: (context, state) {},
        builder: (context, state) {
          return Container(
            margin: EdgeInsets.symmetric(horizontal: 27.w, vertical: 16.h),
            child: const Column(
              children: [
                ThemeTile(),
                LanguageTile(),
              ],
            ),
          );
        },
      ),
    );
  }
}
