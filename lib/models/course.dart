/*class Course {
  String name;
  double completedPercentage;
  String author;
  String thumbnail;

  Course({
    required this.author,
    required this.completedPercentage,
    required this.name,
    required this.thumbnail,
  });
}

List<Course> courses = [
  Course(
    author: "DevWheels",
    completedPercentage: .75,
    name: "Flutter Novice to Ninja",
    thumbnail: "assets/icons/flutter.jpg",
  ),
  Course(
    author: "DevWheels",
    completedPercentage: .60,
    name: "React Novice to Ninja",
    thumbnail: "assets/icons/react.jpg",
  ),
  Course(
    author: "DevWheels",
    completedPercentage: .75,
    name: "Node - The complete guide",
    thumbnail: "assets/icons/node.png",
  ),
  Course(
    author: "DevWheels",
    completedPercentage: .75,
    name: "Flutter Novice to Ninja",
    thumbnail: "assets/icons/flutter.jpg",
  ),
  Course(
    author: "DevWheels",
    completedPercentage: .60,
    name: "React Novice to Ninja",
    thumbnail: "assets/icons/react.jpg",
  ),
  Course(
    author: "DevWheels",
    completedPercentage: .75,
    name: "Node - The complete guide",
    thumbnail: "assets/icons/node.png",
  ),
];
*/class Course {
  final String id;
  final String name;
  final String description;
  final List<Map<String, dynamic>> videos;

  Course({
    required this.id,
    required this.name,
    required this.description,
    required this.videos,
  });

  factory Course.fromJson(Map<String, dynamic> json) {
    return Course(
      id: json['_id'],
      name: json['name'],
      description: json['description'],
      videos: List<Map<String, dynamic>>.from(json['videos']),
    );
  }
}
