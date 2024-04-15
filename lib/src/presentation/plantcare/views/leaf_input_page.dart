import 'dart:io';

import 'package:agroguru/src/utils/styles/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../utils/constants/strings/assets.dart';
import '../../common/back_button.dart';
import '../../common/text_button.dart';
import '../bloc/plantcare_bloc.dart';

class LeafInputPage extends StatefulWidget {
  const LeafInputPage({super.key});

  @override
  State<LeafInputPage> createState() => _LeafInputPageState();
}

class _LeafInputPageState extends State<LeafInputPage> {
  ImagePicker picker = ImagePicker();
  ImageCropper cropper = ImageCropper();

  Future<File?> getImage(ImageSource source) async {
    XFile? file = await picker.pickImage(source: source);
    if (file != null) {
      return File(file.path);
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PlantcareBloc, PlantcareState>(
      listener: (context, state) {},
      builder: (context, state) {
        print(state.toString());
        if (state is PlantImageSelectedState) {
          return leafSelectedWidget(context, state);
        } else if (state is PlantRequestSentState) {
          return requestSentWidget(context, state);
        } else if (state is PlantResponseRecvState) {
          return responseRecvWidget(context, state);
        }
        return initiaWidget(context, state);
      },
    );
  }

  Widget responseRecvWidget(BuildContext context, PlantcareState state) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: CustomBackButton(),
        leadingWidth: 96.w,
      ),
      body: SingleChildScrollView(
        child: Container(
          width: 1080.w,
          // height: 1920.h,
          margin: EdgeInsets.symmetric(horizontal: 27.w),
          // color: Colors.amber,
          child: Column(
            children: [
              SizedBox(
                height: 16.h,
              ),
              Container(
                padding: EdgeInsets.all(8.w),
                height: 320.w,
                width: 320.w,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(32.r),
                  child: (state.curImage != null)
                      ? Image.file(
                          File(state.curImage!),
                          fit: BoxFit.fitWidth,
                        )
                      : Container(),
                ),
              ),
              Container(
                width: 304.w,
                // color: Colors.amber,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Result',
                      style: TextStyles.of(context).heading5(),
                    ),
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: 'Leaf Name: ',
                            style: TextStyles.of(context).body(
                              weight: FontWeight.bold,
                            ),
                          ),
                          TextSpan(
                            text: state.result!.leaf,
                            style: TextStyles.of(context).body(),
                          ),
                        ],
                      ),
                    ),
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: 'Disease Name: ',
                            style: TextStyles.of(context).body(
                              weight: FontWeight.bold,
                            ),
                          ),
                          TextSpan(
                            text: state.result!.disease,
                            style: TextStyles.of(context).body(),
                          ),
                        ],
                      ),
                    ),
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: 'Cause: ',
                            style: TextStyles.of(context).body(
                              weight: FontWeight.bold,
                            ),
                          ),
                          TextSpan(
                            text: state.result!.cause,
                            style: TextStyles.of(context).body(),
                          ),
                        ],
                      ),
                    ),
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: 'Cure: ',
                            style: TextStyles.of(context).body(
                              weight: FontWeight.bold,
                            ),
                          ),
                          TextSpan(
                            text: state.result!.cure,
                            style: TextStyles.of(context).body(),
                          ),
                        ],
                      ),
                    ),
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: 'Leaf Name: ',
                            style: TextStyles.of(context).body(
                              weight: FontWeight.bold,
                            ),
                          ),
                          TextSpan(
                            text: state.result!.leaf,
                            style: TextStyles.of(context).body(),
                          ),
                        ],
                      ),
                    ),
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: 'Products: ',
                            style: TextStyles.of(context).body(
                              weight: FontWeight.bold,
                            ),
                          ),
                          TextSpan(
                            text: state.result!.products,
                            style: TextStyles.of(context).body(),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 16.h),
                height: 64.h,
                child: Center(
                  child: CustomTextButton(
                    textColor: Colors.white,
                    color: Colors.green.shade200,
                    onPressed: () {},
                    text: 'Select Image',
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 16.h),
                height: 64.h,
                // color: Colors.red,
                child: Center(
                  child: CustomTextButton(
                    textColor: Colors.white,
                    color: Colors.green.shade200,
                    onPressed: () {},
                    text: 'Predict',
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 16.h),
                height: 64.h,
                // color: Colors.red,
                child: Center(
                  child: CustomTextButton(
                    textColor: Colors.white,
                    color: Colors.green,
                    onPressed: () {
                      context.read<PlantcareBloc>().add(ResetPredictionEvent());
                    },
                    text: 'Reset',
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget requestSentWidget(BuildContext context, PlantcareState state) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: CustomBackButton(),
        leadingWidth: 96.w,
      ),
      body: Container(
        width: 1080.w,
        height: 1920.h,
        margin: EdgeInsets.symmetric(horizontal: 27.w),
        // color: Colors.amber,
        child: Column(
          children: [
            SizedBox(
              height: 16.h,
            ),
            Container(
              padding: EdgeInsets.all(8.w),
              height: 320.w,
              width: 320.w,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(32.r),
                child: (state.curImage != null)
                    ? Image.file(
                        File(state.curImage!),
                        fit: BoxFit.fitWidth,
                      )
                    : Container(),
              ),
            ),
            Container(
              // height: 120.h,
              width: 304.w,
              child: Skeletonizer(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Lorem ipsum dolor sittttttr',
                      style: TextStyles.of(context).heading5(),
                    ),
                    Text(
                      'Lorem ipsum dolor sit amet,consecteturre',
                      style: TextStyles.of(context).body(),
                    ),
                    Text(
                      'Lorem ipsum dolor sit amet,consecteturre',
                      style: TextStyles.of(context).body(),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 16.h),
              height: 64.h,
              // color: Colors.red,
              child: Center(
                child: CustomTextButton(
                  textColor: Colors.white,
                  color: Colors.green.shade200,
                  onPressed: () {},
                  text: 'Select Image',
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 16.h),
              height: 64.h,
              // color: Colors.red,
              child: Center(
                child: CustomTextButton(
                  textColor: Colors.white,
                  color: Colors.green.shade200,
                  onPressed: () {
                    // context.read<PlantcareBloc>().add(SendPredictionRequest());
                  },
                  text: 'Predict',
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 16.h),
              height: 64.h,
              // color: Colors.red,
              child: Center(
                child: CustomTextButton(
                  textColor: Colors.white,
                  color: Colors.green,
                  onPressed: () {
                    context.read<PlantcareBloc>().add(ResetPredictionEvent());
                  },
                  text: 'Reset',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget leafSelectedWidget(BuildContext context, PlantcareState state) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: CustomBackButton(),
        leadingWidth: 96.w,
      ),
      body: Container(
        width: 1080.w,
        height: 1920.h,
        margin: EdgeInsets.symmetric(horizontal: 27.w),
        child: Column(
          children: [
            SizedBox(
              height: 16.h,
            ),
            Container(
              padding: EdgeInsets.all(8.w),
              height: 320.w,
              width: 320.w,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(32.r),
                child: (state.curImage != null)
                    ? Image.file(
                        File(state.curImage!),
                        fit: BoxFit.fitWidth,
                      )
                    : Container(),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 16.h),
              height: 64.h,
              // color: Colors.red,
              child: Center(
                child: CustomTextButton(
                  textColor: Colors.white,
                  color: Colors.green,
                  onPressed: () {
                    showModalBottomSheet(
                      context: context,
                      builder: (context) {
                        return Container(
                          height: 196.h,
                          width: 1080.w,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              GestureDetector(
                                onTap: () async {
                                  await getImage(ImageSource.camera).then(
                                    (result) {
                                      if (result != null) {
                                        context.read<PlantcareBloc>().add(
                                              GetImageEvent(image: result),
                                            );
                                      }
                                    },
                                  );
                                  Navigator.pop(context);
                                },
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      padding: EdgeInsets.all(8.h),
                                      height: 96.h,
                                      width: 96.h,
                                      child: ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(16.r),
                                        child: Image.asset(Assets.camera),
                                      ),
                                    ),
                                    Text(
                                      'Camera',
                                      style: TextStyles.of(context).heading6(),
                                    )
                                  ],
                                ),
                              ),
                              GestureDetector(
                                onTap: () async {
                                  await getImage(ImageSource.gallery).then(
                                    (result) {
                                      if (result != null) {
                                        context.read<PlantcareBloc>().add(
                                              GetImageEvent(
                                                image: result,
                                              ),
                                            );
                                      }
                                    },
                                  );
                                  Navigator.pop(context);
                                },
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      padding: EdgeInsets.all(8.h),
                                      height: 96.h,
                                      width: 96.h,
                                      child: ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(16.r),
                                        child: Image.asset(Assets.gallery),
                                      ),
                                    ),
                                    Text(
                                      'Gallery',
                                      style: TextStyles.of(context).heading6(),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    );
                  },
                  text: 'Select Image',
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 16.h),
              height: 64.h,
              // color: Colors.red,
              child: Center(
                child: CustomTextButton(
                  textColor: Colors.white,
                  color: Colors.green,
                  onPressed: () {
                    context.read<PlantcareBloc>().add(SendPredictionRequest());
                  },
                  text: 'Predict',
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 16.h),
              height: 64.h,
              // color: Colors.red,
              child: Center(
                child: CustomTextButton(
                  textColor: Colors.white,
                  color: Colors.green,
                  onPressed: () {
                    context.read<PlantcareBloc>().add(ResetPredictionEvent());
                  },
                  text: 'Reset',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget initiaWidget(BuildContext context, PlantcareState state) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: CustomBackButton(),
        leadingWidth: 96.w,
      ),
      body: Container(
        width: 1080.w,
        height: 1920.h,
        margin: EdgeInsets.symmetric(horizontal: 27.w),
        // color: Colors.amber,
        child: Column(
          children: [
            SizedBox(
              height: 16.h,
            ),
            Container(
              padding: EdgeInsets.all(8.w),
              height: 320.w,
              width: 320.w,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(32.r),
                child: Image.asset(
                  Assets.imagePlaceholder,
                  fit: BoxFit.fitWidth,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 16.h),
              height: 64.h,
              // color: Colors.red,
              child: Center(
                child: CustomTextButton(
                  textColor: Colors.white,
                  color: Colors.green,
                  onPressed: () {
                    showModalBottomSheet(
                      context: context,
                      builder: (context) {
                        return Container(
                          height: 196.h,
                          width: 1080.w,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              GestureDetector(
                                onTap: () async {
                                  await getImage(ImageSource.camera).then(
                                    (result) {
                                      if (result != null) {
                                        context.read<PlantcareBloc>().add(
                                              GetImageEvent(image: result),
                                            );
                                      }
                                    },
                                  );
                                  Navigator.pop(context);
                                },
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      padding: EdgeInsets.all(8.h),
                                      height: 96.h,
                                      width: 96.h,
                                      child: ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(16.r),
                                        child: Image.asset(Assets.camera),
                                      ),
                                    ),
                                    Text(
                                      'Camera',
                                      style: TextStyles.of(context).heading6(),
                                    )
                                  ],
                                ),
                              ),
                              GestureDetector(
                                onTap: () async {
                                  await getImage(ImageSource.gallery).then(
                                    (result) {
                                      if (result != null) {
                                        context.read<PlantcareBloc>().add(
                                              GetImageEvent(image: result),
                                            );
                                      }
                                    },
                                  );
                                  Navigator.pop(context);
                                },
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      padding: EdgeInsets.all(8.h),
                                      height: 96.h,
                                      width: 96.h,
                                      child: ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(16.r),
                                        child: Image.asset(Assets.gallery),
                                      ),
                                    ),
                                    Text(
                                      'Gallery',
                                      style: TextStyles.of(context).heading6(),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    );
                  },
                  text: 'Select Image',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
