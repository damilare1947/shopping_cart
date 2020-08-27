import 'package:flutter/material.dart';
import 'package:shopapp/providers/products.dart';
import 'package:shopapp/screens/edit_product_screen.dart';
import 'package:shopapp/screens/product_detail_screen.dart';
import 'package:provider/provider.dart';

class UserProductItem extends StatelessWidget {
  final String id;
  final String title;
  final String imageUrl;
  UserProductItem(this.id,this.title, this.imageUrl);
  @override
  Widget build(BuildContext context) {
    return ListTile(
        title: Text(title),
        leading: GestureDetector(
          onTap:(){
            Navigator.pushNamed(context, ProductDetailScreen.routeName,arguments: id);
           
          },
                  child: CircleAvatar(
            backgroundImage: NetworkImage(imageUrl),
          ),
        ),
        trailing: Container(
          width: 100.0,
          child: Row(
            children: <Widget>[
              IconButton(
                  icon: Icon(Icons.edit),
                  onPressed: () {
                   Navigator.of(context).pushNamed(EditProductScreen.routeName,arguments: id);
                  },
                  color: Theme.of(context).primaryColor),
              IconButton(
                icon: Icon(Icons.delete),
                onPressed: () {
                  Provider.of<Products>(context).deleteProduct(id);
                },
                color: Theme.of(context).errorColor,
              ),
            ],
          ),
        ));
  }
}
