// ignore_for_file: must_be_immutable

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hexcolor/hexcolor.dart';

import '../navigation/bloc/navigation_bloc.dart';

class NavigatorFrame extends StatefulWidget {
  Widget body;
  int curIndex;
  NavigatorFrame({
    Key? key,
    required this.curIndex,
    required this.body,
  }) : super(key: key);

  @override
  State<NavigatorFrame> createState() => _NavigatorFrameState();
}

class _NavigatorFrameState extends State<NavigatorFrame> {
  List<Widget> actions(int curIndex) => [
        IconButton(
          onPressed: () {
            BlocProvider.of<NavigationBloc>(context).add(
              PushPageEvent(index: 0),
            );
            // BlocProvider.of<WeatherBloc>(context).add(WeatherInitialEvent());
          },
          icon: Icon(
            CupertinoIcons.home,
            color: (curIndex == 0) ? Colors.green : Colors.black,
          ),
        ),
        IconButton(
          onPressed: (curIndex == 1)
              ? () {}
              : () {
                  BlocProvider.of<NavigationBloc>(context).add(
                    PushPageEvent(
                      index: 1,
                    ),
                  );
                },
          icon: Icon(
            CupertinoIcons.archivebox,
            color: (curIndex == 1) ? Colors.green : Colors.black,
          ),
        ),
        IconButton(
          onPressed: (curIndex == 2)
              ? () {}
              : () {
                  BlocProvider.of<NavigationBloc>(context).add(
                    PushPageEvent(
                      index: 2,
                    ),
                  );
                },
          icon: Icon(
            CupertinoIcons.doc,
            color: (curIndex == 2) ? Colors.green : Colors.black,
          ),
        ),
        IconButton(
          onPressed: () {
            BlocProvider.of<NavigationBloc>(context).add(
              PushPageEvent(
                index: 3,
              ),
            );
            // BlocProvider.of<ProfileBloc>(context).add(ShowProfile());
          },
          icon: Icon(
            CupertinoIcons.bell,
            color: (curIndex == 3) ? Colors.green : Colors.black,
          ),
        ),
        IconButton(
          onPressed: () {
            BlocProvider.of<NavigationBloc>(context).add(
              PushPageEvent(
                index: 4,
              ),
            );
            // BlocProvider.of<ProfileBloc>(context).add(ShowProfile());
          },
          icon: Icon(
            CupertinoIcons.settings,
            color: (curIndex == 4) ? Colors.green : Colors.black,
          ),
        ),
      ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: widget.body,
      bottomNavigationBar: BottomAppBar(
        elevation: 8,
        // height: 64.h,
        shadowColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
        color: Colors.transparent,
        child: Container(
          height: 64.h,
          width: 336.w,
          decoration: BoxDecoration(
            color: HexColor('#1315131A'),
            // color: Colors.transparent,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: actions(widget.curIndex),
          ),
        ),
      ),
    );
  }
}
