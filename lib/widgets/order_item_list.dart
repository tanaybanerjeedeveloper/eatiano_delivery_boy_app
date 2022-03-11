import 'package:flutter/material.dart';
import 'order_item.dart';

class OrderItemList extends StatelessWidget {
  // const OrderItemList({Key? key}) : super(key: key);
  final List<Map<String, dynamic>> items = [
    {
      'name': 'cheese burger',
      'count': '2',
      'price': '200',
    },
    {
      'name': 'chicken burger',
      'count': '1',
      'price': '100',
    },
    {
      'name': 'cheese burger max',
      'count': '2',
      'price': '200',
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        itemCount: items.length,
        shrinkWrap: true,
        itemBuilder: (ctx, index) {
          return OrderItem(
            name: items[index]['name'],
            count: items[index]['count'],
            price: items[index]['price'],
          );
        },
      ),
    );
  }
}
