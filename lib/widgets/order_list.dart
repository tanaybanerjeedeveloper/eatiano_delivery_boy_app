import 'package:flutter/material.dart';
import 'order_widget.dart';

class OrderList extends StatelessWidget {
  // const OrderList({Key? key}) : super(key: key);
  final Map<String, dynamic> orders = {
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
        shrinkWrap: true,
        itemBuilder: (ctx, index) {
          return OrderWidget(
            name: orders['data'][index]['name'],
            type: orders['data'][index]['type'],
            numberOfRatings: orders['data'][index]['numberOfRatings'],
            rating: orders['data'][index]['rating'],
          );
        },
        itemCount: orders['data'].length,
      ),
    );
  }
}
