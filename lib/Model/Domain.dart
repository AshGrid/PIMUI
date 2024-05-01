class Domain {
  String? title;
  String? description;

  Domain({this.title, this.description});

  factory Domain.fromJson(Map<String, dynamic> json) {
    return Domain(
      title: json['title'],
      description: json['description'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'description': description,
    };
  }
}
