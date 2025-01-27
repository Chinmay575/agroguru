import 'package:agroguru/src/presentation/common/appbar.dart';
import 'package:agroguru/src/presentation/profile/bloc/profile_bloc.dart';
import 'package:agroguru/src/presentation/settings/bloc/settings_bloc.dart';
import 'package:agroguru/src/presentation/settings/widgets/settings_tile.dart';
import 'package:agroguru/src/utils/constants/strings/routes.dart';
import 'package:agroguru/src/utils/constants/strings/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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
                          image: Assets.profile,
                          title: AppLocalizations.of(context)!.profile,
                          onTap: () {
                            Navigator.pushNamed(context, Routes.profile);
                          },
                        ),
                        SettingsTile(
                          image: Assets.preferences,
                          title: AppLocalizations.of(context)!.preferences,
                          onTap: () {
                            Navigator.pushNamed(context, Routes.preferences);
                          },
                        ),
                        SettingsTile(
                          image: Assets.feedback,
                          title: AppLocalizations.of(context)!.feedback,
                          onTap: () {
                            Navigator.pushNamed(context, Routes.feedback);
                          },
                        ),
                        SettingsTile(
                          image: Assets.aboutUs,
                          title: AppLocalizations.of(context)!.aboutUs,
                          onTap: () {
                            Navigator.pushNamed(context, Routes.about);
                          },
                        ),
                        SettingsTile(
                          image: Assets.logout,
                          title: AppLocalizations.of(context)!.logOut,
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
