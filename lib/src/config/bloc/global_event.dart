// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable
part of 'global_bloc.dart';

class GlobalEvent extends Equatable {
  const GlobalEvent();

  @override
  List<Object> get props => [];
}

class GetSavedPreferences extends GlobalEvent {}

class ChangeThemeEvent extends GlobalEvent {
  ThemeMode mode;
  ChangeThemeEvent({
    required this.mode,
  });
}

class ChangeLanguageEvent extends GlobalEvent {
  Languages lang;
  ChangeLanguageEvent({
    required this.lang,
  });
}
