import 'package:agroguru/src/presentation/common/appbar.dart';
import 'package:agroguru/src/presentation/settings/widgets/settings_tile.dart';
import 'package:agroguru/src/utils/constants/strings/strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 27.w,vertical: 16.h),
        child: Column(
          children: [
            SettingsTile(
              onTap: () {},
              image: Strings.darkMode,
              title: 'Theme',
            ),
            SettingsTile(
              onTap: () {},
              image: Strings.language,
              title: 'Language',
            )
          ],
        ),
      ),
    );
  }
}
