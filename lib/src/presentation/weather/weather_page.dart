import 'package:agroguru/src/data/models/forecast.dart';
import 'package:agroguru/src/presentation/common/back_button.dart';
import 'package:agroguru/src/utils/constants/enums/months.dart';
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
  bool today = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: CustomBackButton(),
        leadingWidth: 90.w,
      ),
      body: BlocConsumer<WeatherBloc, WeatherState>(
        listener: (context, state) {},
        builder: (context, state) {
          return SafeArea(
            child: SingleChildScrollView(
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
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              today = true;
                            });
                          },
                          child: Container(
                            width: 168.w,
                            padding: EdgeInsets.only(
                              top: 16.h,
                              bottom: 16.h,
                            ),
                            decoration: BoxDecoration(
                              border: Border(
                                bottom: BorderSide(
                                  width: 2.h,
                                  color: (today)
                                      ? HexColor('#BF131513')
                                      : HexColor('#40131513'),
                                ),
                              ),
                            ),
                            child: Center(
                              child: Text(
                                'Today',
                                style: TextStyles.of(context).heading6(
                                  color: (today)
                                      ? HexColor('#BF131513')
                                      : HexColor('#40131513'),
                                ),
                              ),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              today = false;
                            });
                          },
                          child: Container(
                            width: 168.w,
                            padding: EdgeInsets.only(
                              top: 16.h,
                              bottom: 16.h,
                            ),
                            decoration: BoxDecoration(
                              border: Border(
                                bottom: BorderSide(
                                  width: 2.h,
                                  color: (!today)
                                      ? HexColor('#BF131513')
                                      : HexColor('#40131513'),
                                ),
                              ),
                            ),
                            child: Center(
                              child: Text(
                                'Upcoming',
                                style: TextStyles.of(context).heading6(
                                  color: (!today)
                                      ? HexColor('#BF131513')
                                      : HexColor('#40131513'),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    (today)
                        ? ListView.builder(
                            scrollDirection: Axis.vertical,
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: state.weather!.forecast[0].hourly.length,
                            itemBuilder: (context, index) {
                              ForecastHour f =
                                  state.weather!.forecast[0].hourly[index];
                              return Container(
                                margin: EdgeInsets.all(8.w),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    SizedBox(
                                      width: 80.w,
                                      child: Text(
                                        f.time,
                                        style: TextStyles.of(context).body(),
                                      ),
                                    ),
                                    Image.asset(
                                      f.image,
                                    ),
                                    SizedBox(
                                      width: 64.w,
                                      // color: Colors.amber,
                                      child: Center(
                                        child: Text(
                                          '${f.tempratureC} \u2103',
                                          style: TextStyles.of(context).body(),
                                          overflow: TextOverflow.fade,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 80.w,
                                      // color: Colors.amber,
                                      child: Center(
                                        child: Text(
                                          f.text,
                                          textAlign: TextAlign.center,
                                          style: TextStyles.of(context).body(),
                                          overflow: TextOverflow.fade,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                          )
                        : ListView.builder(
                            itemCount: state.weather!.forecast.length - 1,
                            shrinkWrap: true,
                            itemBuilder: (context, index) {
                              ForecastDay d =
                                  state.weather!.forecast[index + 1];

                              return Container(
                                margin: EdgeInsets.all(8.w),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    SizedBox(
                                      width: 80.w,
                                      child: Text(
                                        '${d.date.split('/').first} ${Months.values[int.parse(d.date.split('/').last)].name}',
                                        style: TextStyles.of(context).body(),
                                      ),
                                    ),
                                    Image.asset(
                                      d.image,
                                    ),
                                    SizedBox(
                                      width: 64.w,
                                      // color: Colors.amber,
                                      child: Center(
                                        child: Text(
                                          '${d.avgTempC} \u2103',
                                          style: TextStyles.of(context).body(),
                                          overflow: TextOverflow.fade,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 80.w,
                                      // color: Colors.amber,
                                      child: Center(
                                        child: Text(
                                          d.text,
                                          textAlign: TextAlign.center,
                                          style: TextStyles.of(context).body(),
                                          overflow: TextOverflow.fade,
                                        ),
                                      ),
                                    ),
                                  ],
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
      ),
    );
  }
}
