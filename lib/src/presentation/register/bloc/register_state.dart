// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable
part of 'register_bloc.dart';

class RegisterState extends Equatable {
  AuthStatus status = AuthStatus.notStarted;
  RegisterState({
    required this.status,
  });

  @override
  List<Object> get props => [];

  RegisterState copyWith({
    AuthStatus? status,
  }) {
    return RegisterState(
      status: status ?? this.status,
    );
  }
}
