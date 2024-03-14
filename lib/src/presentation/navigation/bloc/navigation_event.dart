// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable

part of 'navigation_bloc.dart';

abstract class NavigationEvent extends Equatable {
  int? index;
  NavigationEvent({
    this.index,
    
  });

  @override
  List<Object?> get props => [index];
}

class PushPageEvent extends NavigationEvent {
  PushPageEvent({
    required int index,
  }) : super(index: index);
}

class PopPageEvent extends NavigationEvent {}
