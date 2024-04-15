import 'dart:async';

import 'package:agroguru/src/presentation/common/back_button.dart';
import 'package:agroguru/src/presentation/common/text_button.dart';
import 'package:agroguru/src/presentation/common/text_field.dart';
import 'package:agroguru/src/presentation/create_post/bloc/create_post_bloc.dart';
import 'package:agroguru/src/utils/constants/strings/routes.dart';
import 'package:agroguru/src/utils/styles/text_styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../utils/constants/strings/assets.dart';

class CreatePostPage extends StatelessWidget {
  const CreatePostPage({super.key});

  @override
  Widget build(BuildContext context) {
    // TextEditingController titleController = TextEditingController();
    // TextEditingController contentController = TextEditingController();
    // ImagePicker imagePicker = ImagePicker();

    Future<void> pickImage() async {}

    // Future<void> openCamera() async {}

    return BlocConsumer<CreatePostBloc, CreatePostState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            leading: CustomBackButton(),
            leadingWidth: 89.w,
          ),
          body: SingleChildScrollView(
            child: Container(
              height: 720.h,
              margin: EdgeInsets.symmetric(
                horizontal: 27.w,
                vertical: 16.h,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    height: 336.w,
                    width: 336.w,
                    decoration: BoxDecoration(
                      color: HexColor('#1315131A'),
                      borderRadius: BorderRadius.circular(32.h),
                    ),
                    child: GestureDetector(
                      onTap: () {
                        showModalBottomSheet(
                          context: context,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(32.r),
                              topRight: Radius.circular(32.r),
                            ),
                          ),
                          builder: (context) {
                            return Container(
                              height: 200.h,
                              width: 390.w,
                              padding: EdgeInsets.all(10.w),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  GestureDetector(
                                    onTap: () async {
                                      Navigator.pushNamed(
                                          context, Routes.camera);
                                    },
                                    child: Container(
                                      height: 200.h,
                                      width: 160.w,
                                      margin: EdgeInsets.all(
                                        10.w,
                                      ),
                                      decoration: BoxDecoration(
                                        // color: Colors.amber,
                                        borderRadius:
                                            BorderRadius.circular(22.r),
                                      ),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Image.asset(Assets.camera),
                                          Text(
                                            'Camera',
                                            style: TextStyles.of(context)
                                                .heading6(),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Container(
                                    height: 200.h,
                                    width: 160.w,
                                    margin: EdgeInsets.only(
                                      top: 10.w,
                                      right: 10.w,
                                      bottom: 10.w,
                                    ),
                                    decoration: BoxDecoration(
                                      // color: Colors.amber,
                                      borderRadius: BorderRadius.circular(22.r),
                                    ),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Image.asset(Assets.images),
                                        Text(
                                          'Gallery',
                                          style:
                                              TextStyles.of(context).heading6(),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        );
                      },
                      child: const Center(
                        child: Icon(CupertinoIcons.camera),
                      ),
                    ),
                  ),
                  CustomTextField(
                    width: 336.w,
                    onChanged: (val) {},
                    hintText: 'Title',
                  ),
                  CustomTextField(
                    width: 336.w,
                    height: 160.h,
                    maxLines: 10,
                    onChanged: (val) {},
                    hintText: 'Content',
                  ),
                  CustomTextButton(
                    onPressed: () {},
                    text: 'Post',
                    width: 336.w,
                    color: Theme.of(context).primaryColor,
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
