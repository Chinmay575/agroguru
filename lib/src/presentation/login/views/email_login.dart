// ignore_for_file: must_be_immutable

import 'package:agroguru/src/presentation/common/back_button.dart';
import 'package:agroguru/src/presentation/common/labelled_text_field.dart';
import 'package:agroguru/src/presentation/common/text_button.dart';
import 'package:agroguru/src/presentation/login/bloc/login_bloc.dart';
import 'package:agroguru/src/utils/constants/strings/routes.dart';
import 'package:agroguru/src/utils/styles/text_styles.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class LoginUsingEmail extends StatelessWidget {
  const LoginUsingEmail({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginBloc, LoginState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            // title: CustomBackButton(),
            leading: const CustomBackButton(),
            leadingWidth: 89.w,
          ),
          resizeToAvoidBottomInset: false,
          body: SafeArea(
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 31.w),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 64.h,
                  ),
                  Text(
                    AppLocalizations.of(context)!.loginAccount,
                    style: TextStyles.heading3(),
                  ),
                  SizedBox(
                    height: 32.h,
                  ),
                  LabelledTextField(
                    label: AppLocalizations.of(context)!.email,
                    onChanged: (val) {},
                    hintText: AppLocalizations.of(context)!.emailHint,
                  ),
                  LabelledTextField(
                    label: AppLocalizations.of(context)!.password,
                    onChanged: (val) {},
                    hintText: AppLocalizations.of(context)!.passwordHint,
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      AppLocalizations.of(context)!.forgetPassword,
                      style: TextStyles.body(
                        color: Theme.of(context).primaryColor,
                        decoration: TextDecoration.underline,
                        decorationColor: Theme.of(context).primaryColor,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 32.h,
                  ),
                  CustomTextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, Routes.home);
                    },
                    text: AppLocalizations.of(context)!.login,
                    color: Theme.of(context).primaryColor,
                    textColor: Colors.white,
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
