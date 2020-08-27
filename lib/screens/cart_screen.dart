import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopapp/providers/cart.dart' show Cart;
import '../widgets/cart_item.dart';
import '../providers/orders.dart';

class CartScreen extends StatelessWidget {
  static const routeName = 'cart_screen.dart';
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);
    return Scaffold(
        appBar: AppBar(
          title: Text('Your Cart'),
        ),
        body: Column(
          children: <Widget>[
            Card(
              margin: EdgeInsets.all(15.0),
              child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        'Total',
                        style: TextStyle(fontSize: 20.0),
                      ),
                      Spacer(),
                      Chip(
                        label: Text('\$${cart.totalAmount.toStringAsFixed(2)}',
                            style: TextStyle(
                                color: Theme.of(context)
                                    .primaryTextTheme
                                    .title
                                    .color)),
                        backgroundColor: Theme.of(context).primaryColor,
                      ),
                      FlatButton(
                        textColor: Theme.of(context).primaryColor,
                        onPressed: () {
                          //returning dialog alert box after pressing order
                          return showDialog(
                            context: context,
                            builder: (ctx) => AlertDialog(
                              title: Text('Are you sure?'),
                              content: Text(
                                  'Are you sure you want to continue with the Order?'),
                              actions: <Widget>[
                                FlatButton(
                                  onPressed: () {
                                    Navigator.of(context).pop(false);
                                  },
                                  child: Text('No'),
                                ),
                                FlatButton(
                                  onPressed: () {
                                    Navigator.of(context).pop(true);
                                    Provider.of<Orders>(context).addOrder(
                                        cart.items.values.toList(),
                                        cart.totalAmount);
                                    cart.clear();
                                  },
                                  child: Text('Yes'),
                                ),
                              ],
                            ),
                          );
                        },
                        child: Text('Order Now'),
                      )
                    ],
                  )),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: cart.items.length,
                itemBuilder: (ctx, i) => CartItem(
                    cart.items.values.toList()[i].title,
                    cart.items.values.toList()[i].id,
                    cart.items.keys.toList()[i],
                    cart.items.values.toList()[i].price,
                    cart.items.values.toList()[i].quantity),
              ),
            )
          ],
        ));
  }
}
