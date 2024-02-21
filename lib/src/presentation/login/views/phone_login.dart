// ignore_for_file: must_be_immutable

import 'package:agroguru/src/presentation/common/text_field.dart';
import 'package:agroguru/src/presentation/login/bloc/login_bloc.dart';
import 'package:agroguru/src/presentation/login/widgets/greetings.dart';
import 'package:agroguru/src/presentation/login/widgets/login_button.dart';
import 'package:agroguru/src/utils/constants/enums/login_methods.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class LoginUsingPhone extends StatelessWidget {
  LoginUsingPhone({super.key});

  late double deviceHeight, deviceWidth;

  @override
  Widget build(BuildContext context) {
    deviceHeight = MediaQuery.of(context).size.height;
    deviceWidth = MediaQuery.of(context).size.width;
    return BlocConsumer<LoginBloc, LoginState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          resizeToAvoidBottomInset: false,
          body: SafeArea(
            child: Container(
              padding: EdgeInsets.only(
                top: deviceHeight * 0.15,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: deviceHeight * 0.02,
                  ),
                  Greetings(),
                  SizedBox(
                    height: deviceHeight * 0.05,
                  ),
                  CustomTextField(
                    onChanged: (val) {},
                    hintText: 'Phone',
                  ),
                  CustomTextField(
                    onChanged: (val) {},
                    hintText: 'OTP',
                  ),
                  LoginButton(
                    text: "Login",
                    onPressed: () async {},
                    color: Colors.blue,
                    icon: Icons.phone,
                  ),
                  Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: deviceWidth * 0.05),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          width: deviceWidth * 0.35,
                          child: Divider(
                            height: 2,
                            thickness: 2,
                            color: Colors.grey.shade300,
                          ),
                        ),
                        Text(
                          'OR',
                          style: TextStyle(
                            color: Colors.grey.shade400,
                          ),
                        ),
                        Container(
                          width: deviceWidth * 0.35,
                          child: Divider(
                            height: 2,
                            thickness: 2,
                            color: Colors.grey.shade300,
                          ),
                        ),
                      ],
                    ),
                  ),
                  LoginButton(
                    text: "Login with Google",
                    onPressed: () async {},
                    color: Colors.red,
                    icon: MdiIcons.google,
                  ),
                  LoginButton(
                    text: "Login with Email",
                    onPressed: () async {
                      context.read<LoginBloc>().add(
                            ChangeLoginMethod(loginType: LoginType.email),
                          );
                    },
                    color: Colors.green,
                    icon: MdiIcons.email,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
