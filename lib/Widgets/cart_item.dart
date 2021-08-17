import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/Providers/cart.dart';

class CartItemNext extends StatelessWidget {
  final String tital;
  final String prodID;
  final String id;
  final double price;
  final int quantity;
  CartItemNext({
    required this.id,
    required this.prodID,
    required this.price,
    required this.quantity,
    required this.tital,
  });

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: ValueKey(id),
      background: Container(
        color: Theme.of(context).errorColor,
        child: Icon(
          Icons.delete,
          size: 40,
          color: Colors.white,
        ),
        alignment: Alignment.centerRight,
        padding: EdgeInsets.only(right: 20),
      ),
      direction: DismissDirection.endToStart,
      confirmDismiss: (dir) {
        return showDialog(
          context: context,
          builder: (ctx) => AlertDialog(
            title: Text('Are u sure?'),
            content: Text('Do u want to remove items?'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(ctx).pop(false);
                },
                child: Text('No'),
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(ctx).pop(true);
                },
                child: Text('Yes'),
              )
            ],
          ),
        );
      },
      onDismissed: (dir) {
        Provider.of<Cart>(context, listen: false).removeItem(prodID);
      },
      child: Card(
        margin: EdgeInsets.symmetric(vertical: 5, horizontal: 15),
        child: Padding(
          padding: EdgeInsets.all(15),
          child: ListTile(
            leading: CircleAvatar(
              child: FittedBox(
                child: Text('\$$price'),
              ),
            ),
            title: Text(tital),
            subtitle: Text('Total : \$${(price * quantity)}'),
            trailing: Text('$quantity'),
          ),
        ),
      ),
    );
  }
}
