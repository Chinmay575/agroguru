import 'package:agroguru/src/presentation/login/bloc/login_bloc.dart';
import 'package:agroguru/src/presentation/login/views/email_login.dart';
import 'package:agroguru/src/presentation/login/views/phone_login.dart';
import 'package:agroguru/src/utils/constants/enums/login_methods.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late double deviceHeight, deviceWidth;

  @override
  Widget build(BuildContext context) {
    deviceHeight = MediaQuery.of(context).size.height;
    deviceWidth = MediaQuery.of(context).size.width;

    return BlocConsumer<LoginBloc, LoginState>(
      listener: (context, state) {},
      builder: (context, state) {
        if (state.loginType == LoginType.email) {
          return LoginUsingEmail();
        } else if (state.loginType == LoginType.phone) {
          return LoginUsingPhone();
        } else {
          return Scaffold();
        }
      },
    );
  }
}
