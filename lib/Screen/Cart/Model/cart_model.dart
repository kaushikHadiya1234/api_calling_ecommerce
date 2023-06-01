
class CartModel
{
  String? date;
  int? id,userId,v;

  List<ProductModel>? productlist;

  CartModel({this.date, this.v, this.id, this.userId,this.productlist});

  factory CartModel.fromJson(Map m1)
  {
    List list = m1['products'];
    List<ProductModel> items = list.map((e) => ProductModel.fromJson(e)).toList();
    return CartModel(id: m1['id'],userId: m1['userId'],date: m1['date'],v: m1['__v'],productlist: items);
  }

}

class ProductModel
{
  int? productId,quantity;

  ProductModel({this.productId, this.quantity});

  factory ProductModel.fromJson(Map m1)
  {
    return ProductModel(productId: m1['productId'],quantity: m1['quantity']);
  }

}