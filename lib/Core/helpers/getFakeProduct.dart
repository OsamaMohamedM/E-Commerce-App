import 'package:e_commerce/Core/Data/Model/ProductEntity.dart';

ProductEntity getProduct() {
  return ProductEntity(
    name: 'Apple',
    price: 10,
    image:
        'https://images.unsplash.com/photo-1490818396009-d7f8b8d5b4b1?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80',
    description: 'description',
    numSelling: 10,
    reviews: [],
    code: 'APL123',
    isFeatured: true,
    expirationMonths: 12,
    isOrganic: true,
    unitAmount: 1,
  );
}

List<ProductEntity> getProducts() => List.generate(15, (index) => getProduct());
