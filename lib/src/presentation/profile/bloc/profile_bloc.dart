import 'package:agroguru/src/data/models/user.dart';
import 'package:agroguru/src/domain/repository/auth_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  ProfileBloc() : super(ProfileInitial(AuthRepository.curUser!)) {
    on<ProfileEvent>((event, emit) {});
  }
}
