class RecentTest {
  final String? correctCount;
  final String? paperId;
  String? papername;
  String? paperimage;
  final String? points;
  final int? time;

  RecentTest({
    this.correctCount,
    this.paperId,
    this.papername,
    this.paperimage,
    this.time, 
    this.points,
  });

  RecentTest.fromMap(Map<String, dynamic> data)
    : correctCount = data['correct_count'] as String?,
      paperId = data['paper_id'] as String?,
      papername = '', // data['papername'] as String?,
      paperimage = '', // data['paperimage'] as String?,
      time = data['time'] as int?,
      points = data['points'] as String?;

  Map<String, dynamic> toJson() => {
    'correct_count' : correctCount,
    'paper_id' : paperId,
    'papername' : papername,
    'paperimage' : paperimage,
    'points' : points
  };
}
