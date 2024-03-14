import 'dart:io';
import 'package:agroguru/src/presentation/feed/feed_page.dart';
import 'package:agroguru/src/presentation/notifications/notifications_page.dart';
import 'package:agroguru/src/presentation/settings/settings_page.dart';
import 'package:agroguru/src/presentation/store/store_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../common/navigator_frame.dart';
import '../home/home_page.dart';
import 'bloc/navigation_bloc.dart';

class NavigationPage extends StatefulWidget {
  const NavigationPage({super.key});

  @override
  State<NavigationPage> createState() => _NavigationPageState();
}

class _NavigationPageState extends State<NavigationPage> {
  List<Widget> pages = [
    const HomePage(),
    const StorePage(),
    const FeedPage(),
    const NotificationsPage(),
    const SettingsPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<NavigationBloc, NavigationState>(
        listener: (context, state) async {
          if (state.index == -1) {
            return await showDialog(
              context: context,
              builder: (context) => AlertDialog(
                title: Text('Are you sure?'),
                content: Text('Do you want to exit the App'),
                actions: <Widget>[
                  TextButton(
                    onPressed: () {
                      BlocProvider.of<NavigationBloc>(context)
                          .add(PushPageEvent(index: 0));
                      Navigator.of(context).pop(false);
                      // BlocProvider.of<NavigationBloc>(context)
                      //     .add(PushPageEvent(index: 0));
                    },
                    child: Text('No'),
                  ),
                  TextButton(
                    onPressed: () {
                      // Navigator.of(context).pop(true);
                      if (Platform.isAndroid) {
                        SystemNavigator.pop();
                      } else if (Platform.isIOS) {
                        exit(0);
                      }
                    },
                    child: Text('Yes'),
                  ),
                ],
              ),
            );
            // print("invalid index");
            // Navigator.pop(context);
            // Navigator.pop(context);
          }
        },
        builder: (context, state) {
          if (state.index == -1) {
            return Scaffold(
              body: Container(
                child: Text('Wrong Page'),
              ),
            );
          }

          return PopScope(
            canPop: false,
            onPopInvoked: (pop) {
              print("Back button Pressed");
              context.read<NavigationBloc>().add(
                    PopPageEvent(),
                  );
            },
            child: NavigatorFrame(
              body: pages[state.index],
              curIndex: state.index,
            ),
          );
        },
      ),
    );
  }
}
