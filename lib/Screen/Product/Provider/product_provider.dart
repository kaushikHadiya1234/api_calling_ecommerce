import 'dart:convert';

import 'package:api_calling_ecommerce/Screen/Product/Model/product_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;

class ProductProvider extends ChangeNotifier
{
  List<ProductModel> ProductList = [];

  Future<void> Apihelper()
  async {
    String link = 'https://fakestoreapi.com/products';
    var resource = await http.get(Uri.parse(link));

    List json = jsonDecode(resource.body);

    ProductList = json.map((e) => ProductModel.fromJson(e)).toList();

    notifyListeners();

    print(ProductList.length);

  }
}