import 'package:agroguru/src/data/models/user.dart';
import 'package:agroguru/src/domain/repository/auth_repository.dart';
import 'package:agroguru/src/domain/repository/user_repository.dart';
import 'package:agroguru/src/utils/constants/enums/login_methods.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  ProfileBloc() : super(ProfileInitial()) {
    on<ProfileInitialEvent>(
      (event, emit) {
        print('Initial Event Triggered');
        LoginType? type = AuthRepository.getAuthProvider();
        emit(
          ProfileState(
            acc: AuthRepository.curUser,
            type: type ?? LoginType.unknown,
          ),
        );
      },
    );

    on<UpdateProfileEvent>(
      (event, emit) async {
        await UserRepository.updateUserData(acc: event.user).then(
          (value) {
            AuthRepository.curUser = event.user;
            emit(
              state.copyWith(acc: event.user),
            );
            print(AuthRepository.curUser);
            print(state.acc?.toMap());
          },
        );

        print('User updated');
      },
    );

    on<ProfileLogOutEvent>(
      (event, emit) {
        print('Logged out event triggered');
        emit(
          state.copyWith(acc: null, type: null),
        );
        print(state.acc?.toMap());
        emit(ProfileInitial());
      },
    );
  }
}
