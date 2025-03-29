class Review {
  final String name;
  final String image;
  final num ratting;
  final String date;
  final String reviewDescription;
  Review({
    required this.name,
    required this.image,
    required this.ratting,
    required this.date,
    required this.reviewDescription,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'image': image,
      'ratting': ratting,
      'date': date,
      'reviewDescription': reviewDescription,
    };
  }

  factory Review.fromMap(Map<String, dynamic> map) {
    return Review(
      name: map['name'] as String,
      image: map['image'] as String,
      ratting: map['ratting'] as num,
      date: map['date'] as String,
      reviewDescription: map['reviewDescription'] as String,
    );
  }
}
