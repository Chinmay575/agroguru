import 'package:agroguru/src/domain/repository/guide_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../data/models/plant_data_grid.dart';

part 'guide_event.dart';
part 'guide_state.dart';

class GuideBloc extends Bloc<GuideEvent, GuideState> {
  GuideBloc() : super(GuideState(plantData: [])) {
    on<GuideEvent>(
      (event, emit) async {
        emit(GuideLoadingState());

        List<PlantGrid> plantData = await GuideRepository.getPlantData().then(
              (value) {
                try {
                  List<dynamic> data = value['data'];
                  // print(data);
                  List<PlantGrid> plantData = data
                      .map(
                        (e) => PlantGrid.fromMap(e as Map<String,dynamic>),
                      )
                      .toList();

                  return plantData;
                } on Exception catch (e) {
                  print(e);
                }
                return [];
              },
            ) ??
            [];

        emit(
          state.copyWith(
            plantData: plantData,
          ),
        );
      },
    );
  }
}
