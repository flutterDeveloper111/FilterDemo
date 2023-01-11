// To parse this JSON data, do
//
//     final property = propertyFromJson(jsonString);

import 'dart:convert';

List<Property?>? propertyFromJson(String str) => json.decode(str) == null ? [] : List<Property?>.from(json.decode(str)!.map((x) => Property.fromJson(x)));

String propertyToJson(List<Property?>? data) => json.encode(data == null ? [] : List<dynamic>.from(data!.map((x) => x!.toJson())));

class Property {
  Property({
    this.id,
    this.propertyName,
    this.address,
    this.image,
    this.isFeatured,
    this.price,
    this.propertyType,
    this.propertyStatus,
    this.date,
    this.active,
  });

  int? id;
  String? propertyName;
  String? address;
  String? image;
  String? isFeatured;
  String? price;
  String? propertyType;
  String? propertyStatus;
  String? date;
  String? active;

  factory Property.fromJson(Map<String, dynamic> json) => Property(
    id: json["id"],
    propertyName: json["Property Name"],
    address: json["Address"],
    image: json["image"],
    isFeatured: json["is_featured"],
    price: json["price"],
    propertyType: json["property_type"],
    propertyStatus: json["property_status"],
    date: json["date"],
    active: json["active"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "Property Name": propertyName,
    "Address": address,
    "image": image,
    "is_featured": isFeatured,
    "price": price,
    "property_type": propertyType,
    "property_status": propertyStatus,
    "date": date,
    "active": active,
  };
}
