// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable
part of 'settings_bloc.dart';

class SettingsState extends Equatable {
  String image;
  SettingsState({
    required this.image,
  });

  @override
  List<Object> get props => [];

  SettingsState copyWith({
    String? image,
  }) {
    return SettingsState(
      image: image ?? this.image,
    );
  }
}