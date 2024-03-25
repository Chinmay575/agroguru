// ignore_for_file: must_be_immutable

part of 'register_bloc.dart';

class RegisterEvent extends Equatable {
  const RegisterEvent();

  @override
  List<Object> get props => [];
}

class RegisterUsingEmailEvent extends RegisterEvent {
  String email, password;
  RegisterUsingEmailEvent(this.email, this.password);
}
