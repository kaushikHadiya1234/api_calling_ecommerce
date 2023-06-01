import 'dart:convert';

import 'package:api_calling_ecommerce/Screen/Cart/Model/cart_model.dart'; 
import 'package:http/http.dart' as http;
class Apihelper
{

  Future<List<CartModel>> getApidata() async {
    String? link = 'https://fakestoreapi.com/carts';
    var resource = await http.get(Uri.parse(link));
    List json = jsonDecode(resource.body);
    List<CartModel> CartList = json.map((e) => CartModel.fromJson(e)).toList();
    return CartList;
  }
}