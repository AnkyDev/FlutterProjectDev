import 'package:flutter/material.dart';
import 'package:shop_app/Providers/cart.dart';
import 'package:shop_app/Providers/order.dart';
import 'package:shop_app/Providers/product_provider.dart';
import 'package:shop_app/Screens/cart_screen.dart';
import 'package:shop_app/Screens/edit_product_screen.dart';
import 'package:shop_app/Screens/orderScreen.dart';
import 'package:shop_app/Screens/product_detail_screen.dart';
import 'package:shop_app/Screens/product_overview_screen.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/Screens/user_input_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => new ProductProvide(),
        ),
        ChangeNotifierProvider(
          create: (_) => new Cart(),
        ),
        ChangeNotifierProvider(
          create: (_) => new Orders(),
        ),
      ],
      child: MaterialApp(
        title: 'My Shop',
        theme: ThemeData(
          primarySwatch: Colors.purple,
          accentColor: Colors.deepOrange,
          canvasColor: Color.fromRGBO(255, 254, 230, 1),
          fontFamily: 'Lato',
          textTheme: ThemeData.light().textTheme.copyWith(
                bodyText2: TextStyle(
                  color: Color.fromRGBO(20, 50, 50, 1),
                ),
                headline6: TextStyle(
                  fontSize: 20,
                  fontFamily: 'Anton',
                  fontWeight: FontWeight.bold,
                ),
              ),
        ),
        routes: {
          ProductDetailScreen.routName: (ctx) => ProductDetailScreen(),
          CartScreen.routName: (ctx) => CartScreen(),
          OrderScreen.routName: (ctx) => OrderScreen(),
          UserInputScreen.routName:(ctx)=>UserInputScreen(),
          EditProductScreen.routName:(ctx)=>EditProductScreen(),
        },
        home: ProductOverviewScreen(),
      ),
    );
  }
}
