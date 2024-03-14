import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hexcolor/hexcolor.dart';

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
      body: BlocConsumer<WeatherBloc, WeatherState>(
        listener: (context, state) {},
        builder: (context, state) {
          return SafeArea(
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 27.w, vertical: 16.h),
              child: Column(
                children: [
                  Container(
                    height: 320.h,
                    width: 390.w,
                    decoration: BoxDecoration(
                      color: HexColor('#D9D9D9'),
                      borderRadius: BorderRadius.circular(32.r),
                    ),
                    child: Column(
                      children: [
                        Image.asset(state.weather!.image),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
