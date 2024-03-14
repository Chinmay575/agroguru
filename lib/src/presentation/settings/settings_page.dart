import 'package:agroguru/src/presentation/settings/bloc/settings_bloc.dart';
import 'package:agroguru/src/presentation/settings/widgets/settings_tile.dart';
import 'package:agroguru/src/utils/constants/strings/routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SettingsBloc, SettingsState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          body: SafeArea(
            child: Container(
              margin: EdgeInsets.symmetric(vertical: 16.h, horizontal: 27.w),
              child: Column(
                children: [
                  ListView(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    children: [
                      SettingsTile(
                        leading: CupertinoIcons.profile_circled,
                        // leading: Icons.tree,
                        title: 'Profile',
                        onTap: () {
                          Navigator.pushNamed(context, Routes.profile);
                        },
                      ),
                      SettingsTile(
                        leading: CupertinoIcons.settings,
                        title: 'Preferences',
                        onTap: () {},
                      ),
                      SettingsTile(
                        leading: CupertinoIcons.question_circle,
                        title: 'Feedback',
                        onTap: () {},
                      ),
                      SettingsTile(
                        leading: CupertinoIcons.info,
                        title: 'About us',
                        onTap: () {},
                      ),
                      SettingsTile(
                        leading: CupertinoIcons.lock,
                        title: 'Log-out',
                        onTap: () {},
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
