import 'package:agroguru/src/presentation/common/text_button.dart';
import 'package:agroguru/src/utils/constants/strings/assets.dart';
import 'package:agroguru/src/utils/constants/strings/routes.dart';
// import 'package:agroguru/src/utils/constants/strings/strings.dart';
import 'package:agroguru/src/utils/styles/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../common/back_button.dart';
import '../bloc/plantcare_bloc.dart';

class PlantCareHomePage extends StatefulWidget {
  const PlantCareHomePage({super.key});

  @override
  State<PlantCareHomePage> createState() => _PlantCareHomePageState();
}

class _PlantCareHomePageState extends State<PlantCareHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: CustomBackButton(),
        leadingWidth: 96.w,
      ),
      body: SingleChildScrollView(
        child: Container(
          width: 1080.w,
          // color: Colors.amber,
          margin: EdgeInsets.symmetric(
            horizontal: 27.w,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Leaf Disease Detection',
                style: TextStyles.of(context).heading6(),
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
                      Navigator.pushNamed(context, Routes.leafInput);
                    },
                    text: 'Start',
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 16.h),
                child: Divider(
                  height: 1.h,
                  color: HexColor('#1315130D'),
                ),
              ),
              // Text(
              //   'How to Use',
              //   style: TextStyles.of(context).heading6(),
              // ),
              // Container(
              //   margin: EdgeInsets.symmetric(vertical: 16.h),
              //   height: 64.h,
              //   // color: Colors.red,
              //   child: Center(
              //     child: CustomTextButton(
              //       textColor: Colors.white,
              //       color: Colors.green,
              //       onPressed: () {
              //         Navigator.pushNamed(context, Routes.tutorial);
              //       },
              //       text: 'Start Tutorial',
              //     ),
              //   ),
              // ),
              // Padding(
              //   padding: EdgeInsets.symmetric(vertical: 16.h),
              //   child: Divider(
              //     height: 1.h,
              //     color: HexColor('#1315130D'),
              //   ),
              // ),
              Text(
                'History',
                style: TextStyles.of(context).heading6(),
              ),
              SizedBox(
                height: 16.h,
              ),
              BlocBuilder<PlantcareBloc, PlantcareState>(
                builder: (context, state) {
                  if (state is HistoryLoadingState) {
                    return GridView.builder(
                      shrinkWrap: true,
                      itemCount: 6,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        mainAxisExtent: 144.h,
                        mainAxisSpacing: 8.w,
                        crossAxisSpacing: 8.w,
                      ),
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            Container(
                              padding: EdgeInsets.all(8.w),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(16.r),
                                child: Image.asset(Assets.imagePlaceholder),
                              ),
                            ),
                            Text(
                              'Name',
                              style: TextStyles.of(context).body(),
                            ),
                          ],
                        );
                      },
                    );
                  }

                  return GridView.builder(
                    shrinkWrap: true,
                    itemCount: state.history.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      mainAxisExtent: 144.h,
                      mainAxisSpacing: 8.w,
                      crossAxisSpacing: 8.w,
                    ),
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, Routes.detailedResult);
                          context
                              .read<PlantcareBloc>()
                              .add(GetCurrentIndexEvent(index: index));
                        },
                        child: Column(
                          children: [
                            Container(
                              padding: EdgeInsets.all(8.w),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(16.r),
                                child:
                                    Image.network(state.history[index].image),
                              ),
                            ),
                            Text(
                              state.history[index].leaf,
                              style: TextStyles.of(context).body(),
                            ),
                          ],
                        ),
                      );
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
