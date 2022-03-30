import 'package:flutter/material.dart';
import 'order_widget.dart';
import 'package:provider/provider.dart';
import '../model/order/order_provider.dart';

class OrderList extends StatefulWidget {
  @override
  State<OrderList> createState() => _OrderListState();
}

class _OrderListState extends State<OrderList> {
  bool _isLoading = true;

  @override
  void initState() {
    // TODO: implement initState
    Provider.of<OrderProvider>(context, listen: false).fetchData().then((_) {
      setState(() {
        _isLoading = false;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //final orders = Provider.of<OrderProvider>(context).getOrders;
    final currentOrders = Provider.of<OrderProvider>(context).getCurrentOrders;
    return _isLoading
        ? const Center(
            child: const CircularProgressIndicator(
              color: Colors.red,
            ),
          )
        : ListView.builder(
            shrinkWrap: false,
            itemBuilder: (ctx, index) {
              return OrderWidget(
                id: currentOrders[index]['order_unique_id'],
                name: currentOrders[index]['restaurant_name'],
                type: currentOrders[index]['status'],
                price: currentOrders[index]['transaction_amount'],
                image: currentOrders[index]['restaurant_image'],
                // rating: orders['data'][index]['rate'],
              );
            },
            itemCount: currentOrders.length,
          );
  }
}
