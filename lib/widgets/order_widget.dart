import 'package:flutter/material.dart';
import '../constants.dart';

class OrderWidget extends StatelessWidget {
  const OrderWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return Container(
      padding: EdgeInsets.symmetric(
          vertical: mediaQuery.size.height * 0.002, horizontal: 0),
      decoration: BoxDecoration(
        color: Color(0XFF30353b),
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: ListTile(
        isThreeLine: true,
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
          'King Burgers',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        subtitle: Column(
          children: [
            Row(
              children: [
                Icon(
                  Icons.star_rounded,
                  color: Theme.of(context).primaryColor,
                ),
                Text(
                  '4.9',
                  style: TextStyle(color: Theme.of(context).primaryColor),
                ),
                const SizedBox(
                  width: 3.0,
                ),
                Text(
                  '(124 ratings)',
                  style: kSubTextStyle,
                ),
                const SizedBox(
                  height: 5.0,
                ),
              ],
            ),
            Row(
              children: [
                Text(
                  'Burger',
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
          width: 50,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    '1109',
                    style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ],
              ),
              Text(
                'Paid',
                style:
                    TextStyle(color: Theme.of(context).colorScheme.secondary),
              ),
              SizedBox(
                height: 5.0,
              ),
              Text(
                'On the way',
                style: TextStyle(
                  color: Theme.of(context).primaryColor,
                  fontSize: 10.0,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
