import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/Providers/cart.dart';
import 'package:shop_app/Providers/product.dart';
import 'package:shop_app/Screens/product_detail_screen.dart';

class ProductItemWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final product = Provider.of<Product>(context);
    final cartval = Provider.of<Cart>(
      context,
    );
    return ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: GestureDetector(
        onTap: () {
          Navigator.pushNamed(
            context,
            ProductDetailScreen.routName,
            arguments: product.id,
          );
        },
        child: GridTile(
          child: Image.network(
            product.imageUrl,
            fit: BoxFit.cover,
          ),
          footer: GridTileBar(
            backgroundColor: Colors.black87,
            title: Text(
              product.title,
              textAlign: TextAlign.center,
            ),
            leading: IconButton(
                icon: product.isFavourite == true
                    ? Icon(Icons.favorite)
                    : Icon(Icons.favorite_border_outlined),
                onPressed: () {
                  product.toggleFavourite();
                },
                color: Theme.of(context).accentColor),
            trailing: IconButton(
              icon: Icon(Icons.shopping_basket),
              onPressed: () {
                cartval.addItem(product.id, product.title, product.price);
                ScaffoldMessenger.of(context).hideCurrentSnackBar();
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text('Item Added Succesfully!'),
                  duration: Duration(seconds: 2),
                  action: SnackBarAction(
                    label: Text('Undo').toString(),
                    onPressed: () {
                      cartval.removeSingleItem(product.id);
                    },
                  ),
                ));
              },
              color: Theme.of(context).accentColor,
            ),
          ),
        ),
      ),
    );
  }
}
