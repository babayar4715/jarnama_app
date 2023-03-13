// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Product {
  Product({
    this.images,
    required this.title,
    required this.description,
    required this.dateTime,
    required this.phoneNumber,
    required this.userName,
    required this.address,
    this.prices,
  });
  final List<String>? images;
  final String title;
  final String description;
  final String dateTime;
  final String phoneNumber;
  final String userName;
  final String address;
  final String? prices;

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'images': images,
      'title': title,
      'description': description,
      'dateTime': dateTime,
      'phoneNumber': phoneNumber,
      'userName': userName,
      'address': address,
      'prices': prices,
    };
  }

  factory Product.fromJson(Map<String, dynamic> map) {
    return Product(
      images: map['images'] != null
          ? List<String>.from((map['images'] as List<dynamic>))
          : null,
      title: map['title'] as String,
      description: map['description'] as String,
      dateTime: map['dataTime'] as String,
      phoneNumber: map['phoneNumber'] as String,
      userName: map['userName'] as String,
      address: map['address'] as String,
      prices: map['prices'] != null ? map['prices'] as String : null,
    );
  }

  static fromMap(Map<String, dynamic> data) {}
}
