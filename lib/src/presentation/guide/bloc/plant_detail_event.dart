// ignore_for_file: must_be_immutable

part of 'plant_detail_bloc.dart';

class PlantDetailEvent extends Equatable {
  const PlantDetailEvent();

  @override
  List<Object> get props => [];
}

class GetPlantDetailEvent extends PlantDetailEvent {
  PlantGrid p;
  GetPlantDetailEvent(this.p);
}
