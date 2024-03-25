// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable

part of 'navigation_bloc.dart';

class NavigationState extends Equatable {
  PageController controller = PageController();
  int index;
  Map<int, int> history;
  NavigationState({
    required this.index,
    required this.history,
  });

  @override
  List<Object?> get props => [index];

  NavigationState copyWith({
    int? index,
    Map<int, int>? history,
  }) {
    return NavigationState(
      index: index ?? this.index,
      history: history ?? this.history,
    );
  }
}
