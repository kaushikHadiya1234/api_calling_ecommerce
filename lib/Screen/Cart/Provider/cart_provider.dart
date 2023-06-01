import 'package:api_calling_ecommerce/Screen/Cart/Model/cart_model.dart';
import 'package:api_calling_ecommerce/Screen/utils/api_helper.dart';
import 'package:flutter/material.dart';

class CartProvider extends ChangeNotifier {

  Future<List<CartModel>> getdata()
  async {
    Apihelper apihelper = Apihelper();
    return await apihelper.getApidata();
  }
}