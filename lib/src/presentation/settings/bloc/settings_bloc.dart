import 'package:agroguru/src/domain/repository/auth_repository.dart';
import 'package:agroguru/src/presentation/profile/bloc/profile_bloc.dart';
import 'package:agroguru/src/utils/constants/strings/strings.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'settings_event.dart';
part 'settings_state.dart';

class SettingsBloc extends Bloc<SettingsEvent, SettingsState> {
  SettingsBloc() : super(SettingsState(image: Strings.avatar)) {
    on<SettingsInitialEvent>(
      (event, emit) {
        if (AuthRepository.curUser != null) {
          print(AuthRepository.curUser!.toMap());
          if (AuthRepository.curUser?.displayPic != null ||
              AuthRepository.curUser!.displayPic.isNotEmpty) {
            emit(
              state.copyWith(
                image: AuthRepository.curUser!.displayPic,
              ),
            );
          }
        }
      },
    );
    on<LogOutEvent>(
      (event, emit) async {
        await AuthRepository.logOut().then(
          (value) => emit(
            LoggedOutState(),
          ),
        );
        ProfileBloc().add(ProfileLogOutEvent());
      },
    );
  }
}
