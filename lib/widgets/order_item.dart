import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopapp/providers/orders.dart' as ord;
import 'package:intl/intl.dart';

class OrderItem extends StatefulWidget {
  // final ord.OrderItem order;

  // OrderItem(this.order);

  @override
  _OrderItemState createState() => _OrderItemState();
}

class _OrderItemState extends State<OrderItem> {
  var _expanded = false;
  @override
  Widget build(BuildContext context) {
   final orderItem =Provider.of<ord.OrderItem>(context);
    return Card(
      margin: EdgeInsets.all(10.0),
      child: Column(
        children: <Widget>[
          ListTile(
            title: Text('\$ ${orderItem.amount}'),
            subtitle: Text(
              DateFormat('dd/MM/yyyy/hh:mm').format(orderItem.dateTime),
            ),
            trailing: IconButton(
              icon: Icon(_expanded ? Icons.expand_less : Icons.expand_more),
              onPressed: () {
                setState(() {
                  _expanded = !_expanded;
                });
              },
            ),
          ),
          if (_expanded)
            Container(
              padding:EdgeInsets.symmetric(horizontal:15,vertical:4),
              height: min(orderItem.products.length * 20.0 + 10.0, 180.0),
              child: ListView(
                  children: orderItem.products
                      .map((prod) => Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text(prod.title,
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  )),
                              Text(
                                '${prod.quantity}x \$ ${prod.price}',
                                style: TextStyle(
                                    fontSize: 18.0, color: Colors.grey ),
                              )
                            ],
                          ))
                      .toList()),
            )
        ],
      ),
    );
  }
}
