import 'package:agroguru/src/domain/repository/schemes_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../data/models/scheme.dart';

part 'schemes_event.dart';
part 'schemes_state.dart';

class SchemesBloc extends Bloc<SchemesEvent, SchemesState> {
  SchemesBloc()
      : super(SchemesState(
          schemes: [],
        )) {
    on<GetSchemesEvent>(
      (event, emit) async {
        emit(SchemesLoadingState(schemes: []));

        try {
          List<GovtSchemes> schemes = [];

          Map<String, dynamic> data = await SchemesRepository.getSchemes();

          schemes = (data['data'] as List)
              .map(
                (e) => GovtSchemes.fromMap(e),
              )
              .toList();

          emit(SchemesState(schemes: schemes));
        } on Exception catch (e) {
          print(e);
          emit(SchemesState(schemes: []));
        }
      },
    );
  }
}
