import 'package:e_commerce/Core/Data/Model/Review.dart';

class ProductEntity {
  final String code;
  final String name;
  final String description;
  final double price;

  final bool isFeatured;
  final String? image;
  final int expirationMonths;
  final bool isOrganic;
  final num avgRating;
  final num ratingCount;
  final int unitAmount;
  final int numSelling;
  final List<Review> reviews;
  ProductEntity({
    this.avgRating = 0,
    this.ratingCount = 0,
    required this.code,
    required this.isFeatured,
    required this.expirationMonths,
    required this.isOrganic,
    required this.unitAmount,
    required this.name,
    required this.description,
    required this.price,
    required this.image,
    this.numSelling = 0,
    this.reviews = const [],
  });
  factory ProductEntity.fromMap(Map<String, dynamic> map) {
    return ProductEntity(
      numSelling: map['numSelling'],
      code: map['code'],
      name: map['name'],
      description: map['description'],
      price: map['price'],
      image: map['image'],
      isFeatured: map['isFeatured'],
      expirationMonths: map['expirationMonths'],
      isOrganic: map['isOrganic'],
      avgRating: map['avgRating'],
      ratingCount: map['ratingCount'],
      unitAmount: map['unitAmount'],
      reviews: (map['reviews'] as List).map((e) => Review.fromMap(e)).toList(),
    );
  }

  get toMap => {
        'name': name,
        'description': description,
        'price': price,
        'isFeatured': isFeatured,
        'image': image,
        'expirationMonths': expirationMonths,
        'isOrganic': isOrganic,
        'avgRating': avgRating,
        'ratingCount': ratingCount,
        'unitAmount': unitAmount,
        'reviews': reviews.map((e) => e.toMap()).toList(),
        'numSelling': numSelling
      };

      @override
     bool operator ==(Object product) {
    if (product is ProductEntity) {
      return product.code == code;
    }
    return false;
  }
}
