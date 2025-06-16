/// Represents an album of the JSONPlaceholder API.
///
/// Contains information about an album including:
/// - The [userId] who creaed the album
/// - The unique [id] of the album
/// - The [title] of the album
class AlbumModel {
  const AlbumModel({
    required this.userId,
    required this.id,
    required this.title,
  });

  /// The ID of the user who created this album
  final int userId;

  /// The unique identidfier for this album
  final int id;

  /// The title of the album
  final String title;

  factory AlbumModel.fromJson(Map<String, dynamic> json) {
    return AlbumModel(
      userId: json['userId'],
      id: json['id'],
      title: json['title'],
    );
  }
}
