import 'package:flutter/material.dart';
import '../constants.dart';
import '../screens/order_delivered_details_screen.dart';

class OrderWidget extends StatefulWidget {
  // const OrderWidget({Key? key}) : super(key: key);
  final String name;
  final String type;
  final String price;

  OrderWidget({
    required this.name,
    required this.type,
    required this.price,
  });

  @override
  State<OrderWidget> createState() => _OrderWidgetState();
}

class _OrderWidgetState extends State<OrderWidget> {
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return GestureDetector(
      onTap: () => Navigator.of(context).push(
        MaterialPageRoute<void>(
          builder: (BuildContext context) => OrderDeliveredDetailsScreen(),
        ),
      ),
      child: Container(
        padding: EdgeInsets.symmetric(
            vertical: mediaQuery.size.height * 0.002, horizontal: 0),
        margin: EdgeInsets.only(bottom: mediaQuery.size.height * 0.01),
        decoration: BoxDecoration(
          color: const Color(0XFF30353b),
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: ListTile(
          // isThreeLine: true,
          leading: ClipRRect(
            borderRadius: BorderRadius.circular(10.0),
            child: Container(
              // margin: EdgeInsets.only(bottom: mediaQuery.size.height * 0.01),
              decoration: BoxDecoration(
                border: Border.all(
                  color: Theme.of(context).colorScheme.secondary,
                  width: 2.0,
                ),
              ),
              child: Image.asset('assets/images/food.jpeg'),
            ),
          ),
          title: Text(
            widget.name,
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          subtitle: Column(
            children: [
              Row(
                children: [
                  Text(
                    widget.type,
                    style: kSubTextStyle,
                  ),
                  SizedBox(
                    width: 12,
                  ),
                  Text(
                    'Continental',
                    style: kSubTextStyle,
                  ),
                ],
              ),
            ],
          ),
          trailing: Container(
            width: 60,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Text(
                      '₹ ',
                      style: TextStyle(color: Colors.white),
                    ),
                    Text(
                      widget.price,
                      style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  ],
                ),
                // Text(
                //   'Paid',
                //   style:
                //       TextStyle(color: Theme.of(context).colorScheme.secondary),
                // ),
                // SizedBox(
                //   height: 5.0,
                // ),
                // Text(
                //   'On the way',
                //   style: TextStyle(
                //     color: Theme.of(context).primaryColor,
                //     fontSize: 10.0,
                //   ),
                // )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
