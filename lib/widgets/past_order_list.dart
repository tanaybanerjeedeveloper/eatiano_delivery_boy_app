import 'package:flutter/material.dart';
import 'order_widget.dart';

class PastOrderList extends StatelessWidget {
  // const PastOrderList({Key? key}) : super(key: key);
  final Map<String, dynamic> pastOrders = {
    "data": [
      {
        "id": 1,
        "name": "Peter Cat",
        "type": "Continental",
        "rating": "4.9",
        "numberOfRatings": "124 Ratings",
        "image": "assets/images/davide-cantelli-jpkfc5_d-DI-unsplash.png"
      },
      {
        "id": 2,
        "name": "Barista",
        "type": "Coffee",
        "rating": "4.9",
        "numberOfRatings": "124 Ratings",
        "image": "assets/images/allison-griffith-VCXk_bO97VQ-unsplash.png"
      },
      {
        "id": 3,
        "name": "Pizza Rush Hour",
        "type": "Italian",
        "rating": "4.9",
        "numberOfRatings": "124 Ratings",
        "image": "assets/images/davide-cantelli-jpkfc5_d-DI-unsplash.png"
      }
    ]
  };

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        itemBuilder: (ctx, index) {
          return OrderWidget(
            name: pastOrders['data'][index]['name'],
            type: pastOrders['data'][index]['type'],
            numberOfRatings: pastOrders['data'][index]['numberOfRatings'],
            rating: pastOrders['data'][index]['rating'],
          );
        },
        shrinkWrap: true,
        itemCount: pastOrders['data'].length,
      ),
    );
  }
}
