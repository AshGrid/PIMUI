class Tutorial {
  String? description;
  String? name;
  List<Video> videos;

  Tutorial({this.description, this.name, required this.videos});

  factory Tutorial.fromJson(Map<String, dynamic> json) {
    return Tutorial(
      description: json['description'],
      name: json['name'],
      videos: List<Video>.from(json['videos'].map((video) => Video.fromJson(video))),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'description': description,
      'name': name,
      'videos': videos.map((video) => video.toJson()).toList(),
    };
  }
}

class Video {
  String? videoUrl;

  Video({this.videoUrl});

  factory Video.fromJson(Map<String, dynamic> json) {
    return Video(
      videoUrl: json['videoUrl'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'videoUrl': videoUrl,
    };
  }
}
