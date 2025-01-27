import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'navigator_frame.dart';
import 'bloc/navigation_bloc.dart';

class NavigationPage extends StatefulWidget {
  const NavigationPage({super.key});

  @override
  State<NavigationPage> createState() => _NavigationPageState();
}

class _NavigationPageState extends State<NavigationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<NavigationBloc, NavigationState>(
        listener: (context, state) async {
          if (state.index == -1) {
            return await showDialog(
              context: context,
              builder: (context) => AlertDialog(
                title: const Text('Are you sure?'),
                content: const Text('Do you want to exit the App'),
                actions: <Widget>[
                  TextButton(
                    onPressed: () {
                      BlocProvider.of<NavigationBloc>(context)
                          .add(PushPageEvent(index: 0));
                      Navigator.of(context).pop(false);
                    },
                    child: const Text('No'),
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
                    child: const Text('Yes'),
                  ),
                ],
              ),
            );
          }
        },
        builder: (context, state) {
          if (state.index == -1) {
            return Scaffold(
              body: Container(
                child: const Text('Wrong Page'),
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
              curIndex: state.index,
            ),
          );
        },
      ),
    );
  }
}
