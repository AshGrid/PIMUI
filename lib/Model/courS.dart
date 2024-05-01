class Course {
  final String name;
  final String description;
  final String image;
  final String rating;
  DateTime? createdAt;
  DateTime? updatedAt;

  Course({
    required this.name,
    required this.description,
    required this.image,
    required this.rating,
    this.createdAt,
    this.updatedAt,
  });

  factory Course.fromJson(Map<String, dynamic> json) {
    return Course(
      name: json['nameP'],
      description: json['descriptionP'],
      image: json['image'],
      rating: json['rating'],
      createdAt: json['createdAt'] != null ? DateTime.parse(json['createdAt']) : null,
      updatedAt: json['updatedAt'] != null ? DateTime.parse(json['updatedAt']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'nameP': name,
      'descriptionP': description,
      'image': image,
      'rating': rating,
      'createdAt': createdAt?.toIso8601String(),
      'updatedAt': updatedAt?.toIso8601String(),
    };
  }
}
