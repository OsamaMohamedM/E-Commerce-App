import 'package:e_commerce/Core/Data/Model/ProductEntity.dart';

ProductEntity getProduct() {
  return ProductEntity(
    name: 'Apple',
    price: 10,
    image:
        'https://images.pexels.com/photos/2820884/pexels-photo-2820884.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
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
