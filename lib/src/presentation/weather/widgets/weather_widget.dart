import 'package:agroguru/src/utils/constants/strings/routes.dart';
import 'package:agroguru/src/utils/styles/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hexcolor/hexcolor.dart';

import '../bloc/weather_bloc.dart';

class WeatherWidget extends StatefulWidget {
  const WeatherWidget({super.key});

  @override
  State<WeatherWidget> createState() => _WeatherWidgetState();
}

class _WeatherWidgetState extends State<WeatherWidget> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, Routes.weatherInfo);
      },
      child: BlocConsumer<WeatherBloc, WeatherState>(
        listener: (context, state) {},
        builder: (context, state) {
          // print(state.toString());
          if (state is WeatherErroredState) {
            return Container(
              height: 128.h,
              decoration: BoxDecoration(
                color: HexColor('#1315131A'),
                borderRadius: BorderRadius.circular(32.r),
              ),
              child: const Text("Something went wrong"),
            );
          } else if (state is WeatherLoadedState) {
            return Container(
              height: 192.h,
              decoration: BoxDecoration(
                color: HexColor('#1315131A'),
                borderRadius: BorderRadius.circular(32.r),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    // width: 192.w,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Image.asset(state.weather!.image),
                        Text(
                          state.weather?.condition ?? '',
                          style: TextStyles.heading6(),
                        ),
                        Text(
                          '${state.weather!.tempratureC} \u2103',
                          style: TextStyles.heading5(),
                        ),
                        Row(
                          children: [
                            const Icon(Icons.location_on_outlined),
                            Text(
                              state.weather!.city,
                              style: TextStyles.body(),
                            ),
                          ],
                        ),
                        Text(
                          'Today',
                          style: TextStyles.small(),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          } else if (state is WeatherLoadingState ||
              state is WeatherInitialState) {
            return Container(
              height: 128.h,
              decoration: BoxDecoration(
                color: HexColor('#1315131A'),
                borderRadius: BorderRadius.circular(32.r),
              ),
              child: const Center(
                child: CircularProgressIndicator(),
              ),
            );
          }
          return Container(
            height: 128.h,
            decoration: BoxDecoration(
              color: HexColor('#1315131A'),
              borderRadius: BorderRadius.circular(32.r),
            ),
          );
        },
      ),
    );
  }
}
