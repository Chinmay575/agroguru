import 'package:agroguru/src/presentation/common/appbar.dart';
import 'package:agroguru/src/presentation/settings/widgets/preferences_tile.dart';
import 'package:agroguru/src/presentation/settings/widgets/settings_tile.dart';
import 'package:agroguru/src/utils/constants/enums/supported_languages.dart';
import 'package:agroguru/src/utils/constants/strings/strings.dart';
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
            child: Column(
              children: [
                SettingsTile(
                  onTap: () {
                    context.read<GlobalBloc>().add(
                          ChangeThemeEvent(mode: ThemeMode.dark),
                        );
                  },

                  image: Strings.darkMode,
                  title: 'Theme',
                  // child: ,
                ),
                SettingsTile(
                  onTap: () {
                    context.read<GlobalBloc>().add(
                          ChangeLanguageEvent(lang: Languages.hi),
                        );
                  },
                  image: Strings.language,
                  title: 'Language',
                ),
                PreferencesTile(),
              ],
            ),
          );
        },
      ),
    );
  }
}
