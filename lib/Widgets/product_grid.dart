import 'package:flutter/material.dart';
import 'package:shop_app/Providers/product_provider.dart';
import 'package:shop_app/Widgets/product_item.dart';
import 'package:provider/provider.dart';

class ProductGrid extends StatelessWidget {
  final bool mrFav;
  ProductGrid(this.mrFav);
  @override
  Widget build(BuildContext context) {
    final productData = Provider.of<ProductProvide>(context);
    final products = mrFav ? productData.favourite : productData.items;
    return GridView.builder(
      padding: const EdgeInsets.all(10),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      itemBuilder: (ctx, i) => ChangeNotifierProvider(
        create: (_) => products[i],
        child: ProductItemWidget(),
        
      ),
      itemCount: products.length,
    );
  }
}
