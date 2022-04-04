import 'package:flutter/material.dart';
import '../widgets/order_list.dart';
import 'past_orders_screen.dart';
import '../constants.dart';
import 'package:provider/provider.dart';
import '../model/order/order_provider.dart';

class OrdersScreen extends StatefulWidget {
  @override
  State<OrdersScreen> createState() => _OrdersScreenState();
}

class _OrdersScreenState extends State<OrdersScreen> {
  // const OrdersScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    final oreders = Provider.of<OrderProvider>(context).getOrders;

    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromRGBO(25, 29, 33, 1),
          elevation: 0,
          centerTitle: true,
          title: const Text(
            'Orders',
            style: kAppBarTitle,
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                // SizedBox(
                //   height: height * 0.05,
                // ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Order List',
                      style: Theme.of(context).textTheme.headline6,
                    ),
                  ],
                ),
                SizedBox(
                  height: height * 0.02,
                ),
                Container(
                  height: height * 0.6,
                  child: OrderList(),
                ),
                SizedBox(
                  height: height * 0.01,
                ),
                TextButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute<void>(
                        builder: (BuildContext context) => PastOrdersScreen(),
                      ),
                    );
                  },
                  style: TextButton.styleFrom(
                    backgroundColor: Theme.of(context).colorScheme.secondary,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 40.0),
                  ),
                  child: const Text(
                    'Delivered Orders',
                    style: TextStyle(
                        fontSize: 15.0,
                        fontWeight: FontWeight.w600,
                        color: Colors.black),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
