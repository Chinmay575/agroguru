// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:agroguru/src/presentation/common/text_button.dart';
import 'package:agroguru/src/presentation/guide/bloc/plant_detail_bloc.dart';
import 'package:agroguru/src/utils/constants/strings/strings.dart';
import 'package:agroguru/src/utils/styles/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../common/back_button.dart';

class PlantDetailPage extends StatefulWidget {
  const PlantDetailPage({
    Key? key,
  }) : super(key: key);

  @override
  State<PlantDetailPage> createState() => _PlantDetailPageState();
}

class _PlantDetailPageState extends State<PlantDetailPage> {
  bool showMore = false;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PlantDetailBloc, PlantDetailState>(
      listener: (context, state) {},
      builder: (context, state) {
        if (state.p == null) {
          return Scaffold();
        }
        return Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            leading: const CustomBackButton(),
            leadingWidth: 96.w,
          ),
          body: SingleChildScrollView(
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 27.w, vertical: 32.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    child: Image.network(
                      state.p?.image ?? Strings.imagePlaceholder,
                      height: 336.w,
                      width: 336.w,
                      fit: BoxFit.contain,
                    ),
                  ),
                  Text(
                    state.p?.name ?? 'Name',
                    style: TextStyles.of(context).heading4(),
                  ),
                  SizedBox(
                    height: 8.h,
                  ),
                  Text(
                    state.p?.desc ?? 'Desc',
                    style: TextStyles.of(context).body(),
                  ),
                  SizedBox(
                    height: 8.h,
                  ),
                  Text(
                    'Commonly known as ${state.p?.commonNames}',
                    style: TextStyles.of(context).body(),
                  ),
                  SizedBox(
                    height: 8.h,
                  ),
                  (showMore)
                      ? Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Scientifically called ${state.p?.scientificNames}',
                              style: TextStyles.of(context).body(),
                            ),
                            SizedBox(
                              height: 8.h,
                            ),
                            Text(
                              'Belongs to the family of ${state.p?.family}',
                              style: TextStyles.of(context).body(),
                            ),
                            SizedBox(
                              height: 8.h,
                            ),
                            Text(
                              'Belongs to ${state.p?.genus} genus',
                              style: TextStyles.of(context).body(),
                            ),
                            SizedBox(
                              height: 8.h,
                            ),
                            Text(
                              'Requires an average rainfall of ${state.p?.avgRainfall} mm',
                              style: TextStyles.of(context).body(),
                            ),
                            SizedBox(
                              height: 8.h,
                            ),
                            Text(
                              'Requires an average temprature of ${state.p?.avgTemp}  \u2103',
                              style: TextStyles.of(context).body(),
                            ),
                            SizedBox(
                              height: 8.h,
                            ),
                            Text(
                              'Harvested in the months of ${state.p?.harvestMonth}',
                              style: TextStyles.of(context).body(),
                            ),
                            SizedBox(
                              height: 8.h,
                            ),
                            Text(
                              'Takes ${state.p?.harvestTime} days to grow',
                              style: TextStyles.of(context).body(),
                            ),
                            SizedBox(
                              height: 8.h,
                            ),
                          ],
                        )
                      : Container(),
                  Center(
                    child: TextButton(
                      onPressed: () {
                        setState(() {
                          showMore = !showMore;
                        });
                      },
                      child: (showMore)
                          ? Text(
                              'Read Less',
                              style: TextStyles.of(context).small(),
                            )
                          : Text(
                              'Read More',
                              style: TextStyles.of(context).small(),
                            ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 16.h),
                    child: Divider(
                      height: 1.h,
                      color: Colors.grey.shade300,
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Learn how to plant:',
                        style: TextStyles.of(context).heading6(),
                      ),
                      SizedBox(
                        height: 16.h,
                      ),
                      Stack(
                        children: [
                          Container(
                            height: 256.h,
                            width: 336.w,
                            color: Colors.amber,
                            child: Image.network(
                              '${state.p?.videoThumbnail}',
                              fit: BoxFit.fitWidth,
                            ),
                          ),
                          Positioned(
                            height: 256.h,
                            width: 336.w,
                            child: GestureDetector(
                              onTap: () async {
                                Uri url = Uri.parse(state.p!.plantingVideo);
                                await launchUrl(url);
                              },
                              child: Center(
                                child: Image.network(
                                  Strings.youtube,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 32.h,
                  ),
                  Center(
                    child: CustomTextButton(
                      onPressed: () async {
                        Uri url = Uri.parse(state.p!.seedLink);
                        await launchUrl(url);
                      },
                      text: 'Buy Seeds',
                      color: Colors.green,
                      textColor: Colors.white,
                    ),
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
