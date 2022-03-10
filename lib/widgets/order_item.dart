import 'package:flutter/material.dart';

class OrderItem extends StatelessWidget {
  // const OrderItem({Key? key}) : super(key: key);
  final String name;
  final int count;
  final String price;

  OrderItem({required this.name, required this.count, required this.price});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Color(0xffeaeaea),
            width: 1.0,
          ),
        ),
      ),
      child: ListTile(
        leading: Row(
          children: [
            Text(name),
            const SizedBox(
              width: 1.0,
            ),
            Text('x$count')
          ],
        ),
        trailing: Text('₹ $price'),
      ),
    );
  }
}
