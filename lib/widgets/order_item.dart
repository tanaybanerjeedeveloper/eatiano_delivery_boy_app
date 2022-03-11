import 'package:flutter/material.dart';

class OrderItem extends StatelessWidget {
  // const OrderItem({Key? key}) : super(key: key);
  final String name;
  final String count;
  final String price;

  OrderItem({required this.name, required this.count, required this.price});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Text(
        '$name x$count',
      ),
      trailing: Text('₹ $price'),
    );
  }
}
