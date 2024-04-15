import 'dart:io';
import 'dart:typed_data';

import 'package:agroguru/src/data/models/prediction.dart';
import 'package:agroguru/src/domain/repository/plant_care_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:image/image.dart' as img;
import 'package:path_provider/path_provider.dart';

part 'plantcare_event.dart';
part 'plantcare_state.dart';

class PlantcareBloc extends Bloc<PlantcareEvent, PlantcareState> {
  PlantcareBloc() : super(PlantInitialState()) {
    on<GetImageEvent>(
      (event, emit) async {
        String fileName = '${DateTime.now().millisecondsSinceEpoch}.jpg';

        Directory dir = await getApplicationCacheDirectory();
        File d = await File('${dir.path}/$fileName').create();

        try {
          Uint8List bytes = await event.image.readAsBytes();

          img.Image? image = img.decodeImage(bytes);
          print(image.toString());

          if (image != null) {
            img.Image result = img.copyResize(image, width: 256, height: 256);
            print(result.toString());
            await File(d.path).writeAsBytes(img.encodeJpg(result));
          }
        } on Exception catch (e) {
          print(e);
        }

        if (await File(d.path).exists()) {
          print('exists');
          emit(PlantImageSelectedState(d.path, state.history));
        } else {
          print('does not exists');
          emit(PlantImageSelectedState(event.image.path, state.history));
        }
      },
    );

    on<SendPredictionRequest>(
      (event, emit) async {
        print(state.toString());
        if (state.curImage != null) {
          emit(PlantRequestSentState(state.curImage!, state.history));
          Prediction? p = await PlantCareRepository.predict(state.curImage!);

          if (p != null) {
            await PlantCareRepository.uploadPrediction(p);

            List<Prediction> pr =
                await PlantCareRepository.getPredictionHistory();
            emit(
              PlantResponseRecvState(
                state.curImage!,
                pr,
                p,
              ),
            );
          }
        }
      },
    );

    on<ResetPredictionEvent>(
      (event, emit) {
        emit(HistoryLoadedState(state.history));
      },
    );

    on<GetPredictionHistory>(
      (event, emit) async {
        emit(HistoryLoadingState());
        List<Prediction> pr = await PlantCareRepository.getPredictionHistory();
        emit(HistoryLoadedState(pr));
      },
    );
    on<GetCurrentIndexEvent>(
      (event, emit) {
        emit(state.copyWith(curIndex: event.index));
      },
    );
  }
}
