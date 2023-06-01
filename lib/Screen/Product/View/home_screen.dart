import 'package:api_calling_ecommerce/Screen/Product/Provider/product_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  ProductProvider? pf;
  ProductProvider? pt;

  @override
  void initState() {
    super.initState();
    Provider.of<ProductProvider>(context, listen: false).Apihelper();
  }
  @override
  Widget build(BuildContext context) {
    pf = Provider.of<ProductProvider>(context, listen: false);
    pt = Provider.of<ProductProvider>(context, listen: true);
    return SafeArea(
      child: Scaffold(
        // backgroundColor: Color(0xffF3F3F3),
        backgroundColor: Colors.white,
        appBar: AppBar(
         leading: IconButton(onPressed: () {

         },icon: Icon(Icons.menu,color: Colors.black,),),
          actions: [
            IconButton(onPressed: () {

            },icon: Icon(Icons.card_travel,color: Colors.black,),),
          ],
          backgroundColor: Colors.white,
          elevation: 0,
        ),
        body:Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Kaushik",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25),),
              Text("Welcome to laza",style: TextStyle(fontSize: 18,color: Colors.grey),),
              SizedBox(height: 10,),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 55,
                      width: 250,
                      child: TextField(
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Color(0xffF5F6FA),
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(15),
                          ),
                          prefixIcon: Icon(Icons.search),
                          hintText: "Search"
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 10,),
                  Container(
                    height: 55,
                    width: 55,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Color(0xff9775FA)
                    ),
                    child: Icon(Icons.mic,color: Colors.white,size: 25,),
                  )
                ],
              ),
              SizedBox(height: 10,),
              Image.asset('assets/images/c.png'),
              SizedBox(height: 10,),
              Expanded(
                child: GridView.builder(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,mainAxisSpacing: 10,crossAxisSpacing: 10,mainAxisExtent: 300), itemBuilder: (context, index) {
                  return Container(
                    height: 300,
                    width: 175,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: Colors.grey)
                    ),
                    child: Column(
                      children: [
                        Container(
                          margin: EdgeInsets.all(10),
                          height: 140,
                          width: 140,
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              Image.network("${pt!.ProductList[index].image}"),
                              Align(
                                alignment: Alignment(1.5,-1.3),
                                child: IconButton(onPressed: () {

                                }, icon: Icon(Icons.favorite_border_outlined,size: 25,color: Colors.grey,)),
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("${pt!.ProductList[index].title}",style: TextStyle(fontSize: 16,),maxLines: 4,),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Container(alignment: Alignment.centerLeft,child: Text("\$${pt!.ProductList[index].price}",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),)),
                        )
                      ],
                    ),
                  );
                },itemCount: pt!.ProductList.length,
                physics: BouncingScrollPhysics(),
                ),
              )
            ],
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: Color(0xff9775FA),
          unselectedItemColor: Color(0xff8F959E),
          type: BottomNavigationBarType.fixed,
          backgroundColor: Color(0xffFEFEFE),
          elevation: 0,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home_outlined),label: ''),
            BottomNavigationBarItem(icon: Icon(Icons.favorite_border_outlined),label: ''),
            BottomNavigationBarItem(icon: Icon(Icons.card_travel),label: ''),
            BottomNavigationBarItem(icon: Icon(Icons.wallet),label: ''),
          ],
        ),
      ),
    );
  }
}
