class Video {
  final String videoUrl;
  final String thumbnail;

  Video({
    required this.videoUrl,
    required this.thumbnail,
  });

  factory Video.fromJson(Map<String, dynamic> json) {
    String pictureId = json['picture_id'] as String;
    return Video(
      videoUrl: json['videos']['large']['url'] as String,
      thumbnail: 'https://i.vimeocdn.com/video/${pictureId}_295x166.jpg',
    );
  }
}
