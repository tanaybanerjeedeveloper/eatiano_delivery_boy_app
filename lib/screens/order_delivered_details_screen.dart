import 'package:flutter/material.dart';
import '../constants.dart';

class OrderDeliveredDetailsScreen extends StatelessWidget {
  // const OrderDeliveredDetailsScreen({Key? key}) : super(key: key);
  static const id = 'order_delivered_details';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(25, 29, 33, 1),
        elevation: 0,
        title: const Center(
          child: Text(
            'Order Delivered Details',
            style: kAppBarTitle,
          ),
        ),
      ),
    );
  }
}
