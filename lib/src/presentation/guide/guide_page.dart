import 'package:agroguru/src/presentation/guide/bloc/plant_detail_bloc.dart';
import 'package:agroguru/src/utils/constants/strings/routes.dart';
import 'package:agroguru/src/utils/constants/strings/strings.dart';
import 'package:agroguru/src/utils/styles/text_styles.dart';
import 'package:flutter/cupertino.dart';
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
          appBar: AppBar(
            automaticallyImplyLeading: false,
            // title: CustomBackButton(),
            leading: const CustomBackButton(),
            leadingWidth: 96.w,
          ),
          body: Container(
            margin: EdgeInsets.symmetric(
              horizontal: 17.w,
              // vertical: 16.h,
            ),
            child: GridView.builder(
              itemCount: state.plantData.length,
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
          ),
        );
      },
    );
  }
}
