import 'package:flutter/material.dart';

class OrderItem extends StatelessWidget {
  // const OrderItem({Key? key}) : super(key: key);
  final String name;
  final String count;
  final String price;
  final int length;
  final int index;
  // final String lat;
  // final String long;
  // final bool length;

  OrderItem({
    required this.name,
    required this.count,
    required this.price,
    required this.index,
    required this.length,
    // required this.lat,
    // required this.long,
    // required this.length
  });

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Column(
      children: [
        ListTile(
          leading: Text(
            '$name x$count',
          ),
          // trailing: Text('₹ $price'),
          trailing: buildRichText(double.parse(price) * double.parse(count)),
        ),
        length == index + 1
            ? Container()
            : Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: width * 0.02, vertical: 0),
                child: Divider(
                  height: height * 0.02,
                  color: const Color(0xffeaeaea),
                  thickness: 1,
                ),
              )
      ],
    );
  }

  Widget buildRichText(double price) {
    return RichText(
      text: TextSpan(
        children: [
          const TextSpan(
            text: '₹ ',
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
          ),
          TextSpan(
            text: price.toStringAsFixed(1),
            style: const TextStyle(
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
