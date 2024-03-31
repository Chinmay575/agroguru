import 'package:agroguru/src/presentation/home/widgets/service_tile.dart';
import 'package:agroguru/src/presentation/profile/bloc/profile_bloc.dart';
import 'package:agroguru/src/presentation/weather/widgets/weather_widget.dart';
import 'package:agroguru/src/utils/constants/strings/routes.dart';
import 'package:agroguru/src/utils/constants/strings/strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../utils/styles/text_styles.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    print('Init called');
    BlocProvider.of<ProfileBloc>(context).add(ProfileInitialEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(390.w, 64.h),
        child: BlocConsumer<ProfileBloc, ProfileState>(
          listener: (context, state) {},
          builder: (context, state) {
            print(state.acc?.toMap());
            if (state is ProfileInitial) {
              return AppBar(
                automaticallyImplyLeading: false,
                title: Container(
                  height: 64.h,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, Routes.profile);
                        },
                        child: Row(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(32.r),
                              child: CircleAvatar(
                                child: Image.network(
                                  height: 48.w,
                                  width: 48.w,
                                  Strings.avatar,
                                  fit: BoxFit.contain,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 16.w,
                            ),
                            Text(
                              'User',
                              style: TextStyles.body(),
                            ),
                          ],
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          Navigator.pushNamed(context, Routes.settings);
                        },
                        padding: EdgeInsets.zero,
                        icon: Icon(Icons.settings),
                      ),
                    ],
                  ),
                ),
              );
            }
            return AppBar(
              automaticallyImplyLeading: false,
              title: Container(
                height: 64.h,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, Routes.profile);
                      },
                      child: Row(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(32.r),
                            child: CircleAvatar(
                              child: Image.network(
                                height: 48.w,
                                width: 48.w,
                                (state.acc?.displayPic ?? Strings.avatar),
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 16.w,
                          ),
                          Text(
                            state.acc?.name ?? 'User',
                            style: TextStyles.body(),
                          ),
                        ],
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        Navigator.pushNamed(context, Routes.settings);
                      },
                      padding: EdgeInsets.zero,
                      icon: Icon(Icons.settings),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
      body: SafeArea(
        child: CustomScrollView(
          physics: const NeverScrollableScrollPhysics(),
          slivers: [
            SliverAppBar(
              floating: true,
              primary: true,
              automaticallyImplyLeading: false,
              backgroundColor: Colors.transparent,
              toolbarHeight: 96.h,
              foregroundColor: Colors.transparent,
              flexibleSpace: Center(
                child: Container(
                  height: 64.h,
                  width: 390.w,
                  margin: EdgeInsets.symmetric(horizontal: 27.w),
                  padding:
                      EdgeInsets.symmetric(horizontal: 32.w, vertical: 20.w),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    borderRadius: BorderRadius.circular(64.r),
                  ),
                  child: Text(
                    'Search',
                    style: TextStyles.body(
                      color: HexColor('#80131513'),
                    ),
                  ),
                ),
              ),
              // title:
              forceMaterialTransparency: true,
              centerTitle: true,
              elevation: 0,
              shadowColor: Colors.white,
            ),
            SliverToBoxAdapter(
              child: Container(
                margin: EdgeInsets.symmetric(
                  horizontal: 27.w,
                  vertical: 32.h,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const WeatherWidget(),
                    ServicesTile(
                      onTap: () {
                        Navigator.pushNamed(context, Routes.plantCareHome);
                      },
                      image: Strings.leaf,
                      title: 'Plant Care',
                    ),
                    ServicesTile(
                      onTap: () {
                        Navigator.pushNamed(context, Routes.schemes);
                      },
                      image: Strings.schemes,
                      title: 'Government Schemes',
                    ),
                    ServicesTile(
                      onTap: () {
                        Navigator.pushNamed(context, Routes.guide);
                      },
                      image: Strings.guide,
                      title: 'Agriculture Guide',
                    ),
                    ServicesTile(
                      onTap: () {
                        Navigator.pushNamed(context, Routes.assistant);
                      },
                      image: Strings.aiIcon,
                      title: 'AI Assistant',
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
