import 'package:flutter/material.dart';
import 'package:shop_app/Screens/edit_product_screen.dart';

class UserInputItem extends StatelessWidget {
  final String imageUrl;
  final String tital;
  UserInputItem(this.imageUrl, this.tital);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(tital),
      leading: CircleAvatar(
        backgroundImage: NetworkImage(imageUrl),
      ),
      trailing: Container(
        width: 100,
        child: Row(
          children: [
            IconButton(
              onPressed: () {
                Navigator.pushNamed(context, EditProductScreen.routName);
              },
              icon: Icon(Icons.edit),
              color: Theme.of(context).primaryColor,
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.delete),
              color: Theme.of(context).errorColor,
            ),
          ],
        ),
      ),
    );
  }
}
