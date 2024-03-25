// ignore_for_file: must_be_immutable

part of 'profile_bloc.dart';

class ProfileEvent extends Equatable {
  const ProfileEvent();

  @override
  List<Object> get props => [];
}

class ProfileInitialEvent extends ProfileEvent {}

class UpdateProfileEvent extends ProfileEvent {
  UserAccount user;
  UpdateProfileEvent(this.user);
}

class ProfileLogOutEvent extends ProfileEvent {}
