import 'dart:convert';

class AddressModel {
  String street1;
  String street2;
  String city;
  String state;
  String contry;
  AddressModel({
    this.contry,
    this.state,
    this.street2,
    this.street1,
    this.city,
  });

  Map<String, dynamic> toMap() {
    return {
      'street1': street1,
      'street2': street2,
      'city': city,
      'state': state,
      'contry': contry,
    };
  }

  factory AddressModel.fromMap(Map<String, dynamic> map) {
    return AddressModel(
      street1: map['street1'] ?? '',
      street2: map['street2'] ?? '',
      city: map['city'] ?? '',
      state: map['state'] ?? '',
      contry: map['contry'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory AddressModel.fromJson(String source) =>
      AddressModel.fromMap(json.decode(source));
}
