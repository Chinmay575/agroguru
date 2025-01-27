import 'package:agroguru/src/presentation/common/text_button.dart';
import 'package:agroguru/src/presentation/common/text_field.dart';
import 'package:agroguru/src/utils/constants/strings/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../utils/styles/text_styles.dart';
import '../../common/back_button.dart';
import '../bloc/profile_bloc.dart';

class UpdateProfilePage extends StatefulWidget {
  const UpdateProfilePage({super.key});

  @override
  State<UpdateProfilePage> createState() => _UpdateProfilePageState();
}

class _UpdateProfilePageState extends State<UpdateProfilePage> {
  TextEditingController nameController = TextEditingController(),
      phoneNumController = TextEditingController(),
      addressController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProfileBloc, ProfileState>(
      listener: (context, state) {},
      builder: (context, state) {
        nameController.text = state.acc?.name ?? '';
        phoneNumController.text = state.acc?.phone ?? '';
        addressController.text = state.acc?.address ?? '';
        return Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            leading:  CustomBackButton(),
            leadingWidth: 96.w,
          ),
          body: SingleChildScrollView(
            child: Container(
              width: 1080.w,
              margin: EdgeInsets.symmetric(horizontal: 27.w),
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
                  CustomTextField(
                    hintText: 'Name',
                    controller: nameController,
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                  CustomTextField(
                    hintText: 'Phone',
                    controller: phoneNumController,
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                  CustomTextField(
                    hintText: 'Address',
                    controller: addressController,
                  ),
                  SizedBox(
                    height: 216.h,
                  ),
                  CustomTextButton(
                    onPressed: () {
                      context.read<ProfileBloc>().add(
                            UpdateProfileEvent(
                              state.acc!.copyWith(
                                name: nameController.text,
                                phone: phoneNumController.text,
                                address: addressController.text,
                              ),
                            ),
                          );
                      Navigator.pop(context);
                    },
                    text: 'Update Profile',
                    color: Colors.green,
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
