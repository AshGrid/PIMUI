class User {
  final String id;
  final String fName;
  final String email;
  final String phoneNumber;
  final String password;

  User({
    required this.id,
    required this.fName,
    required this.email,
    required this.phoneNumber,
    required this.password,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['_id'] as String,
      fName: json['fName'] as String,
      email: json['email'] as String,
      phoneNumber: json['phoneNumber'] as String,
      password: json['password'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'fName': fName,
      'email': email,
      'phoneNumber': phoneNumber,
      'password': password,
    };
  }
}
