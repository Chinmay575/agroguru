// ignore_for_file: must_be_immutable

import 'package:agroguru/src/presentation/common/back_button.dart';
import 'package:agroguru/src/presentation/common/text_button.dart';
import 'package:agroguru/src/presentation/profile/bloc/profile_bloc.dart';
import 'package:agroguru/src/utils/constants/enums/login_methods.dart';
import 'package:agroguru/src/utils/constants/strings/assets.dart';
import 'package:agroguru/src/utils/constants/strings/routes.dart';
import 'package:agroguru/src/utils/styles/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProfileBloc, ProfileState>(
      listener: (context, state) {},
      builder: (context, state) {
        print(state.acc!.toMap());
        return Scaffold(
          appBar: AppBar(
            leading: CustomBackButton(),
            leadingWidth: 96.w,
          ),
          body: SafeArea(
            child: Container(
              width: 390.w,
              margin: EdgeInsets.symmetric(vertical: 16.h, horizontal: 27.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 16.h,
                  ),
                  CircleAvatar(
                    radius: 64.h,
                    backgroundColor: Colors.white,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(64.h),
                      child: Image.network(
                        state.acc?.displayPic ?? Assets.avatar,
                        height: 128.h,
                        width: 128.h,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 8.h,
                  ),
                  FittedBox(
                    fit: BoxFit.contain,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          state.acc?.email ?? '',
                          style: TextStyles.of(context).heading6(),
                        ),
                        Padding(
                          padding: EdgeInsets.all(8.h),
                          child: (state.acc?.isVerified ?? false)
                              ? const Icon(
                                  Icons.verified,
                                  color: Colors.green,
                                )
                              : GestureDetector(
                                  onTap: () {},
                                  child: const Icon(
                                    Icons.cancel,
                                    color: Colors.red,
                                  ),
                                ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                  CustomTextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, Routes.updateProfile);
                    },
                    textColor: Colors.white,
                    text: 'Update Profile',
                    color: Colors.green,
                  ),
                  (state.type != LoginType.google)
                      ? CustomTextButton(
                          margin: EdgeInsets.only(top: 16.h),
                          onPressed: () {},
                          textColor: Colors.white,
                          text: 'Change Password',
                          color: Colors.green,
                        )
                      : Container(),
                  SizedBox(
                    height: 16.h,
                  ),
                  CustomTextButton(
                    onPressed: () {},
                    textColor: Colors.white,
                    text: 'Request Account Deactivation',
                    color: Colors.green,
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
