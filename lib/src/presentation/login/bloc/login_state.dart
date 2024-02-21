// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'login_bloc.dart';

class LoginState {
  LoginType loginType = LoginType.email;
  LoginState({
    required this.loginType,
  });

  LoginState copyWith({
    LoginType? method,
  }) {
    return LoginState(
      loginType: method ?? this.loginType,
    );
  }
}
