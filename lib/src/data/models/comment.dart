class Comment {
  String id;
  String userId;
  String text;
  List<String> likes;
  Comment({
    required this.id,
    required this.userId,
    required this.text,
    required this.likes,
  });
}
