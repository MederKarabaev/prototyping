class PhotoModel {
  final int userId;
  final int id;
  final String title;

  PhotoModel({
    required this.userId,
    required this.id,
    required this.title,
  });

  factory PhotoModel.fromJson(Map<String, dynamic> json) {
    return PhotoModel(
      userId: json['userId'],
      id: json['id'],
      title: json['title'],
    );
  }
}
