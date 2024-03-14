import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'navigation_event.dart';
part 'navigation_state.dart';

class NavigationBloc extends Bloc<NavigationEvent, NavigationState> {
  NavigationBloc() : super(NavigationState(index: 0, history: {})) {
    on<PushPageEvent>(
      (event, emit) {
        state.history[event.index!] = state.index;
        emit(state.copyWith(index: event.index, history: state.history));
      },
    );
    on<PopPageEvent>(
      (event, emit) {
        int prev = state.history[state.index] ?? -1;
        state.history.remove(state.index);
        emit(state.copyWith(index: prev, history: state.history));
      },
    );
  }
}
