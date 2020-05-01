import 'package:flutter/material.dart';
// import 'package:shopapp/models/product.dart';
import 'package:shopapp/providers/products.dart';
import 'package:shopapp/widgets/product_item.dart';
import 'package:provider/provider.dart';

class ProductsGrid extends StatelessWidget {
  final bool showFavs;

  ProductsGrid(this.showFavs);
  @override
  Widget build(BuildContext context) {
    final productsData = Provider.of<Products>(context);
    final products = showFavs ? productsData.favoriteItems : productsData.items;
    return GridView.builder(
            padding: const EdgeInsets.all(10.0),
            itemCount: products.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 3 / 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
            ),
            itemBuilder: (ctx, i) => ChangeNotifierProvider.value(
              value: products[i],
              child: ProductItem(
                  // id: products[i].id,
                  // title: products[i].title,
                  // imageUrl: products[i].imageUrl,
                  ),
            ),
          );
  }
}
