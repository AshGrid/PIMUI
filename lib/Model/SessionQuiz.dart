import 'package:intl/intl.dart';

class SessionQuiz {
  final String idQuiz;
  final String idUser;
  DateTime? dateDeb;
  DateTime? dateFin;

  SessionQuiz({
    required this.idQuiz,
    required this.idUser,
    this.dateDeb,
    this.dateFin,
  });

  factory SessionQuiz.fromJson(Map<String, dynamic> json) {
    return SessionQuiz(
      idQuiz: json['idquiz'],
      idUser: json['iduser'],
      dateDeb: json['datedeb'] != null ? DateTime.parse(json['datedeb']) : null,
      dateFin: json['datefin'] != null ? DateTime.parse(json['datefin']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    final dateFormat = DateFormat('yyyy-MM-ddTHH:mm:ssZ');
    return {
      'idquiz': idQuiz,
      'iduser': idUser,
      'datedeb': dateDeb != null ? dateFormat.format(dateDeb!) : null,
      'datefin': dateFin != null ? dateFormat.format(dateFin!) : null,
    };
  }
}
