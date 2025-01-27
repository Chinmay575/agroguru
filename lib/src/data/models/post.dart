class Post {
  String id;
  String title;
  String content;
  List<String> likes;
  List<String> images;
  List<String> videos;
  List<String> comments;
  Post({
    required this.id,
    required this.title,
    required this.content,
    required this.likes,
    required this.images,
    required this.videos,
    required this.comments,
  });
}
