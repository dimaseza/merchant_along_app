import 'package:flutter/material.dart';
import 'package:merchant_along_app/pages/pages.dart';
import 'package:merchant_along_app/providers/customer_provider.dart';
import 'package:merchant_along_app/providers/product_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (ctx) => CustomerProvider(),
        ),
        ChangeNotifierProvider(
          create: (ctx) => ProductProvider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: MainPage(),
        routes: {
          EditProductPage.routeName: (ctx) => EditProductPage(),
          OrderPerCustomerPage.routeName: (ctx) => OrderPerCustomerPage(),
          DetailOrderPerCustomerPage.routeName: (ctx) =>
              DetailOrderPerCustomerPage(),
          OrderPerProductPage.routeName: (ctx) => OrderPerProductPage(),
          DetailOrderPerProductPage.routeName: (ctx) =>
              DetailOrderPerProductPage(),
        },
      ),
    );
  }
}
