// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable
part of 'create_post_bloc.dart';

class CreatePostEvent extends Equatable {
  String title;
  String content;
  List<String> images;
  List<String> videos;
  CreatePostEvent({
    required this.title,
    required this.content,
    required this.images,
    required this.videos,
  });
  //  CreatePostEvent();

  @override
  List<Object> get props => [title, content, images, videos];
}

class CreatePostGetData extends CreatePostEvent {
  CreatePostGetData({
    required String title,
    required String content,
    required List<String> images,
    required List<String> videos,
  }) : super(
          content: content,
          images: images,
          title: title,
          videos: videos,
        );
}
