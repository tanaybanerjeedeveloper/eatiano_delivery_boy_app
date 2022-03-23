import 'package:flutter/material.dart';
import 'order_widget.dart';
import 'package:provider/provider.dart';
import '../model/order/order_provider.dart';

class OrderList extends StatefulWidget {
  @override
  State<OrderList> createState() => _OrderListState();
}

class _OrderListState extends State<OrderList> {
  // const OrderList({Key? key}) : super(key: key);
  // final Map<String, dynamic> orders = {
  //   "data": [
  //     {
  //       "id": 1,
  //       "name": "Peter Cat",
  //       "type": "Continental",
  //       "rating": "4.9",
  //       "numberOfRatings": "124 Ratings",
  //       "image": "assets/images/davide-cantelli-jpkfc5_d-DI-unsplash.png"
  //     },
  //     {
  //       "id": 2,
  //       "name": "Barista",
  //       "type": "Coffee",
  //       "rating": "4.9",
  //       "numberOfRatings": "124 Ratings",
  //       "image": "assets/images/allison-griffith-VCXk_bO97VQ-unsplash.png"
  //     },
  //     {
  //       "id": 3,
  //       "name": "Pizza Rush Hour",
  //       "type": "Italian",
  //       "rating": "4.9",
  //       "numberOfRatings": "124 Ratings",
  //       "image": "assets/images/davide-cantelli-jpkfc5_d-DI-unsplash.png"
  //     },
  //     {
  //       "id": 4,
  //       "name": "Pizza Rush Hour",
  //       "type": "Italian",
  //       "rating": "4.9",
  //       "numberOfRatings": "124 Ratings",
  //       "image": "assets/images/davide-cantelli-jpkfc5_d-DI-unsplash.png"
  //     }
  //   ]
  // };
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
    final orders = Provider.of<OrderProvider>(context).getOrders;
    return _isLoading
        ? const Center(
            child: const CircularProgressIndicator(
              color: Colors.red,
              backgroundColor: Color(0xfffbb1bd),
            ),
          )
        : ListView.builder(
            shrinkWrap: false,
            itemBuilder: (ctx, index) {
              return OrderWidget(
                name: orders['data'][index]['order_status'],
                type: orders['data'][index]['buying_price'],
                numberOfRatings: orders['data'][index]['marchent_name'],
                rating: orders['data'][index]['order_unique_id'],
              );
            },
            itemCount: orders['data'].length,
          );
  }
}
