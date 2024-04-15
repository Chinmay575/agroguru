// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable

part of 'plantcare_bloc.dart';

class PlantcareState extends Equatable {
  String? curImage;
  List<Prediction> history = [];
  Prediction? result;
  int? curIndex;
  PlantcareState({
    this.curImage,
    required this.history,
    this.result,
    this.curIndex, 
  });

  PlantcareState copyWith({
    String? curImage,
    List<Prediction>? history,
    Prediction? result,
    int? curIndex, 
  }) {
    return PlantcareState(
      curImage: curImage ?? this.curImage,
      history: history ?? this.history,
      result: result ?? this.result,
      curIndex: curIndex ?? this.curIndex, 
    );
  }

  @override
  List<Object?> get props => [curImage, history, result,curIndex];
}

class PlantInitialState extends PlantcareState {
  PlantInitialState() : super(history: []);
}

class PlantImageSelectedState extends PlantcareState {
  PlantImageSelectedState(String image, List<Prediction> history)
      : super(history: history, curImage: image);
}

class PlantRequestSentState extends PlantcareState {
  PlantRequestSentState(String image, List<Prediction> history)
      : super(history: history, curImage: image);
}

class PlantResponseRecvState extends PlantcareState {
  PlantResponseRecvState(
      String image, List<Prediction> history, Prediction result)
      : super(
          history: history,
          curImage: image,
          result: result,
        );
}

class HistoryLoadingState extends PlantcareState {
  HistoryLoadingState()
      : super(
          history: [],
          curImage: null,
          result: null,
        );
}

class HistoryLoadedState extends PlantcareState {
  HistoryLoadedState(List<Prediction> history)
      : super(
          history: history,
          curImage: null,
          result: null,
        );
}
