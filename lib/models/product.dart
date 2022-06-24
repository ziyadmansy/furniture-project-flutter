import 'package:flutter/foundation.dart';

class Product {
  final int id;
  final String name;
  final String details;
  final double cost;
  final String material;
  final String imgUrl;

  Product({
    @required this.id,
    @required this.name,
    @required this.details,
    @required this.cost,
    @required this.material,
    @required this.imgUrl,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['prod_id'] as int,
      name: json['product_name'] as String,
      details: json['details'] as String,
      cost: double.parse(json['cost'].toString()),
      material: json['material'].toString(),
      imgUrl: (json['img_url'] as String) ??
          'https://paulvanderlaken.files.wordpress.com/2020/02/post-box-11.jpg',
    );
  }
}
