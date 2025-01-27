import 'package:agroguru/src/presentation/common/appbar.dart';
import 'package:agroguru/src/utils/styles/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../bloc/plantcare_bloc.dart';

class DetailedResultPage extends StatefulWidget {
  const DetailedResultPage({super.key});

  @override
  State<DetailedResultPage> createState() => _DetailedResultPageState();
}

class _DetailedResultPageState extends State<DetailedResultPage> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PlantcareBloc, PlantcareState>(
      listener: (context, state) {},
      builder: (context, state) {
        if (state.curIndex != null) {
          return Scaffold(
            appBar: customAppBar(),
            body: Container(
              width: 390.w,
              margin: EdgeInsets.symmetric(horizontal: 27.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 8.h),
                    height: 336.w,
                    width: 336.w,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(32.r),
                      child: Image.network(
                        state.history[state.curIndex!].image,
                        fit: BoxFit.fitWidth,
                      ),
                    ),
                  ),
                  Text(
                    'Leaf Name: ${state.history[state.curIndex!].leaf}',
                    style: TextStyles.of(context).heading5(),
                  ),
                  Text(
                    'Disease Name: ${state.history[state.curIndex!].disease}',
                    style: TextStyles.of(context).body(),
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
                          text: state.history[state.curIndex!].leaf,
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
                          text: state.history[state.curIndex!].disease,
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
                          text: state.history[state.curIndex!].cause,
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
                          text: state.history[state.curIndex!].cure,
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
                          text: state.history[state.curIndex!].leaf,
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
                          text: state.history[state.curIndex!].products,
                          style: TextStyles.of(context).body(),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        }
        return Scaffold(
          appBar: customAppBar(),
          body: Container(
            child: const Center(
              child: Text("Something went wrong!!"),
            ),
          ),
        );
      },
    );
  }
}
