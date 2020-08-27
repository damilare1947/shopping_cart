import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopapp/providers/products.dart';
import './product_item.dart';
import '../providers/products.dart';

class ProductsGrid extends StatelessWidget {
  final bool showFavs;
  ProductsGrid(this.showFavs);
  @override
  Widget build(BuildContext context) {
    final productsData = Provider.of<Products>(
        context); //to provide data to the constructor from the class
    final products = showFavs ? productsData.favoriteItems : productsData.items;
    return GridView.builder(
      padding: const EdgeInsets.all(10.0),
      itemCount: products.length,
      itemBuilder: (ctx, i) => ChangeNotifierProvider.value(
        // builder: (ctx) => products[i],
        value: products[i],
        child: ProductItem(
            // products[i].id, products[i].title, products[i].imageUrl
            ),
      ),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          //this specifies how many columns we should have
          crossAxisCount: 1, //amount of columns you want
          childAspectRatio: 3 / 2, //tall/wide
          crossAxisSpacing: 10, //spacing between columns in px
          mainAxisSpacing: //space between rows in px
              10), //this defines how every grid items should be build and specifies the number of columns that it should contain
    );
  }
}
