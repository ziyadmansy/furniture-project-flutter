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
          'https://media-cldnry.s-nbcnews.com/image/upload/newscms/2020_21/1570968/screen_shot_2020-05-19_at_11-36-02_am.png',
    );
  }
}
