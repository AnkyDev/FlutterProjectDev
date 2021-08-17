import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/Providers/cart.dart';
import 'package:shop_app/Providers/order.dart';
import 'package:shop_app/Screens/orderScreen.dart';

import 'package:shop_app/Widgets/cart_item.dart';

class CartScreen extends StatelessWidget {
  static const routName = '/cartScreen';

  @override
  Widget build(BuildContext context) {
    final cartV = Provider.of<Cart>(context,listen: false);
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart SUm'),
      ),
      body: Column(
        children: [
          Card(
            margin: EdgeInsets.all(15),
            child: Padding(
              padding: EdgeInsets.all(9),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    'Total Sum',
                    style: TextStyle(fontSize: 20),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Spacer(),
                  Chip(
                    label: Text(
                      cartV.totalSum.toString(),
                      style: TextStyle(
                        color:
                            Theme.of(context).primaryTextTheme.headline6!.color,
                      ),
                    ),
                    backgroundColor: Theme.of(context).primaryColor,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  TextButton(
                    onPressed: () {
                      Provider.of<Orders>(context, listen: false).addOrder(
                        cartV.totalSum,
                        cartV.items.values.toList(),
                      );
                      cartV.clear();
                      Navigator.pushNamed(context, OrderScreen.routName);
                    },
                    child: Text('Order Now'),
                  )
                ],
              ),
            ),
          ),
          Expanded(
              child: ListView.builder(
            itemBuilder: (ctx, i) => CartItemNext(
              id: cartV.items.values.toList()[i].prodId,
              prodID: cartV.items.keys.toList()[i],
              price: cartV.items.values.toList()[i].price,
              quantity: cartV.items.values.toList()[i].quantity,
              tital: cartV.items.values.toList()[i].tital,
            ),
            itemCount: cartV.items.length,
          ))
        ],
      ),
    );
  }
}
