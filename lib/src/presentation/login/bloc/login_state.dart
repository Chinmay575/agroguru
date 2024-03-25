// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'login_bloc.dart';

class LoginState {
  LoginType loginType = LoginType.password;
  AuthStatus status = AuthStatus.notStarted;
  LoginState({
    required this.loginType,
    required this.status,
  });

  LoginState copyWith({
    LoginType? loginType,
    AuthStatus? status,
  }) {
    return LoginState(
      loginType: loginType ?? this.loginType,
      status: status ?? this.status,
    );
  }
}
