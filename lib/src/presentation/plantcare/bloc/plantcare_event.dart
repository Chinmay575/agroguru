part of 'plantcare_bloc.dart';

class PlantcareEvent extends Equatable {
  const PlantcareEvent();

  @override
  List<Object> get props => [];
}

class GetPredictionHistory extends PlantcareEvent {}

class GetImageFromCamera extends PlantcareEvent {}

class GetImageFromGallery extends PlantcareEvent {}