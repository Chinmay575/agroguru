import 'package:agroguru/src/presentation/common/labelled_text_field.dart';
import 'package:agroguru/src/presentation/common/text_button.dart';
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
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 31.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              MaterialButton(
                padding: EdgeInsets.zero,
                minWidth: 58.w,
                height: 19.h,
                // color: Colors.amber,
                elevation: 0,
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      padding: EdgeInsets.only(right: 8.w),
                      child: Icon(
                        Icons.arrow_back,
                        size: 16.w,
                      ),
                    ),
                    Text(
                      AppLocalizations.of(context)!.back,
                      style: TextStyle(fontFamily: 'Lato', fontSize: 16.h),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 64.h,
              ),
              Text(
                AppLocalizations.of(context)!.createAccount,
                style: TextStyle(
                  fontFamily: 'Lato',
                  fontSize: 39.h,
                  fontWeight: FontWeight.w400,
                ),
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
                            style: TextStyle(
                              fontFamily: 'Lato',
                              // height: 19.h,
                              fontSize: 16.h,
                            ),
                          )
                        : Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'I agree with ',
                                style: TextStyle(
                                  fontFamily: 'Lato',
                                  // height: 19.h,
                                  fontSize: 16.h,
                                ),
                              ),
                              Text(
                                'Terms and Conditions',
                                style: TextStyle(
                                  fontFamily: 'Lato',
                                  // height: 19.h,
                                  fontSize: 16.h,
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
                onPressed: () {},
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
                    style: TextStyle(
                      fontSize: 14.h,
                      fontFamily: 'Lato',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 64.h,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
