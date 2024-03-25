import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'plantcare_event.dart';
part 'plantcare_state.dart';

class PlantcareBloc extends Bloc<PlantcareEvent, PlantcareState> {
  PlantcareBloc() : super(PlantcareState()) {
    on<PlantcareEvent>(
      (event, emit) {},
    );
  }
}
