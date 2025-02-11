import 'package:agroguru/src/utils/constants/strings/routes.dart';
import 'package:agroguru/src/utils/styles/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeletonizer/skeletonizer.dart';

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
          if (state is WeatherErroredState) {
            return Container(
              height: 72.h,
              width: 336.w,
              margin: EdgeInsets.symmetric(vertical: 16.h),
              child: Center(
                child: Text(
                  "Something went wrong",
                  style: TextStyles.of(context).body(),
                ),
              ),
            );
          } else if (state is WeatherLoadedState) {
            return Container(
              height: 72.h,
              width: 336.w,
              margin: EdgeInsets.symmetric(vertical: 16.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    height: 64.h,
                    width: 64.h,
                    child: Image.asset(
                      state.weather!.image,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        (state.weather!.condition.length > 20)
                            ? '${state.weather!.condition.substring(0, 17)}...'
                            : (state.weather?.condition ?? ''),
                        style: TextStyles.of(context).small(),
                      ),
                      Text(
                        '${state.weather!.tempratureC} \u2103',
                        style: TextStyles.of(context).heading4(),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.location_on_outlined,
                        size: 16.h,
                      ),
                      Text(
                        state.weather!.city,
                        style: TextStyles.of(context).small(),
                      ),
                    ],
                  ),
                ],
              ),
            );
          }
          return const Skeletonizer(
            enabled: true,
            ignoreContainers: true,
            child: Card(
              child: ListTile(
                title: Text('Item number as title'),
                subtitle: Text('Subtitle here'),
                trailing: Icon(Icons.ac_unit),
              ),
            ),
          );
        },
      ),
    );
  }
}
