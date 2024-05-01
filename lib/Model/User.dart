class User {
  final String fName;
  final String email;
  final String phoneNumber;
  final String password;
  int score;
  bool etatDelete;
  String? forgetPwd;
  String addWalet;
  String pkeyWalet;
  String? resetPasswordToken;
  DateTime? resetPasswordExpires;

  User({
    required this.fName,
    required this.email,
    required this.phoneNumber,
    required this.password,
    this.score = 0,
    this.etatDelete = false,
    this.forgetPwd,
    this.addWalet = '',
    this.pkeyWalet = '',
    this.resetPasswordToken,
    this.resetPasswordExpires,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      fName: json['fName'],
      email: json['email'],
      phoneNumber: json['phoneNumber'],
      password: json['password'],
      score: json['score'] ?? 0,
      etatDelete: json['etatDelete'] ?? false,
      forgetPwd: json['forgetPwd'],
      addWalet: json['addWalet'] ?? '',
      pkeyWalet: json['pkeyWalet'] ?? '',
      resetPasswordToken: json['resetPasswordToken'],
      resetPasswordExpires: json['resetPasswordExpires'] != null ? DateTime.parse(json['resetPasswordExpires']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'fName': fName,
      'email': email,
      'phoneNumber': phoneNumber,
      'password': password,
      'score': score,
      'etatDelete': etatDelete,
      'forgetPwd': forgetPwd,
      'addWalet': addWalet,
      'pkeyWalet': pkeyWalet,
      'resetPasswordToken': resetPasswordToken,
      'resetPasswordExpires': resetPasswordExpires?.toIso8601String(),
    };
  }
}
