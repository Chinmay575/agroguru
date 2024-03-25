// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable
part of 'plant_detail_bloc.dart';

class PlantDetailState extends Equatable {
  PlantGrid? p;

  PlantDetailState({
    this.p,
  });

  @override
  List<Object> get props => [];
}

class PlantDetailLoadingState extends PlantDetailState {}
