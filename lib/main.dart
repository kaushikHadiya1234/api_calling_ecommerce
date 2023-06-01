import 'package:api_calling_ecommerce/Screen/Cart/Provider/cart_provider.dart';
import 'package:api_calling_ecommerce/Screen/Cart/View/dash_screen.dart';
import 'package:api_calling_ecommerce/Screen/Product/Provider/product_provider.dart';
import 'package:api_calling_ecommerce/Screen/Product/View/home_screen.dart';
import 'package:api_calling_ecommerce/Screen/Product/View/splace_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ProductProvider(),),
        ChangeNotifierProvider(create: (context) => CartProvider(),),
      ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          initialRoute: '/',
          routes: {
            '/':(context) => SplaceScreen(),
            'home':(context) => HomeScreen(),
            'dash':(context) => DashScreen(),
          },
        ),
      ),
  );
}
