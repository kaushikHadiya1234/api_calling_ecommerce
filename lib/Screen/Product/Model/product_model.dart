import 'package:flutter/material.dart';

class ProductModel {
  num? id, price;
  String? title, description, category, image;
  RatModel? ratModel;

  ProductModel(
      {this.id,
      this.price,
      this.title,
      this.description,
      this.category,
      this.image,
      this.ratModel});

  factory ProductModel.fromJson(Map m1) {
    return ProductModel(
        id: m1['id'],
        title: m1['title'],
        price: m1['price'],
        category: m1['category'],
        description: m1['description'],
        image: m1['image'],
        ratModel: RatModel.fromJson(m1['rating']));
  }
}

class RatModel {
  num? rate, count;

  RatModel({this.rate, this.count});

  factory RatModel.fromJson(Map m1) {
    return RatModel(rate: m1['rate'], count: m1['count']);
  }
}
