import 'package:flutter/material.dart';
import 'order_widget.dart';
import 'package:provider/provider.dart';
import '../model/order/order_provider.dart';

class PastOrderList extends StatefulWidget {
  @override
  State<PastOrderList> createState() => _PastOrderListState();
}

class _PastOrderListState extends State<PastOrderList> {
  bool _isLoading = true;

  @override
  void initState() {
    Provider.of<OrderProvider>(context, listen: false).fetchData().then((_) {
      setState(() {
        _isLoading = false;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final deliveredOrders =
        Provider.of<OrderProvider>(context).getDeliveredOrders;
    return _isLoading
        ? const Center(
            child: const CircularProgressIndicator(
              color: Colors.red,
            ),
          )
        : Expanded(
            child: ListView.builder(
              shrinkWrap: false,
              itemBuilder: (ctx, index) {
                return OrderWidget(
                  name: deliveredOrders[index]['restaurant_name'],
                  type: deliveredOrders[index]['status'],
                  price: deliveredOrders[index]['transaction_amount'],
                );
              },
              itemCount: deliveredOrders.length,
            ),
          );
  }
}
