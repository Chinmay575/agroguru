import 'package:agroguru/src/utils/constants/enums/login_methods.dart';
import 'package:bloc/bloc.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginState(loginType: LoginType.email)) {
    on<ChangeLoginMethod>(
      (event, emit) {
        emit(state.copyWith(method: event.loginType));
      },
    );
  }
}
