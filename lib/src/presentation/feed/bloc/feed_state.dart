part of 'feed_bloc.dart';

sealed class FeedState extends Equatable {
  const FeedState();
  
  @override
  List<Object> get props => [];
}

final class FeedInitial extends FeedState {}
