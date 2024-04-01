import 'package:agroguru/src/domain/repository/auth_repository.dart';
import 'package:agroguru/src/domain/repository/user_repository.dart';
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
    on<GetSavedPreferences>(
      (event, emit) {
        print('Fetching theme and language');
        String theme = 'system';
        String language = 'en';

        if (AuthRepository.curUser != null) {
          print('Preferences fetched');
          theme = AuthRepository.curUser!.theme;
          language = AuthRepository.curUser!.language;
        }

        emit(
          state.copyWith(
            appLanguage: Languages.values
                .where((element) => element.name == language)
                .first,
            mode: ThemeMode.values
                .where((element) => element.name == theme)
                .first,
          ),
        );
      },
    );

    on<ChangeThemeEvent>(
      (event, emit) async {
        AuthRepository.curUser = AuthRepository.curUser
            ?.copyWith(theme: event.mode.toString().split('.').last);

        await UserRepository.updateUserData(acc: AuthRepository.curUser!);

        emit(
          state.copyWith(mode: event.mode),
        );
        print(state.appLanguage);
        print(state.mode);
      },
    );
    on<ChangeLanguageEvent>(
      (event, emit) async {
        AuthRepository.curUser = AuthRepository.curUser
            ?.copyWith(language: event.lang.toString().split('.').last);

        print(
            await UserRepository.updateUserData(acc: AuthRepository.curUser!));

        emit(
          state.copyWith(appLanguage: event.lang),
        );
      },
    );
  }
}
