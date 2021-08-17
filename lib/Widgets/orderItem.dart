import 'dart:math';

import 'package:flutter/material.dart';
import 'package:shop_app/Providers/order.dart';
// ignore: import_of_legacy_library_into_null_safe

// ignore: must_be_immutable
class OrderItemDesign extends StatefulWidget {
  final OrderItem order;

  OrderItemDesign(this.order);

  @override
  _OrderItemDesignState createState() => _OrderItemDesignState();
}

class _OrderItemDesignState extends State<OrderItemDesign> {
  var _expanded = false;

  var count = 0;

  @override
  Widget build(BuildContext context) {
    return Card(
        margin: EdgeInsets.all((10)),
        child: Column(
          children: [
            ListTile(
              title: Text('\$${widget.order.amount}'),
              subtitle: Text(''), //date'
              trailing: IconButton(
                icon: _expanded
                    ? Icon(Icons.expand_less)
                    : Icon(Icons.expand_more),
                onPressed: () {
                  setState(() {
                    _expanded = !_expanded;
                  });
                },
              ),
            ),
            if (_expanded)
              Container(
                height: min(widget.order.products.length * 20.0 + 100, 180),
                child: ListView(
                    children: widget.order.products
                        .map((e) => Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  e.tital,
                                  style: TextStyle(
                                      fontSize: 19,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  '${e.quantity}x \$${e.price}',
                                  style: TextStyle(fontSize: 19),
                                )
                              ],
                            ))
                        .toList()),
              ),
          ],
        ));
  }
}
