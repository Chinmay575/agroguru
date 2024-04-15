// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable
part of 'search_bloc.dart';

class SearchEvent extends Equatable {
  const SearchEvent();

  @override
  List<Object> get props => [];
}

class GetSearchString extends SearchEvent {
  String str;
  GetSearchString({
    required this.str,
  });
}
