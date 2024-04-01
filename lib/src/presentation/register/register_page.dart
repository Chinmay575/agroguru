import 'package:agroguru/src/presentation/common/back_button.dart';
import 'package:agroguru/src/presentation/common/labelled_text_field.dart';
import 'package:agroguru/src/presentation/common/text_button.dart';
import 'package:agroguru/src/utils/constants/enums/auth_status.dart';
import 'package:agroguru/src/utils/constants/strings/routes.dart';
import 'package:agroguru/src/utils/styles/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'bloc/register_bloc.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController emailController = TextEditingController(),
      passwordController = TextEditingController(),
      confirmPasswordController = TextEditingController();

  bool agreed = false;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RegisterBloc(),
      child: BlocConsumer<RegisterBloc, RegisterState>(
        listener: (context, state) {
          if (state.status == AuthStatus.success) {
            Navigator.pushNamedAndRemoveUntil(
              context,
              Routes.home,
              (route) => route.settings.name == Routes.login,
            );
          }
        },
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              automaticallyImplyLeading: false,
              // title: CustomBackButton(),
              leading: const CustomBackButton(),
              leadingWidth: 96.w,
            ),
            body: SafeArea(
              child: SingleChildScrollView(
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 32.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 64.h,
                      ),
                      Text(
                        AppLocalizations.of(context)!.createAccount,
                        style: TextStyles.of(context).heading3(),
                      ),
                      SizedBox(
                        height: 32.h,
                      ),
                      LabelledTextField(
                        label: AppLocalizations.of(context)!.email,
                        controller: emailController,
                        hintText: AppLocalizations.of(context)!.emailHint,
                      ),
                      LabelledTextField(
                        label: AppLocalizations.of(context)!.password,
                        controller: passwordController,
                        hintText: AppLocalizations.of(context)!.passwordHint,
                      ),
                      LabelledTextField(
                        label: AppLocalizations.of(context)!.confirmPassword,
                        controller: confirmPasswordController,
                        hintText:
                            AppLocalizations.of(context)!.confirmPasswordHint,
                      ),
                      Container(
                        // height: 32.h,
                        margin: EdgeInsets.only(bottom: 16.h),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Transform.scale(
                              scale: 1.5,
                              child: Checkbox(
                                side: BorderSide.none,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(6.h),
                                ),
                                fillColor: MaterialStateProperty.all(
                                    HexColor('#D9D9D9')),
                                value: agreed,
                                onChanged: (val) {
                                  setState(() {
                                    agreed = !agreed;
                                  });
                                },
                              ),
                            ),
                            (AppLocalizations.of(context)!.localeName == 'hi')
                                ? Text(
                                    AppLocalizations.of(context)!
                                        .iAgreeWithTermsAndConditions,
                                    style: TextStyles.of(context).body(),
                                  )
                                : Row(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        'I agree with ',
                                        style: TextStyles.of(context).body(),
                                      ),
                                      GestureDetector(
                                        onTap: () {},
                                        child: Text(
                                          'Terms and Conditions',
                                          style: TextStyles.of(context).body(
                                            color: Theme.of(context).primaryColor,
                                            decoration: TextDecoration.underline,
                                            decorationColor:
                                                Theme.of(context).primaryColor,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                          ],
                        ),
                      ),
                      CustomTextButton(
                        onPressed: () {
                          if (passwordController.text ==
                              confirmPasswordController.text && agreed) {
                            context.read<RegisterBloc>().add(
                                  RegisterUsingEmailEvent(
                                    emailController.text,
                                    passwordController.text,
                                  ),
                                );
                          }
                        },
                        text: AppLocalizations.of(context)!.register,
                        color: Theme.of(context).primaryColor,
                        textColor: Colors.white,
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 32.h),
                        // color: Colors.amber,
                        child: Center(
                          child: Text(
                            AppLocalizations.of(context)!.privacyPolicyInfo,
                            style: TextStyles.of(context).small(),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 32.h,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
