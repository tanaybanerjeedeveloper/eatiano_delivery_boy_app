import 'package:flutter/material.dart';
import 'order_item.dart';

class OrderItemList extends StatelessWidget {
  List items = [];

  OrderItemList(this.items);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: items.length,
      shrinkWrap: true,
      itemBuilder: (ctx, index) {
        return OrderItem(
          // length:( items.length - 1) ? true : false,
          index: index,
          length: items.length,
          name: items[index]['product_name'],
          count: items[index]['quantity'],
          price: items[index]['product_price'],
        );
      },
    );
  }
}
