import 'package:agroguru/src/domain/repository/auth_repository.dart';
import 'package:agroguru/src/utils/constants/enums/auth_status.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'register_event.dart';
part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  RegisterBloc() : super(RegisterState(status: AuthStatus.notStarted)) {
    on<RegisterUsingEmailEvent>(
      (event, emit) async {
        try {
          await AuthRepository.register(
            email: event.email,
            password: event.password,
          ).then(
            (value) {
              if (value) {
                emit(state.copyWith(status: AuthStatus.success));
              } else {
                emit(state.copyWith(status: AuthStatus.failed));
              }
            },
          );
        } on Exception catch (e) {
          print(e);
          emit(state.copyWith(status: AuthStatus.errored));
        }
      },
    );
  }
}
