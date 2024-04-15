// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable
part of 'plantcare_bloc.dart';

class PlantcareEvent extends Equatable {
  const PlantcareEvent();

  @override
  List<Object> get props => [];
}

class GetPredictionHistory extends PlantcareEvent {}

class GetImageEvent extends PlantcareEvent {
  File image;
  GetImageEvent({
    required this.image,
  });
}

class SendPredictionRequest extends PlantcareEvent {}

class ResetPredictionEvent extends PlantcareEvent {}

class GetCurrentIndexEvent extends PlantcareEvent {
  int index;
  GetCurrentIndexEvent({
    required this.index,
  });
}
