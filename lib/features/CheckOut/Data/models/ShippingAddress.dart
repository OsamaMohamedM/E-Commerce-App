// ignore_for_file: public_member_api_docs, sort_constructors_first
class ShippingAddressEntity {
  String? name;
  String? address;
  String? addressDetails;
  String? city;
  String? email;
  String? phone;
  ShippingAddressEntity({
    this.name,
    this.address,
    this.addressDetails,
    this.city,
    this.email,
    this.phone,
  });
  String toString() {
    return '$address $addressDetails $city';
  }

  toJson() => {
        'name': name,
        'address': address,
        'addressDetails': addressDetails,
        'city': city,
        'email': email,
        'phone': phone
      };
}
