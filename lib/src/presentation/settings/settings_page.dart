import 'package:agroguru/src/presentation/common/appbar.dart';
import 'package:agroguru/src/presentation/profile/bloc/profile_bloc.dart';
import 'package:agroguru/src/presentation/settings/bloc/settings_bloc.dart';
import 'package:agroguru/src/presentation/settings/widgets/settings_tile.dart';
import 'package:agroguru/src/utils/constants/strings/routes.dart';
import 'package:agroguru/src/utils/constants/strings/strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SettingsBloc()..add(SettingsInitialEvent()),
      child: BlocConsumer<SettingsBloc, SettingsState>(
        listener: (context, state) async {
          if (state is LoggedOutState) {
            // await BlocProvider.of<ProfileBloc>(context).close();
            BlocProvider.of<ProfileBloc>(context).add(ProfileLogOutEvent());
            Navigator.pushNamedAndRemoveUntil(
              context,
              Routes.login,
              (route) => route.settings.name == Routes.login,
            );
          }
        },
        builder: (context, state) {
          return Scaffold(
            appBar: customAppBar(),
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
                          image: Strings.profile,
                          title: 'Profile',
                          onTap: () {
                            Navigator.pushNamed(context, Routes.profile);
                          },
                        ),
                        SettingsTile(
                          image: Strings.preferences,
                          title: 'Preferences',
                          onTap: () {
                            Navigator.pushNamed(context, Routes.preferences);
                          },
                        ),
                        SettingsTile(
                          image: Strings.feedback,
                          title: 'Feedback',
                          onTap: () {
                            Navigator.pushNamed(context, Routes.feedback);
                          },
                        ),
                        SettingsTile(
                          image: Strings.aboutUs,
                          title: 'About us',
                          onTap: () {
                            Navigator.pushNamed(context, Routes.about);
                          },
                        ),
                        SettingsTile(
                          image: Strings.logout,
                          title: 'Log-out',
                          isLast: true,
                          onTap: () {
                            context.read<SettingsBloc>().add(
                                  LogOutEvent(),
                                );
                            // Navigator.popUntil(context, (route) => true);
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
