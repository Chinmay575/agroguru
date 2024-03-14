import 'package:agroguru/src/presentation/common/text_field.dart';
import 'package:agroguru/src/presentation/profile/bloc/profile_bloc.dart';
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
        return Scaffold(
          appBar: AppBar(
            leading: const BackButton(),
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
                        state.acc.displayPic,
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
                          state.acc.email,
                          style: TextStyles.heading6(),
                        ),
                        Padding(
                          padding: EdgeInsets.all(8.h),
                          child: Icon(
                            Icons.verified,
                            color: Colors.green,
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                  CustomTextField(
                    onChanged: (val) {},
                    hintText: 'Name',
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                  CustomTextField(
                    onChanged: (val) {},
                    hintText: 'Phone',
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
