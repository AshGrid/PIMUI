class DomainVerified {
  final String? idUser;
  final String? idDomain;
  int score;
  int level;

  DomainVerified({
    this.idUser,
    this.idDomain,
    this.score = 0,
    this.level = 1,
  });

  factory DomainVerified.fromJson(Map<String, dynamic> json) {
    return DomainVerified(
      idUser: json['iduser'],
      idDomain: json['iddomain'],
      score: json['score'] ?? 0,
      level: json['level'] ?? 1,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'iduser': idUser,
      'iddomain': idDomain,
      'score': score,
      'level': level,
    };
  }
}
