import 'package:agroguru/src/presentation/common/text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../utils/constants/strings/assets.dart';
import '../../utils/constants/strings/routes.dart';
import '../../utils/constants/strings/strings.dart';
import '../../utils/styles/text_styles.dart';
import '../profile/bloc/profile_bloc.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
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
                              style: TextStyles.of(context).body(),
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
                                (state.acc?.displayPic ?? Assets.avatar),
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 16.w,
                          ),
                          Text(
                            state.acc?.name ?? 'User',
                            style: TextStyles.of(context).body(),
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
                child: CustomTextField(
                  hintText: 'Search',
                  width: 336.w,
                ),
              ),
              forceMaterialTransparency: true,
              centerTitle: true,
              elevation: 0,
              shadowColor: Colors.white,
            ),
            SliverToBoxAdapter(
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 27.w),
                child: ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: 20,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text('data'),
                      onTap: () {},
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
