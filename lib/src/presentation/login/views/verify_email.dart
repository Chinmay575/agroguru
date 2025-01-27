// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:agroguru/src/presentation/common/text_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:agroguru/src/presentation/common/back_button.dart';
import 'package:agroguru/src/presentation/common/text_field.dart';
import 'package:agroguru/src/utils/styles/text_styles.dart';

class VerifyEmailPage extends StatefulWidget {
  const VerifyEmailPage({
    Key? key,
  }) : super(key: key);

  @override
  State<VerifyEmailPage> createState() => _VerifyEmailPageState();
}

class _VerifyEmailPageState extends State<VerifyEmailPage> {
  late List<FocusNode?> focusNodes;

  @override
  void initState() {
    super.initState();
    focusNodes = List<FocusNode?>.filled(6, null);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        // title: CustomBackButton(),
        leading: CustomBackButton(),
        leadingWidth: 90.w,
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 32.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 64.h,
            ),
            Text(
              AppLocalizations.of(context)!.verification,
              style: TextStyles.of(context).heading3(),
            ),
            SizedBox(
              height: 32.h,
            ),
            Text(
              AppLocalizations.of(context)!.verificationText,
              style: TextStyles.of(context).small(),
            ),
            SizedBox(
              height: 32.h,
            ),
            Text(
              AppLocalizations.of(context)!.otp,
              style: TextStyles.of(context).body(),
            ),
            Container(
              height: 80.h,
              width: 390.w,
              margin: EdgeInsets.only(top: 16.h),
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: 6,
                scrollDirection: Axis.horizontal,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return Container(
                    width: 48.w,
                    height: 64.h,
                    margin: EdgeInsets.only(right: 8.w),
                    child: CustomTextField(
                      focusNode: focusNodes[index],
                      textAlign: TextAlign.center,
                      keyboardType: TextInputType.number,
                      contentPadding: EdgeInsets.symmetric(
                        vertical: 23.h,
                        // horizontal: 16.w,
                      ),
                      maxLength: 1,
                      onChanged: (val) {
                        changeFocusToNextNodeWhenValueIsEntered(
                          value: val,
                          indexOfTextField: index,
                        );
                        changeFocusToPreviousNodeWhenValueIsRemoved(
                          value: val,
                          indexOfTextField: index,
                        );
                      },
                      hintText: '',
                    ),
                  );
                },
              ),
            ),
            SizedBox(
              height: 32.h,
            ),
            CustomTextButton(
              onPressed: () {},
              text: AppLocalizations.of(context)!.verifyEmail,
              color: Colors.green,
              textColor: Colors.white,
            ),
            SizedBox(
              height: 32.h,
            ),
            Center(
              child: Text(
                AppLocalizations.of(context)!.resendOTPin,
                style: TextStyles.of(context).small(),
              ),
            ),
            SizedBox(
              height: 32.h,
            ),
            CustomTextButton(
              onPressed: () {},
              text: AppLocalizations.of(context)!.resendOTP,
              color: Colors.grey.shade300,
            ),
            SizedBox(
              height: 32.h,
            ),
            Center(
              child: Text(
                AppLocalizations.of(context)!.issuesText,
                style: TextStyles.of(context).small(),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void changeFocusToNextNodeWhenValueIsEntered({
    required String value,
    required int indexOfTextField,
  }) {
    if (value.isNotEmpty) {
      if (indexOfTextField + 1 != 6) {
        focusNodes[indexOfTextField]?.unfocus();
        FocusScope.of(context).requestFocus(focusNodes[indexOfTextField + 1]);
      } else {
        focusNodes[indexOfTextField]?.unfocus();
      }
    }
  }

  void changeFocusToPreviousNodeWhenValueIsRemoved({
    required String value,
    required int indexOfTextField,
  }) {
    if (value.isEmpty) {
      if (indexOfTextField != 0) {
        FocusScope.of(context).requestFocus(focusNodes[indexOfTextField - 1]);
      }
    }
  }
}
