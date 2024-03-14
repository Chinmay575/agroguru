// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable
part of 'profile_bloc.dart';

class ProfileState extends Equatable {
  UserAccount acc;
  ProfileState({
    required this.acc,
  });

  @override
  List<Object> get props => [];
}

class ProfileInitial extends ProfileState {
  ProfileInitial(UserAccount acc) : super(acc: acc);
}
