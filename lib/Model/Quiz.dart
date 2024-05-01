class Quiz {
  final String question;
  final String correctAnswer;
  final List<String> choices;
  final String? idDomain;

  Quiz({
    required this.question,
    required this.correctAnswer,
    required this.choices,
    this.idDomain,
  });

  factory Quiz.fromJson(Map<String, dynamic> json) {
    return Quiz(
      question: json['question'],
      correctAnswer: json['correct_answer'],
      choices: List<String>.from(json['choices']),
      idDomain: json['iddomain'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'question': question,
      'correct_answer': correctAnswer,
      'choices': choices,
      'iddomain': idDomain,
    };
  }
}
