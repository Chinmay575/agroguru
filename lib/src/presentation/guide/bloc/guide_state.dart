// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable
part of 'guide_bloc.dart';

class GuideState extends Equatable {
  List<PlantGrid> plantData = [];

  GuideState({
    required this.plantData,

  });

  @override
  List<Object> get props => [];

  GuideState copyWith({
    List<PlantGrid>? plantData,
  }) {
    return GuideState(
      plantData: plantData ?? this.plantData,
    );
  }
}

class GuideLoadingState extends GuideState {
  GuideLoadingState() : super(plantData: []);
}
