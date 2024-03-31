// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable
part of 'schemes_bloc.dart';

class SchemesState extends Equatable {
  List<GovtSchemes> schemes;
  SchemesState({
    required this.schemes,
  });

  @override
  List<Object> get props => [];

  SchemesState copyWith({
    List<GovtSchemes>? schemes,
  }) {
    return SchemesState(
      schemes: schemes ?? this.schemes,
    );
  }
}

class SchemesLoadingState extends SchemesState {
  SchemesLoadingState({required List<GovtSchemes> schemes})
      : super(schemes: schemes);
}
