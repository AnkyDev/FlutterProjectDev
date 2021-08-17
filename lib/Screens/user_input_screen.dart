import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:shop_app/Providers/product_provider.dart';
import 'package:shop_app/Widgets/user_input_item.dart';

class UserInputScreen extends StatelessWidget {
  static const routName = '/userinputitem';

  @override
  Widget build(BuildContext context) {
    final prodData = Provider.of<ProductProvide>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Your products'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.add),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: ListView.builder(
          itemBuilder: (_, i) => UserInputItem(
              prodData.items[i].imageUrl, prodData.items[i].title),
          itemCount: prodData.items.length,
        ),
      ),
    );
  }
}
