import 'package:api_calling_ecommerce/Screen/Cart/Model/cart_model.dart';
import 'package:api_calling_ecommerce/Screen/Cart/Provider/cart_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DashScreen extends StatefulWidget {
  const DashScreen({Key? key}) : super(key: key);

  @override
  State<DashScreen> createState() => _DashScreenState();
}

class _DashScreenState extends State<DashScreen> {
  CartProvider? pf;
  CartProvider? pt;

  @override
  Widget build(BuildContext context) {
    pf = Provider.of<CartProvider>(context, listen: false);
    pt = Provider.of<CartProvider>(context, listen: true);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Cart Data"),
        ),
        body: FutureBuilder(
          future: pf!.getdata(),
          builder: (context, snapshot) {
            if(snapshot.hasError)
              {
                return Center(child: Text("Please try agine",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),));
              }
            else if(snapshot.hasData)
              {
                List<CartModel> CartList = snapshot.data!;
                return ListView.builder(
                  itemBuilder: (context, index) {
                    return Container(
                      margin: EdgeInsets.all(10),
                      height: 160,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.blue[100],
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child:Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("id : ${CartList[index].id}",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                            Text("user Id : ${CartList[index].userId}",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                            Text("date : ${CartList[index].date}",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                            Text("V : ${CartList[index].v}",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                            Text("ProductId : ${CartList[index].productlist![0].productId}",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                            Text("quantity : ${CartList[index].productlist![0].quantity}",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),

                          ],
                        ),
                      ),
                    );
                  },
                  itemCount:CartList.length,
                );
              }
            return Center(child: CircularProgressIndicator());
          },
        )
      ),
    );
  }
}
