import 'package:agroguru/src/presentation/common/text_field.dart';
import 'package:agroguru/src/presentation/weather/widgets/weather_widget.dart';
import 'package:agroguru/src/utils/constants/strings/strings.dart';
import 'package:agroguru/src/utils/styles/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(390.w, 96.h),
        child: AppBar(
          automaticallyImplyLeading: false,
          flexibleSpace: SafeArea(
            child: Container(
              height: 64.h,
              width: 336.w,
              margin: EdgeInsets.symmetric(vertical: 16.h, horizontal: 27.w),
              child: CustomTextField(
                hintText: 'Search for Crop',
                onChanged: (val) {},
              ),
            ),
          ),
          toolbarHeight: 64.h,
          titleSpacing: 0.h,
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 27.w, vertical: 16.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Welcome Back!',
                style: TextStyles.heading4(),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 16.h),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Weather',
                          style: TextStyles.heading5(),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.arrow_forward),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 8.h,
                    ),
                    const WeatherWidget(),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 16.h),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Services',
                          style: TextStyles.heading5(),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.arrow_forward),
                        )
                      ],
                    ),
                    SizedBox(height: 8.h),
                    Container(
                      // color: Colors.green,
                      child: GridView(
                        shrinkWrap: true,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          mainAxisExtent: 128.h,
                        ),
                        physics: const NeverScrollableScrollPhysics(),
                        children: [
                          Container(
                            padding: EdgeInsets.all(8.h),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Container(
                                  height: 64.h,
                                  width: 64.w,
                                  padding: EdgeInsets.all(8.h),
                                  // color: Colors.amber,
                                  child: Image.network(
                                    Strings.leaf,
                                    fit: BoxFit.contain,
                                  ),
                                ),
                                Text('Plant Care',style: TextStyles.body(),)
                              ],
                            ),
                          ),
                          const Icon(Icons.medical_services_sharp),
                          const Icon(Icons.medical_services_sharp),
                          // const Icon(Icons.medical_services_sharp),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
