import 'package:agroguru/src/domain/repository/auth_repository.dart';
import 'package:agroguru/src/utils/constants/enums/auth_status.dart';
import 'package:agroguru/src/utils/constants/enums/login_methods.dart';
import 'package:bloc/bloc.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc()
      : super(LoginState(
            loginType: LoginType.email, status: AuthStatus.notStarted)) {
    on<ChangeLoginMethod>(
      (event, emit) {
        emit(
          state.copyWith(
            loginType: event.loginType,
          ),
        );
      },
    );
    on<LoginUsingGoogle>(
      (event, emit) async {
        bool status = await AuthRepository.loginUsingGoogle();
        if (status) {
          emit(state.copyWith(
            status: AuthStatus.success,
          ));
        } else {
          emit(state.copyWith(
            status: AuthStatus.failed,
          ));
        }
      },
    );
  }
}
