import 'package:agroguru/src/presentation/common/divider.dart';
import 'package:agroguru/src/presentation/common/icon_text_button.dart';
import 'package:agroguru/src/presentation/common/logo.dart';
import 'package:agroguru/src/presentation/common/text_button.dart';
import 'package:agroguru/src/presentation/login/bloc/login_bloc.dart';
import 'package:agroguru/src/utils/constants/enums/auth_status.dart';
import 'package:agroguru/src/utils/constants/strings/routes.dart';
import 'package:agroguru/src/utils/styles/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginBloc, LoginState>(
      listener: (context, state) {
        
        print(state.status.toString());
        if (state.status == AuthStatus.success) {
          Navigator.pushReplacementNamed(context, Routes.home);
        
        }
      },
      builder: (context, state) {
        return Scaffold(
          body: SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Logo(),
                Column(
                  children: [
                    CustomIconTextButton(
                      onPressed: () async {
                        context.read<LoginBloc>().add(LoginUsingGoogle());
                      },
                      icon: Brand(
                        Brands.google,
                        size: 24.h,
                      ),
                      text: AppLocalizations.of(context)!.continueWithGoogle,
                      color: Colors.white,
                    ),
                    const CustomDivider(),
                    CustomTextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, Routes.loginUsingEmail);
                      },
                      text: AppLocalizations.of(context)!.loginWithEmailPhone,
                      color: Theme.of(context).primaryColor,
                      textColor: Colors.white,
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 32.h),
                      child: Text(AppLocalizations.of(context)!.dontHaveAccount,
                          style: TextStyles.of(context).small()),
                    ),
                    CustomTextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, Routes.register);
                      },
                      text: AppLocalizations.of(context)!.createAccount,
                      color: Colors.grey.shade300,
                    ),
                    SizedBox(
                      height: 64.h,
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
