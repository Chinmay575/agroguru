// ignore_for_file: must_be_immutable

import 'package:agroguru/src/presentation/home/home_page.dart';
import 'package:agroguru/src/presentation/store/store_page.dart';
import 'package:agroguru/src/utils/styles/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'bloc/navigation_bloc.dart';

class NavigatorFrame extends StatefulWidget {
  int curIndex;
  NavigatorFrame({
    Key? key,
    required this.curIndex,
  }) : super(key: key);

  @override
  State<NavigatorFrame> createState() => _NavigatorFrameState();
}

class _NavigatorFrameState extends State<NavigatorFrame> {
  List<Widget> actions(int curIndex) => [
        navigatorButton(
          icon: Icons.home,
          name: AppLocalizations.of(context)!.home,
          onTap: () {
            pageController.animateToPage(
              0,
              curve: Curves.linear,
              duration: Durations.medium2,
            );
            BlocProvider.of<NavigationBloc>(context).add(
              PushPageEvent(index: 0),
            );
          },
          isActive: (curIndex == 0),
        ),
        navigatorButton(
          icon: Icons.storefront,
          name: AppLocalizations.of(context)!.store,
          onTap: () {
            pageController.animateToPage(
              1,
              curve: Curves.linear,
              duration: Durations.medium2,
            );
            BlocProvider.of<NavigationBloc>(context).add(
              PushPageEvent(index: 1),
            );
          },
          isActive: (curIndex == 1),
        ),
      ];

  Widget navigatorButton({
    required IconData icon,
    required String name,
    required void Function() onTap,
    required bool isActive,
  }) {
    return GestureDetector(
      onTap: (isActive) ? () {} : onTap,
      child: Container(
        height: 40.h,
        margin: EdgeInsets.symmetric(vertical: 24.h),
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        decoration: BoxDecoration(
          color: (isActive) ? HexColor('#4021A366') : Colors.transparent,
          borderRadius: BorderRadius.circular(32.r),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.all(8.h),
              child: Icon(
                icon,
                size: 20.h,
                color: (isActive) ? HexColor('#21A366') : Theme.of(context).iconTheme.color,
              ),
            ),
            Text(
              name,
              style: TextStyles.of(context).body(
                color: (isActive) ? HexColor('#21A366') : Theme.of(context).iconTheme.color,
              ),
            ),
          ],
        ),
      ),
    );
  }

  PageController pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        onPageChanged: (value) {
          BlocProvider.of<NavigationBloc>(context).add(
            PushPageEvent(index: value),
          );
        },
        controller: pageController,
        children: [
          const HomePage(),
          StorePage(),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        elevation: 8,
        height: 88.h,
        surfaceTintColor: Colors.white,
        padding: EdgeInsets.zero,
        child: Container(
          width: 390.w,
          decoration: BoxDecoration(
            border: Border(
              top: BorderSide(
                width: 3.w,
                color: HexColor('#131513BF'),
              ),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: actions(widget.curIndex),
          ),
        ),
      ),
      // bottomNavigationBar: BottomNavigationBar(
      //   items: [
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.home_filled),
      //       label: 'Home',
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.storefront_rounded),
      //       label: 'Store',
      //     ),
      //   ],
      // ),
    );
  }
}
