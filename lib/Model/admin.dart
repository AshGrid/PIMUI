import 'package:intl/intl.dart';

class Admin {
  String? name;
  String? bio;
  String? email;
  int? age;
  String? avatar;
  DateTime? createdAt;
  DateTime? updatedAt;

  Admin({
    this.name,
    this.bio,
    this.email,
    this.age,
    this.avatar,
    this.createdAt,
    this.updatedAt,
  });

  factory Admin.fromJson(Map<String, dynamic> json) {
    return Admin(
      name: json['name'],
      bio: json['bio'],
      email: json['email'],
      age: json['age'],
      avatar: json['avatar'],
      createdAt: json['createdAt'] != null ? DateTime.parse(json['createdAt']) : null,
      updatedAt: json['updatedAt'] != null ? DateTime.parse(json['updatedAt']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    final dateFormat = DateFormat('yyyy-MM-ddTHH:mm:ssZ');
    return {
      'name': name,
      'bio': bio,
      'email': email,
      'age': age,
      'avatar': avatar,
      'createdAt': createdAt != null ? dateFormat.format(createdAt!) : null,
      'updatedAt': updatedAt != null ? dateFormat.format(updatedAt!) : null,
    };
  }
}
