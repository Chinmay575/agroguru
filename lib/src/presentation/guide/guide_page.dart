import 'package:agroguru/src/presentation/common/text_field.dart';
import 'package:agroguru/src/presentation/guide/bloc/plant_detail_bloc.dart';
import 'package:agroguru/src/utils/constants/strings/routes.dart';
import 'package:agroguru/src/utils/constants/strings/strings.dart';
import 'package:agroguru/src/utils/styles/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../common/back_button.dart';
import 'bloc/guide_bloc.dart';

class GuidePage extends StatefulWidget {
  const GuidePage({super.key});

  @override
  State<GuidePage> createState() => _GuidePageState();
}

class _GuidePageState extends State<GuidePage> {
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GuideBloc, GuideState>(
      listener: (context, state) {},
      builder: (context, state) {
        if (state is GuideLoadingState) {
          return Scaffold(
            appBar: AppBar(
              automaticallyImplyLeading: false,
              // title: CustomBackButton(),
              leading: const CustomBackButton(),
              leadingWidth: 96.w,
            ),
            body: Container(
              margin: EdgeInsets.symmetric(
                horizontal: 17.w,
              ),
              child: Skeletonizer(
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 10.w,
                    mainAxisExtent: 216.h,
                    crossAxisSpacing: 10.w,
                  ),
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return Container(
                      padding: EdgeInsets.all(8.w),
                      // color: Colors.amber,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(16.r),
                            child: Image.network(
                              Strings.imagePlaceholder,
                            ),
                          ),
                          Text(
                            'Some Random text',
                            overflow: TextOverflow.ellipsis,
                            style: TextStyles.body(),
                          )
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),
          );
        }
        return Scaffold(
          appBar: PreferredSize(
            preferredSize: Size(390.w, 128.h),
            child: AppBar(
              // backgroundColor: Colors.amber,
              automaticallyImplyLeading: false,
              // title: CustomBackButton(),
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CustomBackButton(),
                  Center(
                    child: CustomTextField(
                      hintText: 'Search',
                      controller: controller,
                      onEditingComplete: () {},
                    ),
                  ),
                ],
              ),
              toolbarHeight: 128.h,
              leadingWidth: 96.w,

              // bottom: CustomTextField(
              //   hintText: 'Search',
              //   controller: controller,
              //   onEditingComplete: () {},
              // ),
            ),
          ),
          body: SingleChildScrollView(
            child: Container(
              height: 250.h * (state.plantData.length / 2),
              margin: EdgeInsets.symmetric(
                horizontal: 17.w,
                vertical: 16.h,
              ),
              child: Column(
                children: [
                  GridView.builder(
                    shrinkWrap: true,
                    itemCount: state.plantData.length,
                    physics: NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 10.w,
                      mainAxisExtent: 216.h,
                      crossAxisSpacing: 10.w,
                    ),
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, Routes.plantDetail);
                          BlocProvider.of<PlantDetailBloc>(context).add(
                            GetPlantDetailEvent(
                              state.plantData[index],
                            ),
                          );
                        },
                        child: Container(
                          padding: EdgeInsets.all(8.w),
                          // color: Colors.amber,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(16.r),
                                child: Image.network(
                                  height: 160.h,
                                  width: 160.h,
                                  state.plantData[index].image,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Text(
                                state.plantData[index].name,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyles.body(),
                              )
                            ],
                          ),
                        ),
                      );
                    },
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
