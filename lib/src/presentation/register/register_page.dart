import 'package:agroguru/src/presentation/common/back_button.dart';
import 'package:agroguru/src/presentation/common/labelled_text_field.dart';
import 'package:agroguru/src/presentation/common/text_button.dart';
import 'package:agroguru/src/utils/constants/strings/routes.dart';
import 'package:agroguru/src/utils/styles/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        // title: CustomBackButton(),
        leading: const CustomBackButton(),
        leadingWidth: 89.w,
      ),
      body: SafeArea(
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
              LabelledTextField(
                label: AppLocalizations.of(context)!.confirmPassword,
                onChanged: (val) {},
                hintText: AppLocalizations.of(context)!.confirmPasswordHint,
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
                        fillColor:
                            MaterialStateProperty.all(HexColor('#D9D9D9')),
                        value: false,
                        onChanged: (val) {},
                      ),
                    ),
                    (AppLocalizations.of(context)!.localeName == 'hi')
                        ? Text(
                            AppLocalizations.of(context)!
                                .iAgreeWithTermsAndConditions,
                            style: TextStyles.body(),
                          )
                        : Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'I agree with ',
                                style: TextStyles.body(),
                              ),
                              Text(
                                'Terms and Conditions',
                                style: TextStyles.body(
                                  color: Theme.of(context).primaryColor,
                                  decoration: TextDecoration.underline,
                                  decorationColor:
                                      Theme.of(context).primaryColor,
                                ),
                              ),
                            ],
                          ),
                  ],
                ),
              ),
              CustomTextButton(
                onPressed: () {
                  Navigator.pushNamed(context, Routes.verifyEmail);
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
                    style: TextStyles.small(),
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
    );
  }
}
