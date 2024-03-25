// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable

part of 'create_post_bloc.dart';

class CreatePostState extends Equatable {
  String title;
  String content;
  List<String> images;
  List<String> videos;
  CreatePostState({
    required this.title,
    required this.content,
    required this.images,
    required this.videos,
  });

  @override
  List<Object> get props => [title, content, images, videos];

  CreatePostState copyWith({
    String? title,
    String? content,
    List<String>? images,
    List<String>? videos,
  }) {
    return CreatePostState(
      title: title ?? this.title,
      content: content ?? this.content,
      images: images ?? this.images,
      videos: videos ?? this.videos,
    );
  }
}
