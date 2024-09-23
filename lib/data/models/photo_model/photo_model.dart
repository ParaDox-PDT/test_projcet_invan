class PhotoModel {
  final int albumId;
  final int id;
  final String title;
  final String url;
  final String thumbnailUrl;

  PhotoModel({
    required this.albumId,
    required this.id,
    required this.title,
    required this.url,
    required this.thumbnailUrl,
  });

  factory PhotoModel.fromJson(Map<String, dynamic> json) {
    return PhotoModel(
      albumId: json["albumId"] as int? ?? 0,
      id: json["id"] as int? ?? 0,
      title: json["title"] as String? ?? "",
      url: json["url"] as String? ?? "",
      thumbnailUrl: json["thumbnailUrl"] as String? ?? "",
    );
  }
}