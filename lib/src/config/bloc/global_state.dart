// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable

part of 'global_bloc.dart';

class GlobalState extends Equatable {
  ThemeMode mode;
  Languages appLanguage;

  Locale get locale => Locale(appLanguage.toString().split('.').last);

  GlobalState({
    required this.mode,
    required this.appLanguage,
  });

  GlobalState copyWith({
    ThemeMode? mode,
    Languages? appLanguage,
  }) {
    return GlobalState(
      mode: mode ?? this.mode,
      appLanguage: appLanguage ?? this.appLanguage,
    );
  }

  @override
  List<Object> get props => [mode, appLanguage];
}
