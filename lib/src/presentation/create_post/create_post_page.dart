import 'package:agroguru/src/presentation/common/back_button.dart';
import 'package:agroguru/src/presentation/common/text_button.dart';
import 'package:agroguru/src/presentation/common/text_field.dart';
import 'package:agroguru/src/presentation/create_post/bloc/create_post_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hexcolor/hexcolor.dart';

class CreatePostPage extends StatelessWidget {
  const CreatePostPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CreatePostBloc, CreatePostState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            leading: const CustomBackButton(),
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
                      borderRadius: BorderRadius.circular(32.h) 
                    ),
                    child: const Center(
                      child: Icon(CupertinoIcons.camera),
                    ),
                    // color: Colors.amber,
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
