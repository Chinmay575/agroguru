import 'package:agroguru/src/utils/constants/enums/supported_languages.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'global_event.dart';
part 'global_state.dart';

class GlobalBloc extends Bloc<GlobalEvent, GlobalState> {
  GlobalBloc()
      : super(
          GlobalState(
            mode: ThemeMode.system,
            appLanguage: Languages.en,
          ),
        ) {
    on<ChangeThemeEvent>(
      (event, emit) {
        emit(
          state.copyWith(mode: event.mode),
        );
      },
    );
    on<ChangeLanguageEvent>(
      (event, emit) {
        emit(
          state.copyWith(appLanguage: event.lang),
        );
      },
    );
  }
}
