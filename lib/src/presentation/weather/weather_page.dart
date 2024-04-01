import 'package:agroguru/src/presentation/common/back_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../utils/styles/text_styles.dart';
import 'bloc/weather_bloc.dart';

class WeatherPage extends StatefulWidget {
  const WeatherPage({super.key});

  @override
  State<WeatherPage> createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: const CustomBackButton(),
        leadingWidth: 90.w,
      ),
      body: BlocConsumer<WeatherBloc, WeatherState>(
        listener: (context, state) {},
        builder: (context, state) {
          return SafeArea(
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 27.w, vertical: 16.h),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(Icons.location_on_outlined),
                      Text(
                        state.weather?.city ?? 'Location',
                        style: TextStyles.of(context).small(),
                      ),
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 16.h),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset(
                          state.weather!.image,
                          height: 128.h,
                          width: 128.h,
                          fit: BoxFit.contain,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              state.weather!.condition,
                              style: TextStyles.of(context).heading6(),
                            ),
                            Text(
                              '${state.weather!.tempratureC} \u2103',
                              style: TextStyles.of(context).heading2(),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: 32.h),
                    child: GridView(
                      shrinkWrap: true,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisExtent: 23.h,
                          mainAxisSpacing: 8.h,
                          crossAxisSpacing: 16.w),
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Humidity',
                              style: TextStyles.of(context).body(),
                            ),
                            Text(
                              '${state.weather!.humidity}%',
                              style: TextStyles.of(context).body(),
                            )
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Wind',
                              style: TextStyles.of(context).body(),
                            ),
                            Text(
                              '${state.weather!.windK}km/h',
                              style: TextStyles.of(context).body(),
                            )
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Precipitation',
                              style: TextStyles.of(context).body(),
                            ),
                            Text(
                              '${state.weather!.rain}%',
                              style: TextStyles.of(context).body(),
                            )
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'UV Index',
                              style: TextStyles.of(context).body(),
                            ),
                            Text(
                              '${state.weather!.uvIndex}',
                              style: TextStyles.of(context).body(),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      Container(
                        width: 168.w,
                        padding: EdgeInsets.only(
                          top: 16.h,
                          bottom: 16.h,
                        ),
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                              width: 2.h,
                              color: HexColor('#BF131513'),
                            ),
                          ),
                        ),
                        child: Center(
                          child: Text(
                            'Today',
                            style: TextStyles.of(context).heading6(
                              color: HexColor('#BF131513'),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        width: 168.w,
                        padding: EdgeInsets.only(
                          top: 16.h,
                          bottom: 16.h,
                        ),
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                              width: 2.h,
                              color: HexColor('#40131513'),
                            ),
                          ),
                        ),
                        child: Center(
                          child: Text(
                            'Upcoming',
                            style: TextStyles.of(context).heading6(
                              color: HexColor('#40131513'),
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
