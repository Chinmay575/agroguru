// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'login_bloc.dart';

abstract class LoginEvent {}

class ChangeLoginMethod extends LoginEvent {
  LoginType loginType;
  ChangeLoginMethod({
    required this.loginType,
  });
}

class LoginUsingGoogle extends LoginEvent {}
