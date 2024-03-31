// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable

part of 'profile_bloc.dart';

class ProfileState extends Equatable {
  UserAccount? acc;
  LoginType? type;
  ProfileState({
    this.acc,
    this.type,
  });

  ProfileState copyWith({
    UserAccount? acc,
    LoginType? type,
  }) {
    return ProfileState(
      acc: acc ?? this.acc,
      type: type ?? this.type,
    );
  }

  @override
  List<Object> get props => [acc!, type!];
}

class ProfileInitial extends ProfileState {
  ProfileInitial() : super();
}
