import 'package:agroguru/src/data/models/plant_data_grid.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'plant_detail_event.dart';
part 'plant_detail_state.dart';

class PlantDetailBloc extends Bloc<PlantDetailEvent, PlantDetailState> {
  PlantDetailBloc() : super(PlantDetailState()) {
    on<GetPlantDetailEvent>((event, emit) {
      emit(PlantDetailLoadingState());

      emit(PlantDetailState(p: event.p));
    });
  }
}
