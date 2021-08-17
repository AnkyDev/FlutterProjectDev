import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/Providers/cart.dart';
import 'package:shop_app/Screens/cart_screen.dart';
import 'package:shop_app/Widgets/app_drawer.dart';
import 'package:shop_app/Widgets/badge.dart';

import 'package:shop_app/Widgets/product_grid.dart';

enum filterOption {
  Favourites,
  All,
}

class ProductOverviewScreen extends StatefulWidget {
  @override
  _ProductOverviewScreenState createState() => _ProductOverviewScreenState();
}

var _showFavourite = false;

class _ProductOverviewScreenState extends State<ProductOverviewScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My shop'),
        actions: [
          PopupMenuButton(
            onSelected: (filterOption selectedValue) {
              //print(selectedValue);
              setState(() {
                if (selectedValue == filterOption.Favourites)
                  _showFavourite = true;
                else
                  _showFavourite = false;
              });
            },
            itemBuilder: (_) => [
              PopupMenuItem(
                child: Text(
                  'Only Favourites',
                ),
                value: filterOption.Favourites,
              ),
              PopupMenuItem(
                child: Text(
                  'Show all',
                ),
                value: filterOption.All,
              ),
            ],
          ),
          Consumer<Cart>(
            builder: (_, cart, _a) => Badge(
                child: IconButton(
                  icon: Icon(Icons.shopping_cart),
                  onPressed: () {
                    Navigator.pushNamed(context, CartScreen.routName);
                  },
                ),
                value: cart.itemCount),
          )
        ],
      ),
      drawer: AppDrawer(),
      body: ProductGrid(_showFavourite),
    );
  }
}
