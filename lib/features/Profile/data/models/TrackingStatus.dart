class TrackingStatus {
  final String title;
  final String date;
  final bool isCompleted;

  TrackingStatus({
    required this.title,
    required this.date,
    required this.isCompleted,
  });
  factory TrackingStatus.fromMap(Map<String, dynamic> map) {
    return TrackingStatus(
      title: map['tittle'] ?? '',
      date: map['date'] ?? '',
      isCompleted: map['status'] ?? false,
    );
  }
}
